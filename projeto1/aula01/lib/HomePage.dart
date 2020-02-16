import 'package:aula01/pages/hello_listview.dart';
import 'package:aula01/pages/hello_page2.dart';
import 'package:aula01/pages/hello_page3.dart';
import 'package:aula01/utils/nav.dart';
import 'package:aula01/widgets/blue_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'drawer_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Dog App'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: "TAB 1"),
              Tab(text: "TAB 2"),
              Tab(text: "TAB 3"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _body(context),
            Container(color: Colors.green),
            Container(
              color: Colors.yellow,
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.adb),
          onPressed: () {
            _onClickFab();
          },
        ),
        drawer: DrawerList(),
      ),
    );
  }

  _onClickFab() {
    print('Adicionar');
  }

  _body(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _text(),
          _pageView(),
          _buttons(),
        ],
      ),
    );
  }

  _pageView() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      height: 300,
      child: PageView(
        children: <Widget>[
          _img("assets/images/dog1.jpg"),
          _img("assets/images/dog2.jpg"),
          _img("assets/images/dog3.jpg"),
          _img("assets/images/dog4.jpg"),
          _img("assets/images/dog5.jpg"),
          _img("assets/images/dog6.jpg"),
          _img("assets/images/dog7.jpg"),
          _img("assets/images/dog8.jpg"),
        ],
      ),
    );
  }

  _buttons() {
    return Builder(
      builder: (BuildContext context) {
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton('ListView',
                    onPressed: () =>
                        _onClickNavigator(context, HelloListView())),
                BlueButton('Page 2',
                    onPressed: () => _onClickNavigator(context, HelloPage2())),
                BlueButton('Page 3',
                    onPressed: () => _onClickNavigator(context, HelloPage3()))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton('Snack', onPressed: () => _onClickSnack(context)),
                BlueButton('Dialog', onPressed: () => _onClickDialog(context)),
                BlueButton('Toast', onPressed: _onClickToast),
              ],
            )
          ],
        );
      },
    );
  }

  _onClickNavigator(BuildContext context, Widget page) async {
    String s = await push(context, page);
    print(">> $s");
  }

  _onClickSnack(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('Olá, flutter'),
      action: SnackBarAction(
        textColor: Colors.yellow,
        label: 'OK',
        onPressed: () {
          print('Snack Bar Button Pressed');
        },
      ),
    ));
  }

  _onClickDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text('Flutter é top'),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {
                  Navigator.pop(context);
                  print('Cancel Button clicked');
                },
              ),
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                  print('OK Button clicked');
                },
              )
            ],
          );
        });
  }

  _onClickToast() {
    Fluttertoast.showToast(
      msg: "Using TOAST on Flutter",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 1,
      backgroundColor: Colors.lightBlueAccent[200],
      textColor: Colors.white,
      fontSize: 26.0,
    );
  }

  _img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }

  _text() {
    return Text(
      'What\'s your favorite puppy?',
      style: TextStyle(
          color: Colors.indigo[300],
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
          decorationColor: Colors.pink[100],
          decorationStyle: TextDecorationStyle.solid),
    );
  }
}
