import 'package:adhikar2_o/models/userModel.dart';
import 'package:adhikar2_o/provider/userProvider.dart';
import 'package:adhikar2_o/screens/auth/loginScreen.dart';
import 'package:adhikar2_o/screens/auth/siginScreen.dart';
import 'package:adhikar2_o/screens/helpAndSupport.dart';
import 'package:adhikar2_o/screens/privacy.dart';
import 'package:adhikar2_o/screens/security.dart';
import 'package:adhikar2_o/services/authServices.dart';
import 'package:adhikar2_o/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController statecontroller = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController rolecontroller = TextEditingController();

  final List<String> states = [
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal",
    "Andaman and Nicobar Islands",
    "Chandigarh",
    "Dadra and Nagar Haveli and Daman and Diu",
    "Lakshadweep",
    "Delhi (National Capital Territory)",
    "Puducherry",
    "Ladakh",
    "Jammu and Kashmir",
  ];
  final List<String> role = ["Student", "Lawyer", "Citizen"];

  @override
  void dispose() {
    super.dispose();
    statecontroller.dispose();
    rolecontroller.dispose();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser == null) {
      return AlertDialog(
        title: const Text(
          'It seems you are not authenticated..!\nTo access AI services you need to signup',
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
    UserModel userModel = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: primaryColor,
            statusBarIconBrightness: Brightness.light),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        radius: 66,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                          'https://image.cdn2.seaart.me/2024-09-16/crjon2de878c739kmukg-2/363d4f7dce80aad62b4b1cdc12bb1ec6_high.webp',
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: -0,
                        right: 10,
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.black,
                          child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.edit,
                                size: 20,
                                color: Colors.grey,
                              )),
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  '${userModel.firstName} ${userModel.lastName}',
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Account',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 240, 240, 240)),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const PrivacyPage();
                            }));
                          },
                          child: iconAndTextRow(
                              'Privacy', 'assets/icons/ic_privacy.png')),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const SecurityPage();
                            }));
                          },
                          child: iconAndTextRow(
                              'Security', 'assets/icons/ic_security.png')),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Support',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 240, 240, 240)),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const HelpAndSupport();
                          }));
                        },
                        child: iconAndTextRow(
                            'Help and Support', 'assets/icons/ic_help.png'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      iconAndTextRow(
                          'Terms and Policies', 'assets/icons/ic_terms.png'),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Actions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 240, 240, 240)),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      iconAndTextRow('Report', 'assets/icons/ic_report.png'),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                          onTap: () {
                            AuthServices().logout();
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return const LoginScreen();
                            }));
                          },
                          child: iconAndTextRow(
                              'Logout', 'assets/icons/ic_logout.png')),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconAndTextRow(text, icon) {
    return Row(
      children: [
        Image.asset(
          icon,
          height: 20,
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
