import 'package:flutter/material.dart';

class EstadoPantalla extends StatefulWidget {
  EstadoPantallaState createState() => new EstadoPantallaState();
}

class EstadoPantallaState extends State<EstadoPantalla> {
  // variable privada
  int _contador = 1;
  Widget build(BuildContext contexto) {
    return new Scaffold(
      body: new Center(
        child: new RaisedButton(
          child: new Text("Contador: $_contador"),
          onPressed: () {
            // de forma imperativa seria:
            // mitexto.setText("contador: " + _contador)
            setState(() => _contador += 1);
          },
        ),
      ),
    );
  }
}