import 'dart:math';

import 'package:adhikar2_o/utils/colors.dart';
import 'package:flutter/material.dart';

class RaitngsDialoug extends StatefulWidget {
  const RaitngsDialoug({super.key});

  @override
  State<RaitngsDialoug> createState() => _RaitngsDialougState();
}

class _RaitngsDialougState extends State<RaitngsDialoug> {
  var _ratingPageController = PageController();
  var _starPosition = 160.0;
  var _rating = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Container(
            height: max(300, MediaQuery.of(context).size.height * 0.3),
            child: PageView(
              controller: _ratingPageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildThanksNote(),
                _causeOfRating(),
              ],
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: primaryColor,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    print(_rating);
                  },
                  child: const Text(
                    "Done",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              )),
          AnimatedPositioned(
            top: _starPosition,
            left: 0,
            right: 0,
            duration: const Duration(milliseconds: 300),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  onPressed: () {
                    _ratingPageController.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.ease);
                    setState(() {
                      _starPosition = 20.0;
                      _rating = index + 1;
                    });
                  },
                  icon: index < _rating
                      ? const Icon(
                          Icons.star,
                          size: 32,
                        )
                      : const Icon(
                          Icons.star_border,
                          size: 32,
                        ),
                  color: primaryColor,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  _buildThanksNote() {
    return const Padding(
      padding: EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            'Thank you for selecting Lawyer name!',
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'Your feedback is important to us. Your ratings will help determine the payment amount for lawyer name.',
            style: TextStyle(
              color: primaryColor,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  _causeOfRating() {
    return const Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
            top: 90,
            left: 10,
            right: 10,
            child: Padding(
              padding: EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Text(
                    'Thank you for coosing Adhikar!',
                    style: TextStyle(color: primaryColor, fontSize: 18),
                  ),
                  Text(
                    'Your ratings will directly influence the payment of ₹X to the lawyer.',
                    style: TextStyle(color: primaryColor, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
