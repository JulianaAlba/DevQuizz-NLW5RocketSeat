import 'package:devquiz/home/home_page.dart';
import 'package:devquiz/splash/splash_page.dart';
import 'package:flutter/material.dart';


class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DevQuiz",
      //Chamando a classe home_page
      home: HomePage(),

    );
  }
}