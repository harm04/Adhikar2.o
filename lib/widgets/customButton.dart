import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;

  const CustomButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(16, 32, 55, 1),
          borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: Text(
        text,
        style:const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      )),
    );
  }
}
