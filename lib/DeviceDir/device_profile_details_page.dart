import 'package:flutter/material.dart';

class DeviceProfileDetailsPage extends StatelessWidget {
  final Map<String, dynamic> device;

  DeviceProfileDetailsPage({required this.device});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(device['name']),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Información del Dispositivo',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 8),
              _buildDeviceInfoList(),
              SizedBox(height: 16),
              Text(
                'Últimos Diagnosticos',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 8),
              _buildLatestDiagnosticsList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeviceInfoList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDeviceInfoItem('Nombre', device['name'] ?? ''),
        _buildDeviceInfoItem('Modelo', device['model'] ?? ''),
        _buildDeviceInfoItem('Tiempo de Trabajo', device['timeStatus'] ?? ''),
        _buildDeviceInfoItem('Estado de Batería', device['batteryStatus'] ?? ''),
        _buildDeviceInfoItem(
            'Firmware Version', device['firmwareVersion'] ?? ''),
      ],
    );
  }

  Widget _buildDeviceInfoItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(child: Text(title)),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLatestDiagnosticsList() {
    if (device['latestDiagnostics'] == null ||
        device['latestDiagnostics'].isEmpty) {
      return Text('No se han encontrado diagnosticos');
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: device['latestDiagnostics']
          .map<Widget>((diagnostic) => _buildDiagnosticItem(diagnostic))
          .toList(),
    );
  }

  Widget _buildDiagnosticItem(Map<String, dynamic> diagnostic) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            diagnostic['title'],
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(diagnostic['description']),
        ],
      ),
    );
  }
}
