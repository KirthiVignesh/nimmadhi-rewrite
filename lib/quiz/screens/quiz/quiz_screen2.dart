import 'package:nimmadhi/quiz/screens/quiz/components/body2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nimmadhi/quiz/controllers/question_controller2.dart';
import 'package:nimmadhi/quiz/screens/quiz/score_screen2.dart';
import 'welcome_screen2.dart';

import 'components/body.dart';

class QuizScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WelcomeScreen2 _welcomScreen = Get.put(WelcomeScreen2());
    QuestionController2 _controller = Get.put(QuestionController2());
    ScoreScreen2 _scoreScreen2 = Get.put(ScoreScreen2());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Fluttter show the back button automatically
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                onPressed: () {
                  _welcomScreen.count++;
                  _controller.nextQuestion();
                },
                child: Text("Skip")),
          ),
        ],
      ),
      body: Body2(),
    );
  }
}
