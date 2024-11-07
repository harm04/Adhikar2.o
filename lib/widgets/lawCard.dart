import 'package:adhikar2_o/utils/colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class LawCard extends StatelessWidget {
  final Color color;
  const LawCard({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: double.infinity,
      child: Card(
        elevation: 10,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DottedBorder(
                      color: color,
                      strokeCap: StrokeCap.round,
                      strokeWidth: 1.3,
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(100),
                      dashPattern: const [3, 5],
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Center(
                            child: Text(
                          '22',
                          style: TextStyle(
                              color: color,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '2015',
                    style: TextStyle(
                        color: color,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: SizedBox(
                width: 280,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'I.P.C Act',
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      maxLines: 4,
                      'The Indian Penal Code is the official criminal code of India. It is a comprehensive code intended to cover all substantive.',
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 13,
                          overflow: TextOverflow.ellipsis),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
