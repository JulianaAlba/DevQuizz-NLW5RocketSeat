import 'package:flutter/material.dart';
import 'package:devquiz/core/app_gradients.dart';
import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/home/home_page.dart';

import 'package:flutter/material.dart';

import '../core/app_gradients.dart';
import '../core/app_images.dart';

class SplashPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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