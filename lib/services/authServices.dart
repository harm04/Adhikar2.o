import 'package:adhikar2_o/models/lawyerModel.dart';
import 'package:adhikar2_o/models/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel> getUserDetals() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _firestore.collection('Users').doc(currentUser.uid).get();
    return UserModel.fromSnap(snap);
  }

  Future<LawyerModel> getLawyerDetals() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _firestore.collection('Lawyers').doc(currentUser.uid).get();
    return LawyerModel.fromSnap(snap);
  }



  Future<String> signUp(
      {required String firstName,
      required String lastName,
      required String email,
       String? profImage,
      required String type,
      required String password}) async {
    String res = 'something went wrong';
    try {
      if (firstName.isNotEmpty &&
          lastName.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        UserModel userModel = UserModel(
            email: email,
            password: password,
            firstName: firstName,
            lastName: lastName,
            credits: 50,
            meetings: [],
            transactions: [],
            type:type ,
            profImage: profImage,
            uid: cred.user!.uid);
        await _firestore
            .collection('Users')
            .doc(cred.user!.uid)
            .set(userModel.toJson());
        res = "success";
      } else {
        res = 'Please enter all the fields';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> login(
      {required String email, required String password}) async {
    String res = 'something went wrong';
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);

        res = "success";
      } else {
        res = 'Please enter all the fields';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> logout() async {
    String res = 'something went wrong';
    try {
      await _auth.signOut();
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
