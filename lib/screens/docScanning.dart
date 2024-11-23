import 'dart:io';

import 'package:adhikar2_o/models/userModel.dart';
import 'package:adhikar2_o/provider/userProvider.dart';
import 'package:adhikar2_o/utils/colors.dart';
import 'package:adhikar2_o/utils/snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class DocumentScanning extends StatefulWidget {
  const DocumentScanning({super.key});

  @override
  State<DocumentScanning> createState() => _DocumentScanningState();
}

class _DocumentScanningState extends State<DocumentScanning> {
  XFile? pickedImage;
  String myText = '';
  bool scanning = false;
  final gemini = Gemini.instance;
  String res = '';
  final ImagePicker imagePicker = ImagePicker();
  FirebaseAuth _auth = FirebaseAuth.instance;

  getImage(ImageSource ourSource) async {
    XFile? result = await imagePicker.pickImage(source: ourSource);
    if (result != null) {
      setState(() {
        pickedImage = result;
      });
      await performTextRecognition();
    }
  }

  performTextRecognition() async {
    setState(() {
      scanning = true;
    });
    try {
      final inputImage = InputImage.fromFilePath(pickedImage!.path);
      final textrecognizer = TextRecognizer();
      final recognizedText = await textrecognizer.processImage(inputImage);
      setState(() {
        myText = recognizedText.text;
        scanning = false;
      });
    } catch (e) {
      print('Error during recognizing text');
    }
  }

  void docSummary() async {
    UserModel userModel =
        Provider.of<UserProvider>(context, listen: false).getUser;
    await getImage(ImageSource.gallery);
    setState(() {
      scanning = true;
    });
    gemini
        .text(
            "$myText this is a legal document. using complete legal language and easy to understand summarise in short this legal document.")
        .then((value) async {
      setState(() {
        res = value!.output.toString();
      });
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot userDoc = await transaction.get(
            FirebaseFirestore.instance.collection("Users").doc(userModel.uid));

        double currentCredits = userDoc["credits"] ?? 0;
        double newCredits = (currentCredits - 2).clamp(0, currentCredits);

        transaction.update(
            FirebaseFirestore.instance.collection("Users").doc(userModel.uid),
            {"credits": newCredits});
      });
    }).catchError((e) {
      showSnackbar(context, e.toString());
    });

    setState(() {
      scanning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: primaryColor,
            statusBarIconBrightness: Brightness.light),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'NyaySahayak',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/ic_adhikar_coins.png',
                  height: 20,
                ),
                const SizedBox(
                  width: 5,
                ),
                StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("Users")
                      .doc(_auth.currentUser!.uid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }

                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }

                    if (!snapshot.hasData || !snapshot.data!.exists) {
                      return const Text('No Data');
                    }

                    // Fetch credits from Firestore document
                    var currentCredits =
                        snapshot.data!['credits'].toString();

                    return Text(
                      '$currentCredits credits', // Display current credits
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          docSummary();
        },
        child: SizedBox(
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: const Card(
              elevation: 20,
              color: primaryColor,
              child: Center(
                  child: Text(
                'Upload Documnet',
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
            )),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: scanning
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    pickedImage != null
                        ? SizedBox(
                            height: 300,
                            width: 500,
                            child: Image.file(File(pickedImage!.path)),
                          )
                        : const SizedBox(),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      res.toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
