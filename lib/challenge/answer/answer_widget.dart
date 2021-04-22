import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

// Widget caixa branca e seus Componentes

class AnswerWidget extends StatelessWidget {
  //final String answer;
  final String title;
  final bool isRight; //SeCorreto
  final bool isSelectde; //SeSelecionado

  const AnswerWidget({
    Key? key,
    required this.title,
    this.isRight = false,
    this.isSelectde = false,
  }) : super(key: key);


  // INÍCIO BLOCO DE CÓDIGO SWIFT - para analisar as cores do box

  Color get _selectedColorRight =>
      isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight =>
      isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => isRight ? Icons.check : Icons.close;

  // FIM BLOCO DE CÓDIGO SWIFT - para analisar as cores do box


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),

        // caixa branca retangular
        decoration: BoxDecoration(
          //alteração de cor baseado em operações lógicas em js
          color: isSelectde ? _selectedColorCardRight : AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(BorderSide(
            //alteração de cor baseado em operações lógicas em js
              color: isSelectde ? _selectedBorderCardRight : AppColors.border,
          )),
        ),

        // componentes caixa branca
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Expanded(
              child: Text(
                title,
                //alteração de style baseado em operações lógicas em js
                style: isSelectde ? _selectedTextStyleRight : AppTextStyles.body,

              ),

            ),

            // ícone circular check
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                //alteração de cor baseado em operações lógicas em js
                color:  isSelectde? _selectedColorRight : AppColors.white, //tirei darkgreen
                borderRadius: BorderRadius.circular(500),
                border: Border.fromBorderSide(BorderSide(
                  //alteração de cor baseado em operações lógicas em js
                  color: isSelectde? _selectedBorderRight : AppColors.border,
                )),
              ),

              //Ícone só aparece quando houver seleção - operação lógica em js
              child: isSelectde ? Icon(
                _selectedIconRight,
                color: Colors.white,
                size: 16,
              ) : null,


            ),


          ],
        ),


      ),
    );




  }
}
