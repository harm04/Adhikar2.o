import 'dart:typed_data';

import 'package:adhikar2_o/models/lawyerModel.dart';
import 'package:adhikar2_o/services/storageServices.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ApplyForLawyerService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> submitForVerification({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
    required String uid,
    required double credits,
    required List meetings,
    required List transactions,
    required String dob,
    required String state,
    required String city,
    required String address1,
    required String address2,
    required PlatformFile proofDoc,
    required PlatformFile idDoc,
    required String casesWon,
    required String experience,
    required String description,
    required String approved,
    required Uint8List profImage,
  }) async {
    String res = 'Some error occured';

    try {
      if (lastName.isNotEmpty &&
          firstName.isNotEmpty &&
          email.isNotEmpty &&
          phone.isNotEmpty &&
          dob.isNotEmpty &&
          address1.isNotEmpty &&
          address2.isNotEmpty &&
          city.isNotEmpty &&
          state.isNotEmpty &&
          casesWon.isNotEmpty &&
          experience.isNotEmpty &&
          description.isNotEmpty) {
        String profImageUrl = await StorageServices()
            .uploadImageToStorage('profileImage', profImage);
        String proofDocUrl =
            await StorageServices().uploadFileToStorage('files', proofDoc);
        String idDocUrl =
            await StorageServices().uploadFileToStorage('files', idDoc);

        LawyerModel laywerModel = LawyerModel(
            email: email,
            password: password,
            phone: phone,
            approved: approved,
            casesWon: casesWon,
            city: city,
            description: description,
            dob: dob,
            experience: experience,
            idDoc: idDocUrl,
            firstName: firstName,
            lastName: lastName,
            profImage: profImageUrl,
            proofDoc: proofDocUrl,
            state: state,
            address1: address1,
            address2: address2,
            credits: 50,
            meetings: [],
            transactions: [],
            uid: _auth.currentUser!.uid);
        await FirebaseFirestore.instance.collection('Users').doc(uid).update({
          'type': 'pending',
        });

        await _firestore
            .collection('Lawyers')
            .doc(_auth.currentUser!.uid)
            .set(laywerModel.toJson());
        res = 'success';
      } else {
        res = 'Please fill all the fields';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> approveAsLawyer({required String uid}) async {
    String res = 'some error occured';
    try {
      await FirebaseFirestore.instance.collection('Users').doc(uid).update({
        'type': 'Lawyer',
      });
      await FirebaseFirestore.instance.collection('Lawyers').doc(uid).update({
        'approved': 'true',
      });
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> rejectAsLawyer({required String uid}) async {
    String res = 'some error occured';
    try {
      await FirebaseFirestore.instance.collection('Lawyers').doc(uid).delete();
      await FirebaseFirestore.instance.collection('Users').doc(uid).update({
        'type': 'User',
      });
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
