import 'package:carros/pages/carro/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

push(BuildContext context, Widget page, {bool replace = false}) {
  if (replace) {
    return Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (BuildContext context) {
        return page;
      },
    ));
  }

  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) {
        return HomePage();
      },
    ),
  );
}

pop(BuildContext context, String text) {
  return Navigator.pop(
    context,
    text,
  );
}