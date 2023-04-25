import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SendScores {
  SendScores({
    required this.quizName,
    required this.quizScore,
  });
  final String quizName;
  final String quizScore;

  final user = FirebaseAuth.instance.currentUser!;
  Future updateNotes() async {
    var docs =
        await FirebaseFirestore.instance.collection('quiz').doc(user.uid).get();
    if (docs.exists) {
      FirebaseFirestore.instance.collection('quiz').doc(user.uid).update({
        quizName: FieldValue.arrayUnion([quizScore])
      });
    } else {
      FirebaseFirestore.instance.collection('quiz').doc(user.uid).set({
        quizName: FieldValue.arrayUnion([quizScore])
      });
    }
  }
}
