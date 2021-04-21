import 'package:devquiz/challenge/answer/answer_widget.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';


class QuizWidget extends StatelessWidget {
  final String title;

  const QuizWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Text(
          title,
          style: AppTextStyles.heading,
        ),


        SizedBox(height: 24),


        AnswerWidget(
            isRight: false,
            isSelectde: true,
            title: "Possibilita a criação de aplicativos compliados nativamente"),
        AnswerWidget(title: "Possibilita a criação de aplicativos compliados nativamente"),
        AnswerWidget(title: "Possibilita a criação de aplicativos compliados nativamente"),
        AnswerWidget(title: "Possibilita a criação de aplicativos compliados nativamente"),


        /*AnswerWidget(
          answer: 'Kit de desenvolvimento de interface de usuário',
          isCorrect: true,
        ),
        AnswerWidget(
          answer: 'Possibilita a criação de aplicativos compliados nativamente',
          isCorrect: false,
          isChecked: true,
        ),
        AnswerWidget(
          answer: 'Possibilita a criação de aplicativos compliados nativamente',
        ),*/

      ],
    );

  }
}