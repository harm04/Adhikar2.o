import 'package:adhikar2_o/utils/colors.dart';
import 'package:flutter/material.dart';

class ViewAllButton extends StatelessWidget {
  const ViewAllButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: primaryColor),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 5),
                    child: Text(
                      'View all',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                );
  }
}