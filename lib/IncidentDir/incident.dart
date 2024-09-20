import 'dart:async';

class Incident {
  final String title;
  final String description;
  final String status;

  Incident({required this.title, required this.description, required this.status});
}

class FakeApi {
  static Future<List<Incident>> getIncidents() async {
    return [
      Incident(
        title: "Incidente 1",
        description: "Este es el incidente número 1",
        status: "En proceso",
      ),
      Incident(
        title: "Incidente 2",
        description: "Este es el incidente número 2",
        status: "Resuelto",
      ),
      Incident(
        title: "Incidente 3",
        description: "Este es el incidente número 3",
        status: "Pendiente",
      ),
    ];
  }
}