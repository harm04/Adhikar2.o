import 'dart:math';

import 'package:adhikar2_o/models/userModel.dart';
import 'package:adhikar2_o/provider/userProvider.dart';
import 'package:adhikar2_o/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class VideoCallScreen extends StatelessWidget {
  const VideoCallScreen({Key? key, required this.callID}) : super(key: key);
  final String callID;

  @override
  Widget build(BuildContext context) {
    final userId = Random().nextInt(10000);
    UserModel userModel =
        Provider.of<UserProvider>(context, listen: false).getUser;
    return ZegoUIKitPrebuiltCall(
      appID: appId,
      appSign: appSign,
      userID: userId.toString(),
      userName: '${userId}user_name',
      callID: callID,
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
      onDispose: () {
        FirebaseFirestore.instance
            .collection('Meetings')
            .doc(callID)
            .update({'status': 'completed;'});
      },
    );
  }
}
