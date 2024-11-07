import 'package:adhikar2_o/utils/colors.dart';
import 'package:flutter/material.dart';

class DrawerItems extends StatelessWidget {
  final String image;
  final String name;
  const DrawerItems({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              image.toString(),
              height: 20,
              color: primaryColor,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              name,
              style: const TextStyle(
                  color: primaryColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
