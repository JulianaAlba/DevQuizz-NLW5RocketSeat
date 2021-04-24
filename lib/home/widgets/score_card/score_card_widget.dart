import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/home/widgets/chart/chart_widget.dart';
import 'package:flutter/material.dart';

// CLASSE DO CARD BRANCO QUE FICA EM CIMA E CHAMA A CLASSE COM O GRÁFICO CHARBAR

class ScoreCardWidget extends StatelessWidget {
  final double percent;
  const ScoreCardWidget({Key? key, required this.percent}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      // Afastando box branco das bordas da tela
      padding: const EdgeInsets.only(left: 20, right: 20),

        child: Container(
            height: 136,

            //Box branco com elementos dentro
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(15),
            ),

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Expanded(
                  flex: 1,

                  //Chamando a classe char_widget = imagem do gráfico %
                  child: ChartWidget(percent: percent,),
                ),


                Expanded(
                  flex: 3,

                  child: Padding(
                      padding: const EdgeInsets.only(left: 24),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text("Vamos começar",
                            style: AppTextStyles.heading,),
                          Text("Complete os desafios e avance em conhecimento!",
                            style: AppTextStyles.body,),
                        ],
                      )

                  ),

                )

              ],
            )


        ),
    );

  }
}
