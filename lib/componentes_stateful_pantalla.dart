import 'package:flutter/material.dart';

class ComponentesEjemploPantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CronometroWidget()
          ],
        ),
      ),
    );
  }
}
class CronometroWidget extends StatefulWidget {
  CronometroState createState() => new CronometroState();
}

class CronometroState extends State<CronometroWidget> {
  int segundos = 0;
  int decimasSegundos = 0;

  @override
  void initState() {
    super.initState();
    Stream.periodic(Duration(milliseconds: 100), actualizarCronometro)
      .listen(null);
  }

  void actualizarCronometro(int contadorStream) {
    setState(() {
      // El operador ~/ divide el contador entre 10 y lo convierte e entero
      segundos = contadorStream ~/ 10;
      decimasSegundos = contadorStream % 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text("$segundos.$decimasSegundos",
      style: Theme.of(context).textTheme.display2);
  }
}
