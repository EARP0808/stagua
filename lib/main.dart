import 'package:flutter/material.dart';
import 'package:mapp/IncidentDir/incident_list_page.dart';
import 'DiagnosticDir/diagnostic_list_page.dart';
import 'DeviceDir/device_profile_list_page.dart';
import 'HomePage.dart';


void main(){
  runApp(MyApp());
}

final List<MaterialPage> pages = [
  MaterialPage(child: HomePage()),
  MaterialPage(child: IncidentListPage()),
  MaterialPage(child: DiagnosticListPage()),
  MaterialPage(child: DeviceProfileListPage()),
];


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Navigator(
        pages: pages,
        onPopPage: (route, result) => route.didPop(result),
      ),
    );
  }
}