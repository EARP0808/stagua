import 'package:flutter/material.dart';
import 'diagnostic_fake_api.dart';

class DiagnosticDetailsPage extends StatelessWidget {
  final DiagnosticData diagnosticData;

  DiagnosticDetailsPage({required this.diagnosticData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diagnóstico #${this.diagnosticData.id}'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Estado de la conexión'),
            Switch(
              value: this.diagnosticData.connectionStatus,
              onChanged: null,
            ),
            SizedBox(height: 16.0),
            Text('Temperatura'),
            Text('${this.diagnosticData.temperature} °C'),
            SizedBox(height: 16.0),
            Text('Humedad'),
            Text('${this.diagnosticData.humidity} %'),
            SizedBox(height: 16.0),
            Text('Voltaje'),
            Text('${this.diagnosticData.voltage} V'),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
