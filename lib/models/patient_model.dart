class PatientModel {
  String name;
  int age;
  String rut;
  String status;
  String lastSession;

  PatientModel({
    required this.name,
    required this.age,
    required this.rut,
    required this.status,
    required this.lastSession,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'rut': rut,
      'status': status,
      'lastSession': lastSession,
    };
  }

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      name: json['name'],
      age: json['age'],
      rut: json['rut'],
      status: json['status'],
      lastSession: json['lastSession'],
    );
  }
}