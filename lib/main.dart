import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/ejemplo_pantalla.dart';
import 'package:flutter_app/estado_pantalla.dart';
import 'package:flutter_app/cupertino_pantalla.dart';
import 'package:flutter_app/componentes_stateful_pantalla.dart';
import 'package:flutter_app/modelos.dart';
import 'package:http/http.dart' as Cliente; // Paquete para consultas http
import 'dart:convert'; // Necesario para convertir texto en JSON a un mapa

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PantallaPrincipal()
    )
  );
}

class PantallaPrincipal extends StatefulWidget {
  PantallaPrincipalState createState() => PantallaPrincipalState();
}

class PantallaPrincipalState extends State<PantallaPrincipal> {
  final List<Usuario> _listaUsuarios = [];

  @override
  void initState() {
    super.initState();
    _listaUsuarios.clear();
    obtenerUsuarios();
  }

  @override
  Widget build(BuildContext context) {
    List<Usuario> hombres = _listaUsuarios.where((usuario) => usuario.genero == "male");
    List<Usuario> mujeres = _listaUsuarios.where((usuario) => usuario.genero == "female");
    return new Scaffold(
      appBar: AppBar(
        title: Text("Aplicacion Flutter"),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircleAvatar(
                    radius: 36,
                    backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/65.jpg"),
                  ),
                  SizedBox(height: 16,),
                  Text("email@example.com"),
                  Text("El programador")
                ],
              ),
            ),
            ListTile(
              title: Text("Ir a la interfaz de ejemplo"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (contextoLocal) => EjemploPantalla()
                ));
              },
            ),
            ListTile(
              title: Text("Pantalla con estado"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (contextoLocal) => EstadoPantalla()
                ));
              },
            ),
            ListTile(
              title: Text("Ejemplos con estado"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (contextoLocal) => ComponentesEjemploPantalla()
                ));
              },
            ),
            ListTile(
              title: Text("Ejemplos de Cupertino"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (contextoLocal) => CupertinoPantalla()
                ));
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 30),
          Text("Hombres:", style: TextStyle(fontSize: 25),),
          ...hombres.map((usuario) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(usuario.urlAvatar),
              ),
              title: Text(usuario.nombreCompleto),
              subtitle: Text(usuario.correo),
              onTap: () {},
            );
          }
          ).toList(),
          SizedBox(height: 30),
          Text("Mujeres:", style: TextStyle(fontSize: 25),),
          ...mujeres.map((usuario) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(usuario.urlAvatar),
              ),
              title: Text(usuario.nombreCompleto),
              subtitle: Text(usuario.correo),
              onTap: () {},
              );
            }
          ).toList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: obtenerUsuarios,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }

  void obtenerUsuarios() async {
    final response = await Cliente.get("https://randomuser.me/api?results=15");
    if (response.statusCode == 200) {
      String strJson = response.body;
      Map<String, dynamic> json = jsonDecode(strJson);
      List jsonListaUsuarios = json["results"] as List;
      _listaUsuarios.clear();
      setState(() {
        _listaUsuarios.addAll(
            jsonListaUsuarios.map(
                    (jsonUsuario) => new Usuario.fromJson(Map.of(jsonUsuario))
            )
        );
      });
    }
  }
}
