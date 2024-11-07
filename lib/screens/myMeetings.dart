import 'package:adhikar2_o/screens/videoCallScreen.dart';
import 'package:adhikar2_o/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyMeetingsScreen extends StatelessWidget {
  const MyMeetingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController vcController = TextEditingController();
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
        child: Column(
          children: [
            SizedBox(
                height: 120,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          //
                          child: Image.asset(
                            'assets/images/img_profile_pic.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  ' lawyerName',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/icons/ic_clock.png',
                                      height: 15,
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    const Text(
                                      '20/04/2024 at 04:30',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Text(
                                      'Amount paid : ',
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                    Text(
                                      '2409.78/-',
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Text(
                                      'Status : ',
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                    Text(
                                      'Meeting pending',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: vcController,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return VideoCallScreen(
                      callID: vcController.text,
                    );
                  }));
                },
                child: Text('Join'))
          ],
        ),
      ),
    );
  }
}
