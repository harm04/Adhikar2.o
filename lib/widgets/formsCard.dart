import 'package:adhikar2_o/utils/colors.dart';
import 'package:flutter/material.dart';

class FormsCard extends StatelessWidget {
  final Color color;
  final String text;

  const FormsCard(
      {super.key,
      required this.color,
      required this.text,
      });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Card(
        elevation: 10,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                height: 40,
                width: 50,
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        topRight: Radius.circular(20))),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomLeft: Radius.circular(20))),
              ),
            ),
            const Positioned(
              right: 10,
              top: 20,
              bottom: 20,
              child: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style:
                        const TextStyle(color: primaryColor, fontSize: 17,fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
               
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
