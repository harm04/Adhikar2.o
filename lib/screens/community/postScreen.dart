import 'dart:math';

import 'package:adhikar2_o/models/userModel.dart';
import 'package:adhikar2_o/provider/userProvider.dart';
import 'package:adhikar2_o/services/postService.dart';
import 'package:adhikar2_o/utils/colors.dart';
import 'package:adhikar2_o/utils/snackbar.dart';
import 'package:adhikar2_o/widgets/customButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatefulWidget {
  final bool anonymous;
 
  const PostScreen({super.key, required this.anonymous,});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading = false;
  TextEditingController postController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    postController.dispose();
  }

 
  @override
  Widget build(BuildContext context) {
    UserModel userModel = Provider.of<UserProvider>(context).getUser;
    print(userModel.credits);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: primaryColor,
            statusBarIconBrightness: Brightness.light),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Post',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            )
          : Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 18),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: primaryColor,
                        backgroundImage: widget.anonymous?NetworkImage('https://image.cdn2.seaart.me/2024-09-16/crjon2de878c739kmukg-2/363d4f7dce80aad62b4b1cdc12bb1ec6_high.webp') :NetworkImage(userModel.profImage.toString()),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Expanded(
                        child: TextFormField(
                          maxLength: 1000,
                          maxLines: 3,
                          controller: postController,
                          decoration: InputDecoration(
                            hintText: 'Write here...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                      onTap: () async {
                        print(userModel.toJson());
                        setState(() {
                          loading = true;
                        });
                        final postId = Random().nextInt(10000);
                        String res = await PostService().uploadPost(
                            uid: _auth.currentUser!.uid,
                            postId: postId.toString(),
                            post: postController.text.toString(),
                            firstName: userModel.firstName.toString(),
                            lastName: userModel.lastName.toString(),
                            type: userModel.type.toString(),
                            profImage: userModel.profImage.toString(),
                            isAnonymous: widget.anonymous);
                        if (res == 'success') {
                          setState(() {
                            loading = false;
                          });
                          showSnackbar(context, 'Posted');
                          Navigator.pop(context);
                        } else {
                          setState(() {
                            loading = false;
                          });
                          showSnackbar(context, res);
                        }
                      },
                      child: CustomButton(text: 'Post')),
                ],
              ),
            ),
    );
  }
}
