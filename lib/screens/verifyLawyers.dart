import 'package:adhikar2_o/models/lawyerModel.dart';
import 'package:adhikar2_o/services/applyForlawyerService.dart';
import 'package:adhikar2_o/utils/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerifyLawyersScreen extends StatefulWidget {
  const VerifyLawyersScreen({super.key});

  @override
  State<VerifyLawyersScreen> createState() => _VerifyLawyersScreenState();
}

class _VerifyLawyersScreenState extends State<VerifyLawyersScreen> {
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
          'Admin',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
          child: Center(
        child: SizedBox(
            width: 700,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Lawyers')
                    .snapshots(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        LawyerModel lawyerModel =
                            LawyerModel.fromSnap(snapshot.data.docs[index]);
                        return Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  lawyerModel.firstName + lawyerModel.lastName,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                                lawyerModel.approved!='true'?
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        ApplyForLawyerService().rejectAsLawyer(
                                            uid: lawyerModel.uid);
                                      },
                                      child: Container(
                                        height: 45,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Center(
                                            child: Text(
                                          'Reject',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        ApplyForLawyerService().approveAsLawyer(
                                            uid: lawyerModel.uid);
                                      },
                                      child: Container(
                                        height: 45,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Center(
                                            child: Text(
                                          'Approve',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )),
                                      ),
                                    ),
                                  ],
                                ):Container(
                                        height: 45,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Center(
                                            child: Text(
                                          'Approved',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )),
                                      ),
                              ],
                            )
                          ],
                        );
                      });
                })),
      )),
    );
  }
}
