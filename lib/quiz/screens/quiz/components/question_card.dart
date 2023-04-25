import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nimmadhi/quiz/controllers/question_controller.dart';

//change the file name for the quiz change to Questions.dart
//1.body.dart and 2.question_card.dart
import 'package:nimmadhi/quiz/models/Question_anxiety.dart';

import '../../../themes.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    // it means we have to pass this
    required this.question,
  }) : super(key: key);

  final Question question;
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
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
              question.question,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: kBlackColor),
            ),
            SizedBox(height: kDefaultPadding / 4),
            ...List.generate(
              question.options.length,
              (index) => Option(
                  index: index,
                  text: question.options[index],
                  press: () => _controller.checkAns(question, index)),
            ),
          ],
        ),
      ),
    );
  }
}
