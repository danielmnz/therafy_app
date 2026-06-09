import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'qa_model.dart';
import 'dart:convert';

class QaViewModel extends ChangeNotifier {
  List<QuestionModel> questions = [];

  QaViewModel() {
    loadQuestions();
  }

  Future<void> loadQuestions() async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/preguntas.json',
    );

    final data = json.decode(jsonString);

    questions = [];

    for (var question in data['usabilidad']) {
      questions.add(QuestionModel.fromJson(question));
    }

    for (var question in data['contenido']) {
      questions.add(QuestionModel.fromJson(question));
    }

    for (var question in data['compartir']) {
      questions.add(QuestionModel.fromJson(question));
    }

    notifyListeners();
  }

  void updateAnswer(int index, int value) {
      questions[index].valor = value;
      notifyListeners();
    }
}
