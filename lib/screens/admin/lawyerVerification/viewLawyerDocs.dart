import 'package:adhikar2_o/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ViewLawyerDocuments extends StatefulWidget {
  final snap;
  const ViewLawyerDocuments({super.key, required this.snap});

  @override
  State<ViewLawyerDocuments> createState() => _ViewLawyerDocumentsState();
}

class _ViewLawyerDocumentsState extends State<ViewLawyerDocuments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: primaryColor,
            statusBarIconBrightness: Brightness.light),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          '${widget.snap['firstName']} ${widget.snap['lastName']}',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SizedBox(
              width: 700,
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius:
                            50, 
                       child:Image.network(widget.snap['profImage'].toString()),
                        backgroundColor: Colors.grey[
                            200],
                      )
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
