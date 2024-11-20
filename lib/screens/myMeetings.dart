import 'package:adhikar2_o/models/userModel.dart';
import 'package:adhikar2_o/provider/userProvider.dart';
import 'package:adhikar2_o/screens/videoCallScreen.dart';
import 'package:adhikar2_o/utils/colors.dart';
import 'package:adhikar2_o/widgets/meetingCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class MyMeetingsScreen extends StatefulWidget {
  const MyMeetingsScreen({super.key});

  @override
  State<MyMeetingsScreen> createState() => _MyMeetingsScreenState();
}

class _MyMeetingsScreenState extends State<MyMeetingsScreen> {
  @override
  Widget build(BuildContext context) {
    UserModel userModel =
        Provider.of<UserProvider>(context, listen: false).getUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: primaryColor,
            statusBarIconBrightness: Brightness.light),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'My Meetings',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Meetings')
                .where("clientName",
                    isEqualTo: "${userModel.firstName} ${userModel.lastName}")
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(child: Text('No Meetings found'));
              }
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    print("hiiiiiiiiii: ${snapshot.data!.docs.length}");
                    var meetingData = snapshot.data!.docs[index].data();
                    return GestureDetector(
                      onTap: () {
                        meetingData['status'] == 'pending'
                            ? Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                return VideoCallScreen(
                                  callID: meetingData['meetingUid'],
                                );
                              }))
                            : SizedBox();
                      },

                      //if we want all meetings to be visible in my meetings section then just change meetinguid to a random uid
                      child: MeetingCard(
                          lawyerName: meetingData['lawyerName'],
                          time: meetingData['time'],
                          date: meetingData['date'],
                          status: meetingData['status'],
                          profImage: meetingData['profImage']),
                    );
                  });
            }),
      ),
    );
  }
}
