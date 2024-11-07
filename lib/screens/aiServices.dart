import 'package:adhikar2_o/screens/auth/loginScreen.dart';
import 'package:adhikar2_o/screens/auth/siginScreen.dart';
import 'package:adhikar2_o/screens/chatScreen.dart';
import 'package:adhikar2_o/screens/docScanning.dart';
import 'package:adhikar2_o/utils/colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AIServices extends StatefulWidget {
  const AIServices({super.key});

  @override
  State<AIServices> createState() => _AIServicesState();
}

class _AIServicesState extends State<AIServices> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    

    return _auth.currentUser == null
        ? AlertDialog(
            title: const Text(
                'It seems you are not authenticated..!\nTo access AI services you need to signup',style: TextStyle(color: Colors.black,fontSize: 18),),
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
          )
        : Scaffold(
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
            ),
            body: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const DocumentScanning();
                      }));
                    },
                    child: SizedBox(
                        height: 70,
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          elevation: 20,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: DottedBorder(
                                    color: Colors.red,
                                    strokeCap: StrokeCap.round,
                                    strokeWidth: 1.3,
                                    borderType: BorderType.RRect,
                                    radius: const Radius.circular(100),
                                    dashPattern: const [3, 5],
                                    child: const SizedBox(
                                      height: 40,
                                      width: 40,
                                      child: const Center(
                                          child: Text(
                                        '01',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    )),
                              ),
                              const Expanded(
                                child: const Text(
                                  'Document Scanning',
                                  style: TextStyle(
                                      color: primaryColor, fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 18.0),
                                child: Image.asset(
                                  'assets/icons/ic_forward.png',
                                  height: 15,
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const ChatScreen();
                      }));
                    },
                    child: SizedBox(
                        height: 70,
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          elevation: 20,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: DottedBorder(
                                    color: Colors.blue,
                                    strokeCap: StrokeCap.round,
                                    strokeWidth: 1.3,
                                    borderType: BorderType.RRect,
                                    radius: const Radius.circular(100),
                                    dashPattern: const [3, 5],
                                    child: const SizedBox(
                                      height: 40,
                                      width: 40,
                                      child: const Center(
                                          child: Text(
                                        '02',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    )),
                              ),
                              const Expanded(
                                child: const Text(
                                  'ChatBot',
                                  style: TextStyle(
                                      color: primaryColor, fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 18.0),
                                child: Image.asset(
                                  'assets/icons/ic_forward.png',
                                  height: 15,
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            ),
          );
  }
}
