
import 'package:adhikar2_o/utils/colors.dart';
import 'package:flutter/material.dart';

class JudgementCard extends StatelessWidget {
  final Color circleColor;
  final String title;
  final String content;
  const JudgementCard(
      {super.key,
      required this.circleColor,
      required this.title,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: SizedBox(
        height: 150,
        width: 250,
        child: Card(
          elevation: 5,
          child: Stack(
            children: [
              Positioned(
                top: 40,
                right: 0,
                child: Container(
                  height: 110,
                  width: 60,
                  decoration: BoxDecoration(
                      color: circleColor,
                      borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(100))),
                ),
              ),
              Positioned(
                  right: 0,
                  top: 10,
                  child: Container(
                    height: 60,
                    width: 30,
                    decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(width: 2.0, color: circleColor),
                          top: BorderSide(width: 2.0, color: circleColor),
                          bottom: BorderSide(width: 2.0, color: circleColor),
                        ),
                        borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(100))),
                  )),
              Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: circleColor,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(100),
                          bottomLeft: Radius.circular(20))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          color: primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      maxLines: 3,
                      content,
                      style: const TextStyle(
                          color: primaryColor,
                          fontSize: 13,
                          overflow: TextOverflow.ellipsis),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: Image.asset(
                  "assets/icons/ic_bookmark.png",
                  height: 20,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
