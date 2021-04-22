
import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/home/home_repository.dart';
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

  final repository = HomeRepository();

  
  void getUser() async {
    state = HomeState.loading;
    user = await repository.getUser();
    //print (user?.toJson());
    state = HomeState.sucess;
  }


  void getQuizzes() async {
    state = HomeState.loading;
    quizzes = await repository.getQuizzes();
    //print(quizzes?.length);
    state = HomeState.sucess;

  }


}