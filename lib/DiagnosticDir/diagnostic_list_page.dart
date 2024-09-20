import 'package:flutter/material.dart';
import '../DiagnosticDir/diagnostic_details_page.dart';
import 'diagnostic_fake_api.dart';

class DiagnosticListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de diagnósticos'),
      ),
      body: ListView.builder(
        itemCount: diagnosticDataList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Diagnóstico #${diagnosticDataList[index].id}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DiagnosticDetailsPage(diagnosticData: diagnosticDataList[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
