import 'package:devquiz/core/app_gradients.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/home/widgets/score_card/score_card_widget.dart';
import 'package:devquiz/shard/models/user_model.dart';
import 'package:flutter/material.dart';

// TELA HOME COM GRADIENTE, QUE CHAMA A CLASSE DO CARD BRANCO QUE FICA EM CIMA

class AppBarWidget extends PreferredSize{
  //Iniciando o usuário
  final UserModel user;

  AppBarWidget( {required this.user})
    :super(
      preferredSize: Size.fromHeight(250),

      child: Container(
        height: 250,
        //corGradiente já foi definido na classe 'app_gradients'

          child: Stack(
            //mainAxisAlignment: MainAxisAlignment.end,
            children: [

              Container(
                height: 161,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: double.maxFinite,
                decoration: BoxDecoration(gradient: AppGradients.corGradiente),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    //Comando 'Text.rich' permite vários textos, com vários estilos distintos
                    Text.rich(
                        TextSpan(
                            text: "Olá, ",
                            style: AppTextStyles.titulo, // Estilo de texto declarado na classe 'app_text_styles'
                            children: [
                              TextSpan(
                                text: user.name,
                                style: AppTextStyles.tituloNegrito,
                              )
                            ]
                        )
                    ),

                    Container(
                        width: 58,
                        height: 58,

                        decoration: BoxDecoration(
                          //Deixa a borda da imagem redonda
                          borderRadius: BorderRadius.circular(10),
                          //Pegando imagem do github
                          image: DecorationImage(
                            image: NetworkImage(user.photoUrl),
                          ),
                        )

                    ),


                  ],
                ),
              ),

              //Chamando a classe score_card_widget, box branco que fica sobrepondo o bar da tela

              Align(
                alignment: Alignment(0.0,1.0),
                child: ScoreCardWidget(percent: user.score/100,),
              )


            ],
          ),


      ),
    );

}
