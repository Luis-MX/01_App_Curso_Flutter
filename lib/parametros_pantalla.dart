import 'package:flutter/material.dart';

class ParametrosPantalla extends StatelessWidget {
  final _nombre;
  ParametrosPantalla(this._nombre);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text(_nombre),
      ),
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
        onPressed: () {
          // Objeto que es enviado a la pantalla anterior, puede ser de cualquier tipo
          Navigator.pop(context, "Objeto resultado");
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}