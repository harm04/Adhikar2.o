
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageServices{
  final FirebaseStorage _storage=FirebaseStorage.instance;

 final FirebaseAuth _auth=FirebaseAuth.instance;

  Future<String>uploadImageToStorage(String childName,Uint8List file)async{
    Reference ref =_storage.ref().child(childName).child(_auth.currentUser!.uid);
    UploadTask uploadTask=ref.putData(file);
    TaskSnapshot snap=await uploadTask;
   String downloadUrl=await snap.ref.getDownloadURL();
   return downloadUrl;

  }

  Future<String>uploadFileToStorage(String childName,PlatformFile pickedFile)async{
    final file=File(pickedFile.path!);
    final ref=_storage.ref().child(childName).child(pickedFile.name);
   UploadTask uploadTask=  ref.putFile(file);
    TaskSnapshot snap=await uploadTask;
   String downloadUrl=await snap.ref.getDownloadURL();
   return downloadUrl;

  }
}