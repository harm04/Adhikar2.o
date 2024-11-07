import 'package:adhikar2_o/models/userModel.dart';
import 'package:adhikar2_o/services/authServices.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  UserModel? _usermodel;
  UserModel get getUser => _usermodel!;

  Future<void> refreshUser() async {
    UserModel usermodel = await AuthServices().getUserDetals();
    _usermodel = usermodel;
    notifyListeners();
  }
}
