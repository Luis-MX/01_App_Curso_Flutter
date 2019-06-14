import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoPantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Pantalla iOS"),
        trailing: CupertinoButton(
          padding: EdgeInsets.all(0),
          child: Text("Salir"),
          onPressed: () {},
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CupertinoButton.filled(
              child: Text("Click!!!!"),
              onPressed: () {},
            ),
            CupertinoSwitch(
              value: true,
              onChanged: (val) { return val;},
            )
          ],
        ),
      ),
    );
  }
}