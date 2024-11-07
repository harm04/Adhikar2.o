import 'package:adhikar2_o/models/lawyerModel.dart';
import 'package:adhikar2_o/services/authServices.dart';
import 'package:flutter/material.dart';

class LawyerProvider with ChangeNotifier {
  LawyerModel? _lawyermodel;
  LawyerModel get getLawyer => _lawyermodel!;

  Future<void> refreshLawyer() async {
    LawyerModel lawyermodel = await AuthServices().getLawyerDetals();
    _lawyermodel = lawyermodel;
    notifyListeners();
  }
}
