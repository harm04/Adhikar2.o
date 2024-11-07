import 'package:cloud_firestore/cloud_firestore.dart';

class LawyerModel {
  final String email;
  final String password;
  final String firstName;
   final String lastName;
  final String phone;
  final String uid;
  final double credits;
  final List meetings;
  final List transactions;
  final String dob;
  final String state;
  final String city;
  final String address1;
  final String address2;
  final String proofDoc;
  final String idDoc;
  final String casesWon;
  final String experience;
  final String description;
  final String approved;
  final String profImage;

  LawyerModel(
      {required this.email,
      required this.password,
      required this.address1,
      required this.address2,
      required this.approved,
      required this.casesWon,
      required this.city,
      required this.description,
      required this.dob,
      required this.experience,
      required this.idDoc,
      required this.firstName,
      required this.lastName,
      required this.phone,
      required this.profImage,
      required this.proofDoc,
      required this.state,
      required this.credits,
      required this.meetings,
      required this.transactions,
      required this.uid});

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'credits': credits,
        'meetings': meetings,
        'uid': uid,
        'transactions': transactions,
        'address1': address1,
        'address2': address2,
        'approved': approved,
        'casesWon': casesWon,
        'description': description,
        'city': city,
        'dob': dob,
        'experience': experience,
        'idDoc': idDoc,
        'firstName': firstName,
        'lastName':lastName,
        'profImage': profImage,
        'phone': phone,
        'proofDoc': proofDoc,
        'state': state,
      };

  static LawyerModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return LawyerModel(
        email: snapshot['email'],
        password: snapshot['password'],
        credits: snapshot['credits'],
        meetings: snapshot['meetings'],
        transactions: snapshot['transactions'],
        address1: snapshot['address1'],
        approved: snapshot['approved'],
        address2: snapshot['address2'],
        description: snapshot['description'],
        casesWon: snapshot['casesWon'],
        dob: snapshot['dob'],
        city: snapshot['city'],
        experience: snapshot['experience'],
        idDoc: snapshot['idDoc'],
        firstName: snapshot['firstName'],
        lastName: snapshot['lastName'],
        profImage: snapshot['profImage'],
        proofDoc: snapshot['proofDoc'],
        state: snapshot['state'],
        phone: snapshot['phone'],
        uid: snapshot['uid']);
  }
}
