import 'package:devquiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:devquiz/home/widgets/level_button/level_button_widget.dart';
import 'package:devquiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  HomePage ({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //Chamando a classe app_bar_widget
      appBar: AppBarWidget(),

      body: Padding(
        // Na aula o valor de horizontal era 20, mas extrapolou a tela do emulador atual
        padding: const EdgeInsets.symmetric(horizontal: 10),

          child: Column(
           children: [

             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              //Chamando labels horizontais
              children: [
                LevelButtonWidget(label: "Fácil"),
                LevelButtonWidget(label: "Médio"),
                LevelButtonWidget(label: "Difícil"),
                LevelButtonWidget(label: "Perito"),
              ],
            ),

          //Chamando cards brancos verticais
            QuizCardWidget(),

          ],
        ),


      ),




    );
  }
}

