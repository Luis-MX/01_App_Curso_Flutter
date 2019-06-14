import 'package:flutter/material.dart';
import 'package:flutter_app/parametros_pantalla.dart';


class EjemploPantalla extends StatelessWidget {
  // Pasos para obtener y modificar el texto en un TextField
  // Paso 1: Crear instancia de TextEditingController
  TextEditingController _controladorTexto =
    new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplicacion Flutter"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 16,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: _controladorTexto, // Paso 2
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.account_circle),
                        labelText: "Nombre"
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.email),
                        labelText: "Email"
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Chip(
                        label: Row(
                          children: <Widget>[
                            Icon(Icons.calendar_today),
                            Text("12-06-2019")
                          ],
                        ),
                      ),
                      Chip(
                        label: Row(
                          children: <Widget>[
                            Icon(Icons.watch_later),
                            Text("13:45")
                          ],
                        ),
                      ),
                    ],
                  ),
                  RaisedButton(
                    child: Text("Guardar"),
                    onPressed: () async {
                      // Paso 3: llamar a TextEditingController
                      String nombre = _controladorTexto.text;
                      // Forma de recibir un resultado de la pantalla <ParametrosPantall>
                      final result = await Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext contextoLocal) => new ParametrosPantalla(nombre)
                      ));
                      print(result);
                      _controladorTexto.text = result;
                    },
                  )
                ],
              ),
            )
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: Icon(Icons.menu),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: MaterialButton(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.home),
                      Text("Inicio")
                    ],
                  ),
                ),
                onPressed: () {},
              ),
            ),
            Expanded(
              flex: 2,
              child: MaterialButton(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.account_circle),
                      Text("Perfil")
                    ],
                  ),
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
