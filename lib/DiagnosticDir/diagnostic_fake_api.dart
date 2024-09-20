class DiagnosticData {
  final int id;
  final bool connectionStatus;
  final double temperature;
  final double humidity;
  final double voltage;

  DiagnosticData({
    required this.id,
    required this.connectionStatus,
    required this.temperature,
    required this.humidity,
    required this.voltage,
  });
}

List<DiagnosticData> diagnosticDataList = [
  DiagnosticData(
    id: 1,
    connectionStatus: true,
    temperature: 25.0,
    humidity: 70.0,
    voltage: 220.0,
  ),
  DiagnosticData(
    id: 2,
    connectionStatus: false,
    temperature: 28.0,
    humidity: 65.0,
    voltage: 230.0,
  ),
  // Agrega más diagnósticos aquí
];
