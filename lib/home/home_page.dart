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
        padding: const EdgeInsets.symmetric(horizontal: 10,),

          child: Column(
           children: [

             SizedBox(height: 20),

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


            SizedBox(height: 20,),


          //Chamando cards brancos verticais
             Expanded(
               child: GridView.count( //Comando similar ao listview, porém, esse comando ainda define a quantidade com crossAxisCount, de quantos componentes por linha
                 crossAxisCount: 2,
                 crossAxisSpacing: 16,
                 mainAxisSpacing: 16, //Espaçamentos entre os cards brancos

                 children: [
                   QuizCardWidget(),
                   QuizCardWidget(),
                   QuizCardWidget(),
                   QuizCardWidget(),

                 ],
               ),
             ),




          ],
        ),


      ),




    );
  }
}

