import 'package:adhikar2_o/models/userModel.dart';
import 'package:adhikar2_o/provider/userProvider.dart';
import 'package:adhikar2_o/screens/aiServices.dart';
import 'package:adhikar2_o/screens/applyForLawyerScreen.dart';
import 'package:adhikar2_o/screens/auth/loginScreen.dart';
import 'package:adhikar2_o/screens/auth/siginScreen.dart';
import 'package:adhikar2_o/screens/drawerScreens/emergencyScreen.dart';
import 'package:adhikar2_o/screens/drawerScreens/filters.dart';
import 'package:adhikar2_o/screens/drawerScreens/forms.dart';
import 'package:adhikar2_o/screens/verfificationPendingScreen.dart';
import 'package:adhikar2_o/services/authServices.dart';
import 'package:adhikar2_o/utils/colors.dart';
import 'package:adhikar2_o/widgets/drawerItems.dart';
import 'package:adhikar2_o/widgets/homeLaw.dart';
import 'package:adhikar2_o/widgets/judgement.dart';
import 'package:adhikar2_o/widgets/viewAllCard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List circleColors = [
    const Color.fromRGBO(93, 161, 204, 200),
    const Color.fromARGB(56, 241, 193, 130),
  ];
  List boxColors = [
    const Color.fromARGB(255, 97, 160, 219),
    const Color.fromARGB(235, 247, 93, 93),
  ];

// navigate to ai services
  void navigateToAIServices() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AIServices();
    }));
  }

  loginForApplyingForLawyer() {
    AlertDialog(
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

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    // LawyerModel lawyerModel = Provider.of<LawyerProvider>(context).getLawyer;

    return Scaffold(
      drawerScrimColor: Colors.transparent,
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const SizedBox(
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: primaryColor,
                          child: CircleAvatar(
                            radius: 38,
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(
                              'https://image.cdn2.seaart.me/2024-09-16/crjon2de878c739kmukg-2/363d4f7dce80aad62b4b1cdc12bb1ec6_high.webp',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'username',
                              style:
                                  TextStyle(color: primaryColor, fontSize: 23),
                            ),
                            Text(
                              'Student',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.only(left: 35.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const FiltersScreen();
                              }));
                            },
                            child: const DrawerItems(
                                image: 'assets/icons/ic_filter.png',
                                name: 'Filter'),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const DrawerItems(
                                image: 'assets/icons/ic_fines.png',
                                name: 'Fines'),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const DrawerItems(
                                image: 'assets/icons/ic_contact_us.png',
                                name: 'Contact us'),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const FormsScreen();
                              }));
                            },
                            child: const DrawerItems(
                                image: 'assets/icons/ic_forms.png',
                                name: 'Forms'),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const EmergencyScreen();
                              }));
                            },
                            child: const DrawerItems(
                                image: 'assets/icons/ic_emergency.png',
                                name: 'Emergency'),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const DrawerItems(
                                image: 'assets/icons/ic_feedback.png',
                                name: 'Feedback'),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const DrawerItems(
                                image: 'assets/icons/ic_rate_us.png',
                                name: 'Rate us'),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                if (_auth.currentUser == null) {
                                  return AlertDialog(
                                    title: const Text(
                                      'It seems you are not authenticated..!\nTo access AI services you need to signup',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return const LoginScreen();
                                            }));
                                          },
                                          child: const Text('Login')),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return const SignUpScreen();
                                            }));
                                          },
                                          child: const Text('Signup')),
                                    ],
                                  );
                                }
                                UserModel userModel =
                                    Provider.of<UserProvider>(context).getUser;
                                return userModel.type == 'pending'
                                    ? const VerificatoinPendingScreen()
                                    : const ApplyForLawyerScreen();
                              }));
                            },
                            child: const DrawerItems(
                                image: 'assets/icons/ic_lawyer.png',
                                name: 'Apply for Adhikar Lawyer'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  GestureDetector(
                    onTap: () {
                      AuthServices().logout();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginScreen();
                      }));
                    },
                    child: SizedBox(
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icons/ic_logout.png',
                            height: 20,
                            color: primaryColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Logout',
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: primaryColor,
              statusBarIconBrightness: Brightness.light),
          iconTheme: const IconThemeData(color: Colors.white),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                color: Color.fromRGBO(16, 32, 55, 1),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
          ),
          title: Row(
            children: [
              Expanded(
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(44, 67, 94, 0.671),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    child: Center(
                      child: TextFormField(
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          prefixIcon: Image.asset(
                            'assets/icons/ic_search.png',
                            height: 20,
                            color: Colors.white,
                          ),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide.none),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide.none),
                          hintText: 'Search',
                          hintStyle: const TextStyle(color: Colors.grey),
                        ),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  navigateToAIServices();
                },
                child: CircleAvatar(
                  radius: 22,
                  backgroundColor: primaryColor,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.white,
                    child: Image.asset('assets/icons/ic_chatbot.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Laws',
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  ViewAllButton(),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 210,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return HomeLawCard(
                      content:
                          'The Indian Penal Code is the official criminal code of India. It is a comprehensive code intended.',
                      number: '22',
                      title: 'C.R.P.C Act',
                      year: '2015',
                      circleColor: circleColors[index % circleColors.length],
                      boxColor: boxColors[index % boxColors.length],
                    );
                  }),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Judgements',
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  ViewAllButton(),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 170,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return JudgementCard(
                      content:
                          'AK Gopalan was a Communist leader who was kept in the Madras Jail in 1950.',
                      title: 'A.K Gopalan vs. State of Madras, 1950',
                      circleColor: circleColors[index % circleColors.length],
                    );
                  }),
            ),
            // const Text('data')
          ],
        ),
      ),
    );
  }
}
