
import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/home/home_state.dart';
import 'package:devquiz/shard/models/awnser_model.dart';
import 'package:devquiz/shard/models/question_model.dart';
import 'package:devquiz/shard/models/quiz_model.dart';
import 'package:devquiz/shard/models/user_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;


  // Controlar Usuários
  UserModel? user;

  // Controlar Quizzes
  List<QuizModel>? quizzes;

  
  void getUser() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));

    user = UserModel(name: "Juliana Alba", photoUrl: "https://avatars.githubusercontent.com/u/12674919?v=4",);
    state = HomeState.sucess;
  }


  void getQuizzes() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));

    quizzes = [QuizModel(
      title: "NLW 5 Flutter",
      imagem: AppImages.blocks,
      level: Level.facil,

        questionAnswered: 1,

        questions: [
          QuestionModel(title: "Está curtindo o Flutter?", awnsers: [
            AwnserModel(title: "Estou amando o flutter!"),
            AwnserModel(title: "Estou adorando o flutter!"),
            AwnserModel(title: "Estou indiferente ao flutter!"),
            AwnserModel(title: "Estou odiando o flutter!", isRight: true),
            ]),

          QuestionModel(title: "Está curtindo o Flutter?", awnsers: [
            AwnserModel(title: "Estou amando o flutter!"),
            AwnserModel(title: "Estou adorando o flutter!"),
            AwnserModel(title: "Estou indiferente ao flutter!"),
            AwnserModel(title: "Estou odiando o flutter!", isRight: true),
          ]),


          ])];

    state = HomeState.sucess;

  }


}