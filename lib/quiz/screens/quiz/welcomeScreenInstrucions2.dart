import 'package:nimmadhi/quiz/screens/quiz/quiz_screen2.dart';
import 'package:flutter/material.dart';
import 'package:nimmadhi/quiz/screens/quiz/quiz_screen.dart';

import 'package:nimmadhi/quiz/themes.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class WelcomeScreenIntructions2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 1), //2/6
                  Text(
                    "Instructions:-",
                    style: Theme.of(context).textTheme.headline3?.copyWith(
                        color: Color.fromARGB(255, 7, 6, 6),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "The questions are set with a timer of 60 sec",
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(color: kSecondaryColor),
                  ),
                  Spacer(), // 1/6
                  InkWell(
                    onTap: () => Get.to(QuizScreen2()),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                      decoration: BoxDecoration(
                        color: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Done ! Got it",
                        style: Theme.of(context).textTheme.button?.copyWith(
                            color: Color.fromARGB(255, 248, 245, 245)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
