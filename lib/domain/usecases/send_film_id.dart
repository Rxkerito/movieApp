import 'dart:async'; // new

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'; // new

class SendFilmId {
  String filmId;

  SendFilmId({required this.filmId});

  Future<void> sendId() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user?.uid;
    addMessage(uid!, filmId);
  }

  Future<DocumentReference> addMessage(String id, String filmId) {
    return FirebaseFirestore.instance.collection(id).add(<String, dynamic>{
      'filmId': filmId,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    });
  }
}
