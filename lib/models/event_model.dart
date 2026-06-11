class EventModel {
  String patient;
  String hour;
  String description;

  EventModel({
    required this.patient,
    required this.hour,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {'patient': patient, 'hour': hour, 'description': description};
  }

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      patient: json['patient'],
      hour: json['hour'],
      description: json['description'],
    );
  }
}
