import 'package:adhikar2_o/models/userModel.dart';
import 'package:adhikar2_o/provider/userProvider.dart';
import 'package:adhikar2_o/screens/auth/loginScreen.dart';
import 'package:adhikar2_o/screens/auth/siginScreen.dart';
import 'package:adhikar2_o/screens/myMeetings.dart';
import 'package:adhikar2_o/utils/colors.dart';
import 'package:adhikar2_o/widgets/customButton.dart';
import 'package:adhikar2_o/widgets/customTextfield.dart';
import 'package:dropdownfield2/dropdownfield2.dart';
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Stack(
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
              const SizedBox(
                height: 30,
              ),
              Text(
                '${userModel.firstName} ${userModel.lastName}',
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.email),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(userModel.email,
                      style: const TextStyle(fontSize: 14, color: Colors.grey))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Type',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(userModel.type,
                      style: const TextStyle(fontSize: 14, color: Colors.grey))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.password),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text('******',
                      style: TextStyle(fontSize: 14, color: Colors.grey))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              // CustomTextField(
              //   controller: nameController,
              //   hinttext: 'Enter your name',
              //   keyboardType: TextInputType.text,
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // CustomTextField(
              //     controller: phoneController,
              //     hinttext: 'Enter your phone',
              //     keyboardType: TextInputType.phone),
              // const SizedBox(
              //   height: 10,
              // ),
              // CustomTextField(
              //     controller: emailController,
              //     hinttext: 'Enter your email',
              //     keyboardType: TextInputType.emailAddress),
              // const SizedBox(
              //   height: 10,
              // ),
              // Row(
              //   children: [
              //     Expanded(
              //       child: DropDownField(
              //         enabled: true,
              //         textStyle:
              //             const TextStyle(color: Colors.black, fontSize: 16),
              //         controller: statecontroller,
              //         hintText: 'Select your State',
              //         hintStyle:
              //             const TextStyle(color: Colors.grey, fontSize: 14),
              //         items: states,
              //         itemsVisibleInDropdown: 5,
              //         onValueChanged: (value) {
              //           setState(() {
              //             statecontroller.text = value;
              //           });
              //         },
              //       ),
              //     ),
              //     const Padding(
              //       padding: EdgeInsets.only(right: 16.0),
              //       child: Text(
              //         "*",
              //         style: TextStyle(color: Colors.red),
              //       ),
              //     )
              //   ],
              // ),
              // Row(
              //   children: [
              //     Expanded(
              //       child: DropDownField(
              //         enabled: true,
              //         textStyle:
              //             const TextStyle(color: Colors.black, fontSize: 16),
              //         controller: rolecontroller,
              //         hintText: 'Select your Role',
              //         hintStyle:
              //             const TextStyle(color: Colors.grey, fontSize: 14),
              //         items: role,
              //         itemsVisibleInDropdown: 3,
              //         onValueChanged: (value) {
              //           setState(() {
              //             rolecontroller.text = value;
              //           });
              //         },
              //       ),
              //     ),
              //     const Padding(
              //       padding: EdgeInsets.only(right: 16.0),
              //       child: Text(
              //         "*",
              //         style: TextStyle(color: Colors.red),
              //       ),
              //     )
              //   ],
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              // const CustomButton(
              //   text: 'Finish',
              // ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const MyMeetingsScreen();
                    }));
                  },
                  child: const Text('My meetings'))
            ],
          ),
        ),
      ),
    );
  }
}
