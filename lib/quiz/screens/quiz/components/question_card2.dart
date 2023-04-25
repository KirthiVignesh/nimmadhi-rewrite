import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nimmadhi/quiz/controllers/question_controller2.dart';

//change the file name for the quiz change to Questions.dart
//1.body.dart and 2.question_card.dart
import 'package:nimmadhi/quiz/models/Question_stress.dart';

import '../../../themes.dart';
import 'option2.dart';

class QuestionCard2 extends StatelessWidget {
  const QuestionCard2({
    Key? key,
    // it means we have to pass this
    required this.questionStress,
  }) : super(key: key);

  final QuestionStress questionStress;

  @override
  Widget build(BuildContext context) {
    QuestionController2 _controller = Get.put(QuestionController2());
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        padding: EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: [
            Text(
              questionStress.questionStress,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: kBlackColor),
            ),
            SizedBox(height: kDefaultPadding / 4),
            ...List.generate(
              questionStress.options.length,
              (index) => Option(
                index: index,
                text: questionStress.options[index],
                press: () => _controller.checkAns(questionStress, index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
