import 'package:flutter/material.dart';

import 'incident.dart';

class AddIncidentPage extends StatefulWidget {
  final Function(Incident incident) onIncidentAdded;

  const AddIncidentPage({Key? key, required this.onIncidentAdded}) : super(key: key);

  @override
  _AddIncidentPageState createState() => _AddIncidentPageState();
}

class _AddIncidentPageState extends State<AddIncidentPage> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _description;
  late String _status;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.onIncidentAdded(Incident(title: _title, description: _description, status: _status));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agregar Incidente"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Título"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor ingrese un título";
                  }
                  return null;
                },
                onSaved: (value) {
                  _title = value!;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(labelText: "Descripción"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor ingrese una descripción";
                  }
                  return null;
                },
                onSaved: (value) {
                  _description = value!;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(labelText: "Estado"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor ingrese un estado";
                  }
                  return null;
                },
                onSaved: (value) {
                  _status = value!;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text("Agregar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
