import 'package:devquiz/challenge/answer/answer_widget.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shard/models/awnser_model.dart';
import 'package:devquiz/shard/models/question_model.dart';
import 'package:flutter/material.dart';


class QuizWidget extends StatefulWidget {
  //final String title; //COMENTEI POR ÚLTIMO PARA TIRAR O TÍTULO
  final QuestionModel question;
  final VoidCallback onChange;

  const QuizWidget({
    Key? key,
   // this.title, //COMENTEI POR ÚLTIMO PARA TIRAR O TÍTULO
    required this.question,
    required this.onChange,
  }) : super(key: key);
  
  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;
  AwnserModel answer(int index) => widget.question.answers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [

          SizedBox(
            height: 40,
          ),

          Text(
            widget.question.title,
            style: AppTextStyles.heading,
          ),


          SizedBox(height: 24),

          for(var i=0; i<widget.question.answers.length; i++)
            AnswerWidget(
              awnser: answer(i),
              disabled: indexSelected != -1,
              isSelected: indexSelected == i,
              onTap: (){
                //print(i);
                indexSelected = i;
                //widget.onChange();
                setState(() { });
                Future.delayed(Duration(seconds: 1)).then((value) => widget.onChange());
              },
              //isRight: answer(i).isRight,
              //isSelected: false,
              //title: answer(i).title,
            ),

          /*
          // "..." concatenando uma lista com outra
          ...widget.question.answers.map
            ((e) => AnswerWidget(
            isRight: e.isRight,
            isSelected: false,
            title: e.title,
          ),).toList(),
          */

        ],
      ),

    );
  }
}
