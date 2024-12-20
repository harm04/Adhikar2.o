import 'package:adhikar2_o/screens/auth/loginScreen.dart';
import 'package:adhikar2_o/screens/auth/siginScreen.dart';
import 'package:adhikar2_o/screens/community/postScreen.dart';
import 'package:adhikar2_o/utils/colors.dart';
import 'package:adhikar2_o/widgets/postCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:popover/popover.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser == null) {
      return AlertDialog(
        title: const Text(
          'It seems you are not authenticated..!\nTo access community you need to signup',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const LoginScreen();
                }));
              },
              child: const Text('Login')),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const SignUpScreen();
                }));
              },
              child: const Text('Signup')),
        ],
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: primaryColor,
          statusBarIconBrightness: Brightness.light,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Community',
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: Builder(
        builder: (BuildContext context) {
          return FloatingActionButton(
            onPressed: () {
              showPopover(
                context: context,
                height: 80,
                width: 250,
                direction: PopoverDirection.top, // Adjust direction if needed
                backgroundColor: Colors.white,
                bodyBuilder: (BuildContext context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return PostScreen(
                              anonymous: true,
                            );
                          }));
                        },
                        child: SizedBox(
                          height: 30,
                          child: Center(child: Text('Write anonymously')),
                        ),
                      ),
                      Divider(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return PostScreen(
                              anonymous: false,
                            );
                          }));
                        },
                        child: SizedBox(
                          height: 30,
                          child: Center(child: Text('Write publically')),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            backgroundColor: primaryColor,
            child: Image.asset(
              "assets/icons/ic_edit.png",
              color: Colors.white,
            ),
          );
        },
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Posts').snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(color: primaryColor));
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data.docs.isEmpty) {
              return const Center(child: Text("No Meetings pending"));
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var postdata = snapshot.data!.docs[index].data();
                  return PostCard(
                    downvotes: List.from(postdata['downvotes']),
                    uid: postdata['uid'].toString(),
                    postId: postdata['postId'].toString(),
                    firstName: postdata['firstName'].toString(),
                    isAnonymous: postdata['anonymous'],
                    lastName: postdata['lastName'].toString(),
                    post: postdata['post'].toString(),
                    upvotes: List.from(postdata['upvotes']),
                    date: postdata['date'],
                    profImage: postdata['profImage'].toString(),
                  );
                },
              );
            }
          }),
    );
  }
}
