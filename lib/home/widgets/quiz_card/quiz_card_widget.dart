import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shard/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

//Classe com a programação dos Componentes do card branco quadrado

class QuizCardWidget extends StatelessWidget {
  //final int currentQuestion;
  //final int totalQuestions = 10;

  const QuizCardWidget({
    Key? key,
    //required this.currentQuestion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),

      child:
      Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
          borderRadius: BorderRadius.circular(10),
          color: AppColors.white,
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //Coluna iniciando normal, à esquerda
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            //Primeiro item quadrado branco
            Container(
              height: 20,
              width: 20,
              //color: AppColors.red,
              child: Image.asset(AppImages.blocks),
            ),

            // Definindo espaçamentos de cada item do card branco quadrado
            SizedBox(height: 20),
            //Segundo item quadrado branco
            Text('Gerenciamento de Estado', style: AppTextStyles.heading15),
            SizedBox(height: 20),

            Row(
              children: [
                //Terceiro item quadrado branco
                Expanded(
                  flex: 1,
                  child: Text("3 de 10",
                      style: AppTextStyles.body11),
                ),
                Expanded(
                  //Quarto item quadrado branco
                  flex: 2,
                  child: ProgressIndicatorWidget( value: 0.3,),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}