import 'package:devquiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Classe com a programação da linha com os Botões de níveis

class LevelButtonWidget extends StatelessWidget {
  final String label;

  LevelButtonWidget({
    Key? key,
    required this.label,

    // Label não pode ser diferentes desses 4, pois a operação não executa
  }) : assert (["Fácil","Médio","Difícil","Perito"].contains(label)),
    super(key: key);



  final config = {
    'Fácil': {
      'color': AppColors.levelButtonFacil,
      'borderColor': AppColors.levelButtonBorderFacil,
      'fontColor': AppColors.levelButtonTextFacil,
    },
    'Médio': {
      'color': AppColors.levelButtonMedio,
      'borderColor': AppColors.levelButtonBorderMedio,
      'fontColor': AppColors.levelButtonTextMedio,
    },
    'Difícil': {
      'color': AppColors.levelButtonDificil,
      'borderColor': AppColors.levelButtonBorderDificil,
      'fontColor': AppColors.levelButtonTextDificil,
    },
    'Perito': {
      'color': AppColors.levelButtonPerito,
      'borderColor': AppColors.levelButtonBorderPerito,
      'fontColor': AppColors.levelButtonTextPerito,
    },
  };


  Color get color => config[label]!['color']!;
  Color get borderColor => config[label]!['borderColor']!;
  Color get fontColor => config[label]!['fontColor']!;


  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        //definido no bloco anterior get
        color: color,
        border: Border.fromBorderSide(BorderSide(
          //definido no bloco anterior get
          color: borderColor,
        )),
        borderRadius: BorderRadius.circular(28),
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 6),

        child: Text(label,
          style: GoogleFonts.notoSans(
            //definido no bloco anterior get
            color: fontColor,
              fontSize: 13,
          ),
        ),

      ),


    );

  }
}

