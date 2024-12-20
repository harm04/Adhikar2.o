import 'package:adhikar2_o/models/lawyerModel.dart';
import 'package:adhikar2_o/screens/profile/lawyerProfile.dart';
import 'package:adhikar2_o/utils/colors.dart';
import 'package:adhikar2_o/widgets/lawyerCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchScreen extends StatefulWidget {
  final String query;
  const SearchScreen({super.key, required this.query});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.query);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: primaryColor,
            statusBarIconBrightness: Brightness.light),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          widget.query,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Column(
            children: [
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Lawyers')
                      .where("firstName", isGreaterThanOrEqualTo: widget.query)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                          child:
                              CircularProgressIndicator(color: primaryColor));
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Center(child: Text('No lawyers found'));
                    }

                    return ListView.builder(
                      itemBuilder: (context, index) {
                        LawyerModel lawyerModel =
                            LawyerModel.fromSnap(snapshot.data!.docs[index]);
                        print(lawyerModel.toJson());
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
                                        desccription: lawyerModel.description,
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
                      itemCount: snapshot.data!.docs.length,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
