import 'package:flutter/material.dart';

import 'incident.dart';
import 'add_incident_page.dart';

class IncidentListPage extends StatefulWidget {
  @override
  _IncidentListPageState createState() => _IncidentListPageState();
}

class _IncidentListPageState extends State<IncidentListPage> {
  List<Incident> _incidents = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    List<Incident> incidents = await FakeApi.getIncidents();
    setState(() {
      _incidents = incidents;
    });
  }

  void _onItemSelected(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => IncidentDetailsPage(incident: _incidents[index]),
      ),
    );
  }

  void _onAddIncidentPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddIncidentPage(
          onIncidentAdded: (incident) {
            setState(() {
              _incidents.add(incident);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Incidentes"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _onAddIncidentPressed,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _incidents.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_incidents[index].title),
            subtitle: Text(_incidents[index].description),
            trailing: Text(_incidents[index].status),
            onTap: () => _onItemSelected(index),
          );
        },
      ),
    );
  }
}

class IncidentDetailsPage extends StatelessWidget {
  final Incident incident;

  const IncidentDetailsPage({Key? key, required this.incident}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalles del incidente"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(incident.title, style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 8),
            Text(incident.description),
            SizedBox(height: 16),
            Text("Estado: ${incident.status}", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
