import 'dart:math';

import 'package:adhikar2_o/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class VideoCallScreen extends StatelessWidget {
  const VideoCallScreen({Key? key, required this.callID}) : super(key: key);
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
      onDispose: (){
        //return to feedback page
      },
    );

    
  }
}
