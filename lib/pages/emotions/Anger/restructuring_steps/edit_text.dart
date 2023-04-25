import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class EditText extends StatefulWidget {
  const EditText({super.key, required this.steps});
  final String steps;

  @override
  State<EditText> createState() => _EditTextState();
}

class _EditTextState extends State<EditText> {
  @override
  Widget build(BuildContext context) {
    final _textController = TextEditingController();
    final user = FirebaseAuth.instance.currentUser!;

    Future updateNotes(String notes) async {
      var docs = await FirebaseFirestore.instance
          .collection('notes')
          .doc(user.uid)
          .get();
      if (docs.exists) {
        FirebaseFirestore.instance.collection('notes').doc(user.uid).update({
          widget.steps: FieldValue.arrayUnion([notes])
        });
      } else {
        FirebaseFirestore.instance.collection('notes').doc(user.uid).set({
          widget.steps: FieldValue.arrayUnion([notes])
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Text(
            'Add Notes',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo),
                          borderRadius: BorderRadius.circular(12)),
                      hintText: 'Enter your notes',
                      fillColor: Colors.white,
                      filled: true),
                ),
              ),
            ),
            MaterialButton(
                onPressed: () {
                  updateNotes(_textController.text.trim());
                  var snackBar = SnackBar(
                    elevation: 0,
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    content: AwesomeSnackbarContent(
                      title: 'Let\'s Go',
                      message: 'Note successfully added',
                      contentType: ContentType.success,
                    ),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  Navigator.pop(context);
                },
                color: Colors.indigo,
                child: Text(
                  "Enter your notes",
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
      )),
    );
  }
}
