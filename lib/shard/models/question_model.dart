import 'dart:convert';
import 'package:devquiz/shard/models/awnser_model.dart';


class QuestionModel {
  final String title;
  final List<AwnserModel> answers;

  QuestionModel ({
    // A questão precisa ter obrigatoriamente 4 POSSÍVEIS respostas
    required this.title, required this.answers })
      : assert(
      answers.length == 4,
  );


// Inicio das Propriedades JSON geradas automaticamente

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'answers': answers.map((x) => x.toMap()).toList(),
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      title: map['title'],
      answers: List<AwnserModel>.from(
          map['answers']?.map((x) => AwnserModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source));

// Fim das Propriedades JSON geradas automaticamente


}