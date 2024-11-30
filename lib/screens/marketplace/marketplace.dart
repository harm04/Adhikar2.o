import 'package:adhikar2_o/models/lawyerModel.dart';
import 'package:adhikar2_o/models/userModel.dart';
import 'package:adhikar2_o/provider/userProvider.dart';
import 'package:adhikar2_o/screens/auth/loginScreen.dart';
import 'package:adhikar2_o/screens/auth/siginScreen.dart';
import 'package:adhikar2_o/screens/meetings/lawyerCompletedMeetings.dart';
import 'package:adhikar2_o/screens/meetings/lawyerPendingMeetings.dart';
import 'package:adhikar2_o/screens/profile/lawyerProfile.dart';
import 'package:adhikar2_o/screens/search/searchScreen.dart';
import 'package:adhikar2_o/utils/colors.dart';
import 'package:adhikar2_o/widgets/lawyerCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MarketPlaceScreen extends StatefulWidget {
  const MarketPlaceScreen({super.key});

  @override
  State<MarketPlaceScreen> createState() => _MarketPlaceScreenState();
}

class _MarketPlaceScreenState extends State<MarketPlaceScreen> {
  final List<String> categories = [
    'All',
    'Criminal',
    'Civil',
    'Tax',
    'Home',
    'Divorce',
    'Finance'
  ];
  void navigateToSearchScreen(String query) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SearchScreen(query: query.toString());
    }));
  }

  String isActive = 'All';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController searchController = TextEditingController();

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
    UserModel userModel =
        Provider.of<UserProvider>(context, listen: false).getUser;
    return userModel.type == 'Lawyer'
        ? DefaultTabController(
            length: 2,
            child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: primaryColor,
                  bottom: const TabBar(
                      indicatorColor: Colors.white,
                      dividerColor: primaryColor,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(
                            text: 'Pending',
                            icon: ImageIcon(
                              AssetImage(
                                'assets/icons/ic_clock.png',
                              ),
                              size: 20,
                            )),
                        Tab(
                            text: 'Completed',
                            icon: ImageIcon(
                              AssetImage(
                                'assets/icons/ic_completed.png',
                              ),
                              size: 20,
                            )),
                      ]),
                  title: const Text(
                    'Meetings',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                body: const TabBarView(children: [
                  LawyerPendingMeetings(),
                  LawyerCompletedMeetings(),
                ])))
        : Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              decoration:
                                  const BoxDecoration(color: primaryColor),
                              height: 200,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 20),
                                  const Text(
                                    'Hi User, 👋',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 24),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    'Find number of lawyer’s to get your case resolved',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  const SizedBox(height: 10),
                                  TextFormField(
                                    onFieldSubmitted: navigateToSearchScreen,
                                    cursorColor: Colors.white,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300),
                                    decoration: InputDecoration(
                                      prefixIcon: Image.asset(
                                        'assets/icons/ic_search.png',
                                        height: 20,
                                        color: Colors.grey,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colors.grey)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colors.white)),
                                      hintText: 'Search for Lawyers, Category',
                                      hintStyle:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'By Category',
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 3.0),
                    child: SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                isActive = categories[index];
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Card(
                                elevation: 3,
                                color: isActive == categories[index]
                                    ? primaryColor
                                    : Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 10),
                                  child: Center(
                                    child: Text(
                                      categories[index],
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: isActive == categories[index]
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Lawyers')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SliverToBoxAdapter(
                        child: Center(
                            child:
                                CircularProgressIndicator(color: primaryColor)),
                      );
                    }
                    if (snapshot.hasError) {
                      return SliverToBoxAdapter(
                        child: Center(child: Text('Error: ${snapshot.error}')),
                      );
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const SliverToBoxAdapter(
                        child: Center(child: Text('No lawyerModels found')),
                      );
                    }

                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          LawyerModel lawyerModel =
                              LawyerModel.fromSnap(snapshot.data!.docs[index]);

                          return lawyerModel.approved == 'true'
                              ? GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return LawyerProfileScreen(
                                          caseWon: lawyerModel.casesWon,
                                          fees: '1999',
                                          firstName: lawyerModel.firstName,
                                          lastName: lawyerModel.lastName,
                                          uid: lawyerModel.uid,
                                          location: lawyerModel.address1,
                                          profilePic: lawyerModel.profImage,
                                          ratings: '2',
                                          experience: lawyerModel.experience,
                                          profImage: lawyerModel.profImage);
                                    }));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18.0, vertical: 5),
                                    child: LawyerCard(
                                      caseWon: lawyerModel.casesWon,
                                      fees: '1999',
                                      lawyerName: lawyerModel.firstName,
                                      location: lawyerModel.address1,
                                      profilePic: lawyerModel.profImage,
                                      ratings: '2',
                                      experience: lawyerModel.experience,
                                    ),
                                  ),
                                )
                              : const SizedBox();
                        },
                        childCount: snapshot.data!.docs.length,
                      ),
                    );
                  },
                ),
              ],
            ),
          );
  }
}
