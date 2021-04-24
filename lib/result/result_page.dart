import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/core/core.dart';
import 'package:devquiz/home/widgets/next_button/next_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  //final String title;
  final int length;
  final int result;
  String resultadoImagem;
  String resultadoMensagem;

  ResultPage(
      {Key? key,
        //required this.title,
        required this.length,
        required this.result,
        required this.resultadoImagem,
        required this.resultadoMensagem,

      })
      : super(key: key);


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.only(top: 100),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [

            Image.asset(resultadoImagem), //IMAGEM DINÂMICA

            Column(
              children: [
                Text(
                  (resultadoMensagem), //MENSAGEM DINÂMICA
                  textAlign: TextAlign.center,
                  style: AppTextStyles.heading40,
                ),

                SizedBox(height: 16),

                Text.rich(
                  TextSpan(
                    text: "Você concluiu",
                    style: AppTextStyles.body,
                    children: [
                      TextSpan(
                        text: "\no desafio com",
                        //text: "\n$resultadoMensagem",
                        style: AppTextStyles.body,
                      ),
                      TextSpan(
                        text: "\n$result de $length acertos",
                        style: AppTextStyles.bodyBold,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),

              ],
            ),


            Column(
              children: [

                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),

                        child: NextButtonWidget.purple(
                          label: "Compartilhar",
                          onTap: () {
                            //Adicionado plugin share_plus no projeto e pubspec foi atualizado automaticamente
                            Share.share(
                                'App DevQuiz - Resultado do Quiz: $resultadoMensagem.\n Obtive: $result / $length de aproveitamento!', subject: "hello",
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 24),

                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),

                        child: NextButtonWidget.white(
                            label: "Voltar",
                            onTap: () {
                              Navigator.pop(context);
                            }),
                      ),
                    ),
                  ],
                ),


              ],
            ),


          ],
        ),
      ),
    );
  }
}
