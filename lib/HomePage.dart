

import 'package:flutter/material.dart';
import 'main.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: ElevatedButton(
          child: Text('Bienvenido a la pagina principal'),
          onPressed: () {
            // Navigator.of(context).push(MaterialPageRoute(builder: (_) => HomePage()));
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('emappa mApp'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            // ListTile(
            //   title: Text('Inicio'),
            //   leading: Icon(Icons.home),
            //   onTap: () {
            //     Navigator.of(context).popUntil((route) => route.isFirst);
            //     Navigator.of(context).push(pages[3].createRoute(context));
            //   },
            // ),
            ListTile(
              title: Text('Registro de incidentes'),
              leading: Icon(Icons.info),
              onTap: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.of(context).push(pages[1].createRoute(context));
              },
            ),
            ListTile(
              title: Text('Diagnóstico'),
              leading: Icon(Icons.info),
              onTap: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.of(context).push(pages[2].createRoute(context));
              },
            ),
            ListTile(
              title: Text('Perfil de Dispositivo'),
              leading: Icon(Icons.info),
              onTap: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.of(context).push(pages[3].createRoute(context));
              },
            ),
          ],
        ),
      ),
    );
  }
}