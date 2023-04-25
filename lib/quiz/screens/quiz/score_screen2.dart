import 'package:nimmadhi/pages/home_page.dart';
import 'package:nimmadhi/quiz/screens/quiz/send_score.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nimmadhi/quiz/themes.dart';
import 'package:nimmadhi/quiz/controllers/question_controller2.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nimmadhi/quiz/screens/quiz/welcome_screen2.dart';

class ScoreScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WelcomeScreen2 _quizScreen = Get.put(WelcomeScreen2());
    QuestionController2 _qnController = Get.put(QuestionController2());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          //SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          Column(
            children: [
              Spacer(flex: 3),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(color: kSecondaryColor),
              ),
              Spacer(),
              Text(
                "${_qnController.numOfCorrectAns}/${_qnController.questions.length * 3}",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: kSecondaryColor),
              ),
              Spacer(),
              Text(
                "Skip Count",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: kSecondaryColor),
              ),
              Spacer(),
              Text(
                "${_quizScreen.count}/${_qnController.questions.length}",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: kSecondaryColor),
              ),
              ElevatedButton(
                  onPressed: () {
                    try {
                      SendScores(
                              quizName: 'stress',
                              quizScore:
                                  "${_qnController.numOfCorrectAns}/${_qnController.questions.length * 3}")
                          .updateNotes();
                      var snackBar = SnackBar(
                        elevation: 0,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                          title: 'Let\'s Go',
                          message: 'Quiz Completed',
                          contentType: ContentType.success,
                        ),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } catch (error) {
                      var snackBar = SnackBar(
                        elevation: 0,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                          title: 'Oops',
                          message: 'An error Occurred',
                          contentType: ContentType.failure,
                        ),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } finally {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    }
                  },
                  child: Text('Back')),
              Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
