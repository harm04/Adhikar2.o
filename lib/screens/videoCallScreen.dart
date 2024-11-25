import 'dart:math';
import 'package:adhikar2_o/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class VideoCallScreen extends StatelessWidget {
  const VideoCallScreen({super.key, required this.callID});
  final String callID;

  @override
  Widget build(BuildContext context) {
    final userId = Random().nextInt(10000);

    return ZegoUIKitPrebuiltCall(
      appID: appId,
      appSign: appSign,
      userID: userId.toString(),
      userName: '${userId}user_name',
      callID: callID,
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
      onDispose: () async {
        await FirebaseFirestore.instance
            .collection('Meetings')
            .doc(callID)
            .update({'status': 'completed;'});
      },
    );
  }
}
