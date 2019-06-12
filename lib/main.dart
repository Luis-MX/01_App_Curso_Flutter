import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/ejemplo_pantalla.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PantallaPrincipal()
    )
  );
}

class PantallaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Aplicacion Flutter"),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: Container(height: 50,),
            ),
            ListTile(
              title: Text("Ir a la interfaz de ejemplo"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (contextoLocal) => EjemploPantalla()
                ));
              },
            )
          ],
        ),
      ),
    );
  }

}
