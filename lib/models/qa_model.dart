class QuestionModel {
  String titulo;
  int valor; //respuesta
  String min;
  String max;

  QuestionModel({
    required this.titulo,
    required this.valor,
    required this.min,
    required this.max,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      titulo: json['titulo'],
      valor: json['valor'],
      min: json['min'],
      max: json['max'],
    );
  }
}