import 'package:adhikar2_o/models/userModel.dart';
import 'package:adhikar2_o/provider/userProvider.dart';
import 'package:adhikar2_o/utils/colors.dart';
import 'package:adhikar2_o/widgets/meetingCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LawyerCompletedMeetings extends StatefulWidget {
  const LawyerCompletedMeetings({super.key});

  @override
  State<LawyerCompletedMeetings> createState() =>
      _LawyerCompletedMeetingsState();
}

class _LawyerCompletedMeetingsState extends State<LawyerCompletedMeetings> {
  @override
  Widget build(BuildContext context) {
    UserModel userModel =
        Provider.of<UserProvider>(context, listen: false).getUser;
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Meetings')
                  .where("lawyerName",
                      isEqualTo: "${userModel.firstName} ${userModel.lastName}").where("status",isEqualTo: "completed")
                  .snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator(color: primaryColor  ));
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data.docs.isEmpty) {
                  return const Center(child: Text("No meetings found"));
                } else {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          var meetingData = snapshot.data!.docs[index].data();
                       meetingData['status']=='completed'?   print(meetingData['status']):print('pending');
      
                          return MeetingCard(
                            clientName: meetingData['clientName'],
                            isLawyer: true,
                              amountPaid: '2409.78/-',
                              lawyerName: meetingData['lawyerName'],
                              time: meetingData['time'],
                              date: meetingData['date'],
                              status: meetingData['status'],
                              profImage: meetingData['clientProfImage']??"https://image.cdn2.seaart.me/2024-09-16/crjon2de878c739kmukg-2/363d4f7dce80aad62b4b1cdc12bb1ec6_high.webp");
                        }),
                  );
                }
              })
        ],
      ),
    );
  }
}