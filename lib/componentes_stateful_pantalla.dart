import 'package:flutter/material.dart';

class ComponentesEjemploPantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CronometroWidget(),
            BloqueWiget(),
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
  Stream stream;

  @override
  void initState() {
    super.initState();
    stream = Stream.periodic(Duration(milliseconds: 100), actualizarCronometro);
    stream.listen(null);
  }

  void actualizarCronometro(int contadorStream) {
    if (!mounted) {
      stream.take(0);
      return;
    }
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

class BloqueWiget extends StatefulWidget {
  BloqueWidgetState createState() => new BloqueWidgetState();
}

class BloqueWidgetState extends State<BloqueWiget> {
  bool _color = true;
  int radianes = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        color: _color ? Colors.red : Colors.white,
        height: _color ? 200 : 0,
        width: _color ? 200 : 0,
        transform: Matrix4.rotationZ((radianes++).toDouble()),
        child: new Container(
          height: 100,
          width: 100,
        ),
      ),
      onPressed: () {
        setState(() {
          _color = !_color;
        });
      },
    );
  }
}