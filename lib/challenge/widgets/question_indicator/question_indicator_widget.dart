import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shard/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

// App bar da tela de desafios

class QuestionIndicatorWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [

          //Padding(
            //padding: const EdgeInsets.symmetric(horizontal: 20),

            //child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Text("Questão 04",
                style: AppTextStyles.body,
                ),

                Text("de 10",
                  style: AppTextStyles.body,
                ),

              ],

            ),



          //),

          SizedBox(height: 16,),

          ProgressIndicatorWidget(value: 0.7),


        ],
        
      ),
    );
  }
}
