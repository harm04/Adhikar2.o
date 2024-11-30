import 'package:cloud_firestore/cloud_firestore.dart';

class PostService {
  Future<String> uploadPost(
      {required String uid,
      required String postId,
      required String post,
      required String firstName,
      required String lastName,
      required String type,
      required String profImage,
      required bool isAnonymous}) async {
    String res = 'some error occured';
    try {
      if (post.isNotEmpty) {
        await FirebaseFirestore.instance.collection('Posts').doc(postId).set({
          "postId": postId,
          "post": post,
          "upvotes": [],
          "downvotes": [],
          "uid": uid,
          "anonymous": isAnonymous,
          "firstName": firstName,
          "lastName": lastName,
          "type": type,
          "date": DateTime.now(),
          "profImage": profImage
        });
        res = 'success';
      } else {
        res = 'Please fill out all the fields';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<void> upvote(
      String postId, List upvoteList, List downvoteList, String uid) async {
    try {
      if (upvoteList.contains(uid)) {
        await FirebaseFirestore.instance
            .collection('Posts')
            .doc(postId)
            .update({
          "upvotes": FieldValue.arrayRemove([uid])
        });
        print('upvote removed uid: ' + uid);
      } else if (downvoteList.contains(uid)) {
        await FirebaseFirestore.instance
            .collection('Posts')
            .doc(postId)
            .update({
          "downvotes": FieldValue.arrayRemove([uid])
        });
        await FirebaseFirestore.instance
            .collection('Posts')
            .doc(postId)
            .update({
          "upvotes": FieldValue.arrayUnion([uid])
        });
      } else {
        await FirebaseFirestore.instance
            .collection('Posts')
            .doc(postId)
            .update({
          "upvotes": FieldValue.arrayUnion([uid])
        });
        print('upvote add uid: ' + uid);
      }
    } catch (err) {
      print(err.toString());
    }
  }

  Future<void> downvote(
      String postId, List upvoteList, List downvoteList, String uid) async {
    try {
      if (downvoteList.contains(uid)) {
        await FirebaseFirestore.instance
            .collection('Posts')
            .doc(postId)
            .update({
          "downvotes": FieldValue.arrayRemove([uid])
        });
        print('downvote removed uid: ' + uid);
      } else if (upvoteList.contains(uid)) {
        await FirebaseFirestore.instance
            .collection('Posts')
            .doc(postId)
            .update({
          "upvotes": FieldValue.arrayRemove([uid])
        });
        await FirebaseFirestore.instance
            .collection('Posts')
            .doc(postId)
            .update({
          "downvotes": FieldValue.arrayUnion([uid])
        });
      } else {
        await FirebaseFirestore.instance
            .collection('Posts')
            .doc(postId)
            .update({
          "downvotes": FieldValue.arrayUnion([uid])
        });
        print('downvote added uid: ' + uid);
      }
    } catch (err) {
      print(err.toString());
    }
  }

  Future<String> deletePost({
    required String postId,
  }) async {
    String res = 'some error occured';
    try {
      await FirebaseFirestore.instance.collection('Posts').doc(postId).delete();
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
