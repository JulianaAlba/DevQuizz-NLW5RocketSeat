import 'package:devquiz/challenge/challenge_page.dart';
import 'package:devquiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/home/home_controller.dart';
import 'package:devquiz/home/home_state.dart';
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
  // Iniciando/chamando a classe home_controller (usuário e quiz)
  final controller = HomeController();

  @override
  void initState(){
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    //addlistener ouve todas as alterações que acontecerem no stateNotifier
    controller.stateNotifier.addListener(() {
      setState(() { });
    });


  }


  @override
  Widget build(BuildContext context) {

    if (controller.state == HomeState.sucess) {
      return Scaffold(

        //Chamando a classe app_bar_widget
        appBar: AppBarWidget(user: controller.user!,),
        //exclamação garante que não vai ser nulo

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
                child: GridView
                    .count( //Comando similar ao listview, porém, esse comando ainda define a quantidade com crossAxisCount, de quantos componentes por linha
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16, //Espaçamentos entre os cards brancos

                  children: controller.quizzes!
                      .map((e) =>
                      QuizCardWidget(
                        title: e.title,
                        //enviando quantas questoes foram feitas de length = 10
                        completed:
                          "${e.questionAnswered} de ${e.questions.length}",
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ChallengePage(questions: e.questions, ),
                            ));
                          },
                        percent: e.questionAnswered / e.questions.length,
                        //answeredQuestions: e.answeredQuestions,
                        //totalQuestions: e.questions.length,
                        //image: e.image,
                      ))
                      .toList(),

                ),
              ),


            ],
          ),


        ),


      );
    }

    else {
      //Scaffold retornando estado de carregamento de uma página/dados, enquanto aguarda delay/tempo de acesso definido no home_controller
      return Scaffold(
          body: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
                strokeWidth: 3,
              )));
    }

  }
}

