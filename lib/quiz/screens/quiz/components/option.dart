import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nimmadhi/quiz/controllers/question_controller.dart';
//import 'package:agni/quiz/controllers/question_controller.dart';

import '../../../themes.dart';

class Option extends StatelessWidget {
  const Option({
    Key? key,
    required this.text,
    required this.index,
    required this.press,
  }) : super(key: key);
  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qnController) {
          Color getTheRightColor() {
            if (qnController.isAnswered) {
              if (_questionController.index == 0) {
                return kGreenColor;
              } else if (_questionController.index == 1) {
                return KLightGreenColor;
              } else if (_questionController.index == 2) {
                return KYellowColor;
              } else if (_questionController.index == 3) {
                return KOrangeColor;
              } else if (_questionController.index == 4) {
                return kRedColor;
              }
            }
            return kGrayColor;
          }

          IconData getTheRightIcon() {
            return getTheRightColor() == kRedColor ? Icons.close : Icons.done;
          }

          return InkWell(
            onTap: press,
            child: Container(
              margin: EdgeInsets.only(top: kDefaultPadding),
              padding: EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                border: Border.all(color: getTheRightColor()),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 200,
                    child: Text(
                      "${index + 1}. $text",
                      style: TextStyle(
                        color: getTheRightColor(),
                        fontSize: 12,
                      ),
                    ),
                  ),
                  // Container(
                  //   height: 26,
                  //   width: 26,
                  //   decoration: BoxDecoration(
                  //     color: getTheRightColor() == kGrayColor
                  //         ? Colors.transparent
                  //         : getTheRightColor(),
                  //     borderRadius: BorderRadius.circular(50),
                  //     border: Border.all(color: getTheRightColor()),
                  //   ),
                  //   child: getTheRightColor() == kGrayColor
                  //       ? null
                  //       : Icon(getTheRightIcon(), size: 16),
                  // )
                ],
              ),
            ),
          );
        });
  }
}
