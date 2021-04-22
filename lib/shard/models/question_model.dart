
import 'package:devquiz/shard/models/awnser_model.dart';

class QuestionModel {
  final String title;
  final List<AwnserModel> awnsers;

  QuestionModel ({
    // A questão precisa ter obrigatoriamente 4 POSSÍVEIS respostas
    required this.title, required this.awnsers })
      : assert(
          awnsers.length == 4,
  );
}