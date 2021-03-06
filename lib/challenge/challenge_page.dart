import 'package:devquiz/challenge/challenge_controller.dart';
import 'package:devquiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:devquiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/home/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/result/result_page.dart';
import 'package:devquiz/shard/models/question_model.dart';
import 'package:flutter/material.dart';


class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;

  ChallengePage({Key? key, required this.questions, required this.title}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
} //StateFul

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();


  // FUNÇÃO EXTRA DE ALTERAÇÃO DE IMAGEM
  String FuncaoResultadoImagem(){
    if(widget.questions.length ==  controller.qtdAcertos){ // Resultado máximo
      return AppImages.trophy;}
    else if (0 == controller.qtdAcertos){ //Resultado 0
      return AppImages.error;}
    else{
      return AppImages.check;}

  }

  // FUNÇÃO EXTRA DE ALTERAÇÃO DE MENSAGEM
  String FuncaoResultadoMensagem(){
    if(widget.questions.length ==  controller.qtdAcertos){ // Resultado máximo
      return "Parabéns, você foi Excelente!";}
    else if (0 == controller.qtdAcertos){ //Resultado 0
      return "Não desista, você pode melhorar!";}
    else{
      return "Parabéns, você foi Bem!";}



  }

  //widget.title


  @override
  void initState(){
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1; //somando progresso das questões, para deslize de tela lateral
    });
    super.initState();
  }

  //Função com Animação de passagem de tela, scroll lateral, deslize definido por tempo
  void nextPage(){
    if (controller.currentPage < widget.questions.length)
    pageController.nextPage(duration: Duration(milliseconds: 200), curve: Curves.linear);
  }

  void onSelected(bool value){
    if(value){
      controller.qtdAcertos++;
    }
    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),

        //SafeArea cria uma área segura no topo, já que estamos criando um "body" na appbar
        child: SafeArea (
          top: true,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //BackButton(), //Botão de voltar para tela anterior, quando usa-se o push no navigator OU escolhe um ícone que não seja seta e declara como abaixo
              IconButton(
                  icon: Icon(Icons.close),
                  onPressed: (){Navigator.pop(context);}
              ),

              ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => QuestionIndicatorWidget(
                    currentPage:  value,
                    length:  widget.questions.length,
                ),
              )
              

            ],
          ),
        ),

      ),


      // Aciona animação de deslize de tela lateral, para visualizar a próxima questão
      body: PageView(
        physics: NeverScrollableScrollPhysics(), //Comando para travar o scroll lateral e deixar a tela estática sem deslize
        controller: pageController,
        children: widget.questions.map((e) => QuizWidget(question: e, onSelected: onSelected, ),).toList(), ////TIREI POR ÚLTIMO O TÍTULO
      ),

      //QuizWidget(question: widget.questions[0], title: "",),


      bottomNavigationBar: SafeArea(
        bottom: true,

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),

          child: ValueListenableBuilder<int>(
            valueListenable: controller.currentPageNotifier,

            builder: (context, value, _) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
                if (value < widget.questions.length)
                  Expanded(
                    child: NextButtonWidget.white(
                      label: "Pular",
                      onTap: nextPage,
                    ),
                  ),
                if (value == widget.questions.length)
                  Expanded(
                    child: NextButtonWidget.green(
                      label: "Finalizar",
                      onTap: (){
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => ResultPage(length: widget.questions.length, result: controller.qtdAcertos, resultadoImagem: FuncaoResultadoImagem(), resultadoMensagem: FuncaoResultadoMensagem(),)),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),


        ),
      ),

    );

  }
}
