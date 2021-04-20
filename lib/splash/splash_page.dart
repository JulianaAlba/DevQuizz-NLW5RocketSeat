import 'package:devquiz/core/app_gradients.dart';
import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/core/app_widget.dart';
import 'package:flutter/material.dart';

// TELA INICIAL LOGO COM INTERROGAÇÃO

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.corGradiente,
        ),
        
        child: Center(
          //Nome da imagem declarada na classe 'app_images' e não direto no pubspec, apenas início da extensão que foi declarado lá
          child: Image.asset(AppImages.logoInterrogacao),

        ),

      ),

    );
  }
}
