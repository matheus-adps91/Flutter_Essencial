import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  String texto;
  Function onPressed;
  Color color;

  BlueButton(this.texto, {@required this.onPressed, this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        color: color,
        child: Text(
          texto,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        onPressed: onPressed);
  }
}
