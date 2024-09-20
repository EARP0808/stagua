import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'dart:convert';
import 'device_profile_details_page.dart';

class DeviceProfileListPage extends StatefulWidget {
  @override
  _DeviceProfileListPageState createState() => _DeviceProfileListPageState();
}

class _DeviceProfileListPageState extends State<DeviceProfileListPage> {
  final List<Map<String, dynamic>> _devices = [
    {
      'id': 1,
      'name': 'Dispositivo 1',
      'model': 'Modelo 150',
      'timeStatus': '05:00 horas',
      'batteryStatus': '46%',
      'firmwareVersion': 'Version 1',
    },
    {
      'id': 2,
      'name': 'Dispositivo 2',
      'model': 'Modelo 250',
      'timeStatus': '02:30 horas',
      'batteryStatus': '65%',
      'firmwareVersion': 'Version 2',
    },
    {
      'id': 3,
      'name': 'Dispositivo 3',
      'model': 'Modelo 3',
      'timeStatus': 'Tiempo 3',
      'batteryStatus': 'Bateria 3',
      'firmwareVersion': 'Version 3',
    },
  ];

  // @override
  // void initState() {
  //   super.initState();
  //   _fetchDevices();
  // }
  //
  // Future<void> _fetchDevices() async {
  //   final response =
  //   await http.get(Uri.parse('https://api.example.com/devices'));
  //
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       _devices = json.decode(response.body);
  //     });
  //   } else {
  //     throw Exception('Failed to fetch devices');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Dispositivos'),
      ),
      body: _buildDeviceList(),
    );
  }

  Widget _buildDeviceList() {
    if (_devices.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return ListView.builder(
      itemCount: _devices.length,
      itemBuilder: (BuildContext context, int index) {
        final device = _devices[index];
        return ListTile(
          title: Text(_devices[index]['name']),
          subtitle: Text(_devices[index]['model']),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DeviceProfileDetailsPage(device: device),
              ),
            );
          },
        );
      },
    );
  }
}
