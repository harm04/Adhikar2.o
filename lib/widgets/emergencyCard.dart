
import 'package:adhikar2_o/utils/colors.dart';
import 'package:flutter/material.dart';

class EmergencyCard extends StatelessWidget {
  final Color color;
  final String text;
  final String number;
  const EmergencyCard(
      {super.key,
      required this.color,
      required this.text,
      required this.number});

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
                    borderRadius: BorderRadius.only(
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
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomLeft: Radius.circular(20))),
              ),
            ),
            Positioned(
                top: 6,
                right: 10,
                child: Image.asset('assets/icons/ic_call.png')),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/ic_officer.png',
                        height: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        text,
                        style:
                            const TextStyle(color: primaryColor, fontSize: 17),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/ic_telephone.png',
                        height: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        number,
                        style:
                            const TextStyle(color: primaryColor, fontSize: 14),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
