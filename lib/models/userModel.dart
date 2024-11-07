import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String uid;
  final double credits;
  final List meetings;
  final List transactions;
  final String type;
  final String? profImage;

  UserModel(
      {required this.email,
      required this.password,
      required this.firstName,
      required this.lastName,
      required this.credits,
      required this.meetings,
      required this.transactions,
      required this.uid,
       this.profImage,
      required this.type
      });

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'firstName': firstName,
        'lastName': lastName,
        'credits': credits,
        'meetings': meetings,
        'uid': uid,
        'transactions': transactions,
        'type':type,
        'profImage':profImage
      };

  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
        email: snapshot['email'],
        password: snapshot['password'],
        firstName: snapshot['firstName'],
        lastName: snapshot['lastName'],
        credits: snapshot['credits'],
        meetings: snapshot['meetings'],
        transactions: snapshot['transactions'],
                type: snapshot['type'],
        profImage: snapshot['profImage'],

        uid: snapshot['uid']);
  }
}
