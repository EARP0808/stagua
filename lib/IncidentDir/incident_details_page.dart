import 'package:flutter/material.dart';

class IncidentDetailsPage extends StatelessWidget {
  final String incident;

  IncidentDetailsPage({required this.incident});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Incidente'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Incidente: $incident',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Nombre de Incidente'),
                  TextField(),
                  SizedBox(height: 16.0),
                  Text('Detalle'),
                  TextField(),
                  SizedBox(height: 16.0),
                  Text('Descripción'),
                  TextField(),
                  SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}