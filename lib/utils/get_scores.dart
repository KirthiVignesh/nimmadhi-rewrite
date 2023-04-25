import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class GetScores extends StatefulWidget {
  const GetScores({super.key, required this.quizName});
  final String quizName;

  @override
  State<GetScores> createState() => _GetScoresState();
}

class _GetScoresState extends State<GetScores> {
  double perValue(String arg) {
    List<String> s = arg.split("/");
    return (num.parse(s[0]) / num.parse(s[1]));
  }

  final user = FirebaseAuth.instance.currentUser!;
  late final DocumentReference _scoreStream =
      FirebaseFirestore.instance.collection('quiz').doc(user.uid);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: _scoreStream.get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return Text("Data does not exist");
          }

          if (snapshot.connectionState != ConnectionState.done) {
            return LoadingAnimationWidget.twoRotatingArc(
                color: Colors.deepPurple, size: 100);
          }
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          if (data[widget.quizName] == null) {
            return (Text("Take the quiz to view Scores"));
          } else {
            return (Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircularPercentIndicator(
                  animation: true,
                  animationDuration: 1000,
                  radius: 60,
                  lineWidth: 20,
                  percent: perValue(
                      data[widget.quizName][data[widget.quizName].length - 1]),
                  progressColor: Colors.deepPurple,
                  backgroundColor: Colors.deepPurple.shade100,
                  circularStrokeCap: CircularStrokeCap.round,
                  center: Text(
                    data[widget.quizName][data[widget.quizName].length - 1],
                    overflow: TextOverflow.visible,
                  ),
                )
                // child: Text(
                //   data[widget.quizName][data[widget.quizName].length - 1],
                //   style: GoogleFonts.rubik(color: DesignCourseAppTheme.grey),
                //   overflow: TextOverflow.visible,
                // ),
                ));
          }
        });
  }
}
