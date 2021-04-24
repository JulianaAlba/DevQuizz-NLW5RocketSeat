import 'package:devquiz/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:devquiz/core/app_gradients.dart';
import 'package:devquiz/core/app_images.dart';
import '../core/app_gradients.dart';
import '../core/app_images.dart';

//TELA DE INTERROGAÇÃO

class SplashPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //Aparece durante 2 segundos, chama home_page | splah some da pilha quando usa-se pushReplacement
    Future.delayed(Duration(seconds: 2)).then((_) =>
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage())
        ),
    );


    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.corGradiente,
        ),

        child: Center(
          child: Image.asset(AppImages.logoInterrogacao),
        ),
      ),
    );
  }

}