import 'package:adhikar2_o/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerificatoinPendingScreen extends StatefulWidget {
  const VerificatoinPendingScreen({super.key});

  @override
  State<VerificatoinPendingScreen> createState() =>
      _VerificatoinPendingScreenState();
}

class _VerificatoinPendingScreenState extends State<VerificatoinPendingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: primaryColor,
            statusBarIconBrightness: Brightness.light),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
            Image.asset('assets/icons/ic_verification.png'),
            SizedBox(height: 20,),
            Text('Your request for verification has been sent. Please wait while our team verifies your documents. It usually takes 24 hrs')
                    ],
                  ),
          )),
    );
  }
}
