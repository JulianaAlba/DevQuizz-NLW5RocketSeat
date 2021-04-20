import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

// IMAGEM DO GRÁFICO

class ChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,

      child: Stack(
        children: [

          Center(
            child: Container(
              height: 80,
              width: 80,

              // Configuração do gráfico
              child: CircularProgressIndicator(
                strokeWidth: 10,
                value: 0.75,

                //Cor definina na classe 'app_colors'
                backgroundColor: AppColors.chartSecondary,
                //Cor definina na classe 'app_colors'
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),

              ),
            ),
          ),

          Center(
            child: Text("75%",
              style: AppTextStyles.heading,
            ),
          ),


        ],
      ),


    );
  }
}
