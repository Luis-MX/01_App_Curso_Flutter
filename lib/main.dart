import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
    List<String> nombres = ["Luis", "Enrique"];
    return new Scaffold(
      appBar: AppBar(
        title: Text("Aplicacion Flutter"),
      ),
      drawer: Drawer(),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (BuildContext contexto, int indice) {
            return ListTile(
              leading: Text("${indice + 1}"),
              title: Text(nombres[indice]),
              trailing: Icon(Icons.done),
              subtitle: Text("Subtitulo"),
              onTap: () {},
            );
          },
          itemCount: nombres.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("boton presionado");
        },
        child: Icon(Icons.done),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("inicio")),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            title: Text("Acerca de")
          )
        ],
      ),
    );
  }

}
