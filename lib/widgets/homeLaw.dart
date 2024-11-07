import 'package:adhikar2_o/utils/colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class HomeLawCard extends StatelessWidget {
  final Color circleColor;
  final Color boxColor;
  final String number;
  final String title;
  final String content;
  final String year;
  const HomeLawCard(
      {super.key,
      required this.circleColor,
      required this.boxColor,
      required this.number,
      required this.title,
      required this.content,
      required this.year});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: SizedBox(
        height: 210,
        width: 170,
        child: Card(
          elevation: 5,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      color: circleColor,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: const Radius.circular(100),
                          topRight: Radius.circular(20))),
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
                      maxLines: 5,
                      content,
                      style: const TextStyle(
                          color: primaryColor,
                          fontSize: 13,
                          overflow: TextOverflow.ellipsis),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 3,
                      width: 60,
                      decoration: BoxDecoration(
                          color: boxColor,
                          borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(1))),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: boxColor,
                            borderRadius: BorderRadius.circular(5)),
                        height: 25,
                        width: 30,
                        child: Center(child: Text(number)),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      SizedBox(
                        height: 25,
                        child: DottedBorder(
                            color: boxColor,
                            strokeCap: StrokeCap.round,
                            strokeWidth: 1.3,
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(5),
                            dashPattern: const [4, 4],
                            child: SizedBox(
                              height: 20,
                              width: 70,
                              child: Center(child: Text(year)),
                            )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        "assets/icons/ic_bookmark.png",
                        height: 20,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
