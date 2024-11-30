import 'package:adhikar2_o/models/userModel.dart';
import 'package:adhikar2_o/provider/userProvider.dart';
import 'package:adhikar2_o/screens/auth/loginScreen.dart';
import 'package:adhikar2_o/screens/auth/siginScreen.dart';
import 'package:adhikar2_o/screens/policies/helpAndSupport.dart';
import 'package:adhikar2_o/screens/policies/privacy.dart';
import 'package:adhikar2_o/screens/policies/security.dart';
import 'package:adhikar2_o/services/authServices.dart';
import 'package:adhikar2_o/services/imagePckerServices.dart';
import 'package:adhikar2_o/services/storageServices.dart';
import 'package:adhikar2_o/utils/colors.dart';
import 'package:adhikar2_o/utils/snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
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
  bool loading = false;
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
  Uint8List? profImage;
  @override
  void dispose() {
    super.dispose();
    statecontroller.dispose();
    rolecontroller.dispose();
  }

  void selectProfImage() async {
   try{
     setState(() {
      loading=true;
    });
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() async {
      profImage = im;
      String profImageUrl = await StorageServices()
          .uploadImageToStorage('profileImage', profImage!);

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(_auth.currentUser!.uid)
          .update({
        'profImage': profImageUrl,
      });

      await FirebaseFirestore.instance
          .collection('Lawyers')
          .doc(_auth.currentUser!.uid)
          .update({
        'profImage': profImageUrl,
      });
    });
     setState(() {
      loading=false;
    });
    showSnackbar(context, 'Image updated successfully');
   }catch(err){
      setState(() {
      loading=false;
    });
    showSnackbar(context, err.toString());
   }
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
    // LawyerModel lawyerModel =
    //     Provider.of<LawyerProvider>(context, listen: false).getLawyer;
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
      body: loading
          ? Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: StreamBuilder(
                          stream: userModel.type == "User"
                              ? FirebaseFirestore.instance
                                  .collection('Users')
                                  .doc(userModel.uid)
                                  .snapshots()
                              : FirebaseFirestore.instance
                                  .collection('Lawyers')
                                  .doc(userModel.uid)
                                  .snapshots(),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator(
                                      color: primaryColor));
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
                            } else if (!snapshot.hasData ) {
                              return const Center(
                                  child: Text("No Meetings pending"));
                            } else {
                              var profdata = snapshot.data.data();
                            
                              return Stack(
                                children: [
                                  userModel.type == "User"
                                      ? userModel.profImage == null
                                          ? CircleAvatar(
                                              radius: 70,
                                              backgroundColor: Colors.black,
                                              child: CircleAvatar(
                                                radius: 66,
                                                backgroundColor: Colors.white,
                                                backgroundImage: NetworkImage(
                                                  'https://image.cdn2.seaart.me/2024-09-16/crjon2de878c739kmukg-2/363d4f7dce80aad62b4b1cdc12bb1ec6_high.webp',
                                                ),
                                              ),
                                            )
                                          : CircleAvatar(
                                              radius: 70,
                                              backgroundColor: Colors.black,
                                              child: CircleAvatar(
                                                  radius: 66,
                                                  backgroundColor: Colors.white,
                                                  backgroundImage: NetworkImage(
                                                      profdata['profImage'])),
                                            )
                                      : CircleAvatar(
                                          radius: 70,
                                          backgroundColor: Colors.black,
                                          child: CircleAvatar(
                                              radius: 66,
                                              backgroundColor: Colors.white,
                                              backgroundImage: NetworkImage(
                                                 profdata['profImage'])),
                                        ),
                                  Positioned(
                                      bottom: -0,
                                      right: 10,
                                      child: GestureDetector(
                                        onTap: () {
                                          selectProfImage();
                                        },
                                        child: const CircleAvatar(
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
                                        ),
                                      ))
                                ],
                              );
                            }
                          }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        '${userModel.firstName} ${userModel.lastName}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Account',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
                                    'Privacy',
                                    'assets/icons/ic_privacy.png',
                                    Colors.green)),
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
                                    'Security',
                                    'assets/icons/ic_security.png',
                                    Colors.blue)),
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                                onTap: () {},
                                child: iconAndTextRow(
                                    'Credits',
                                    'assets/icons/ic_adhikar_coins.png',
                                    Colors.yellow)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Support',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
                              child: iconAndTextRow('Help and Support',
                                  'assets/icons/ic_help.png', Colors.purple),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            iconAndTextRow('Terms and Policies',
                                'assets/icons/ic_terms.png', Colors.black),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Actions',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
                            iconAndTextRow('Report',
                                'assets/icons/ic_report.png', Colors.red),
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    loading = true;
                                  });
                                  AuthServices().logout();
                                  setState(() {
                                    loading = false;
                                  });
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const LoginScreen();
                                  }));
                                },
                                child: iconAndTextRow('Logout',
                                    'assets/icons/ic_logout.png', Colors.red)),
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

  Widget iconAndTextRow(text, icon, Color color) {
    return Row(
      children: [
        Image.asset(
          icon,
          height: 20,
          color: color,
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
