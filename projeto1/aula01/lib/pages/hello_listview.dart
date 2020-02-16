import 'package:aula01/pages/dog_page.dart';
import 'package:aula01/utils/nav.dart';
import 'package:flutter/material.dart';

class Dog {
  String nome;
  String foto;

  Dog(this.nome, this.foto);
}

class HelloListView extends StatefulWidget {
  @override
  _HelloListViewState createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloListView> {
  bool _gridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ListView',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              print('Lista');
              setState(() {
                _gridView = false;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.grid_on),
            onPressed: () {
              print('Grid');
              setState(() {
                _gridView = true;
              });
            },
          ),
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    List<Dog> dogs = [
      Dog("Fox Paulistinha", "assets/images/dog1.jpg"),
      Dog("Golden Retrivier", "assets/images/dog2.jpg"),
      Dog("Rotweiller", "assets/images/dog3.jpg"),
      Dog("Border Colie", "assets/images/dog4.jpg"),
      Dog("Jack Russel", "assets/images/dog5.jpg"),
      Dog("Spitz Alemão", "assets/images/dog6.jpg"),
      Dog("Dalmata", "assets/images/dog7.jpg"),
      Dog("Husky", "assets/images/dog8.jpg"),
      Dog("Fox Paulistinha", "assets/images/dog1.jpg"),
      Dog("Golden Retrivier", "assets/images/dog2.jpg"),
      Dog("Rotweiller", "assets/images/dog3.jpg"),
      Dog("Border Colie", "assets/images/dog4.jpg"),
      Dog("Jack Russel", "assets/images/dog5.jpg"),
      Dog("Spitz Alemão", "assets/images/dog6.jpg"),
      Dog("Dalmata", "assets/images/dog7.jpg"),
      Dog("Husky", "assets/images/dog8.jpg"),
    ];

    if (_gridView) {
      return GridView.builder(
        itemCount: dogs.length,
        itemBuilder: (context, index) {
          return _itemView(dogs, index);
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
      );
    } else {
      return ListView.builder(
        itemExtent: 350,
        itemCount: dogs.length,
        itemBuilder: (context, index) {
          return _itemView(dogs, index);
        },
      );
    }
  }

  _itemView(List<Dog> dogs, int index) {
    Dog dog = dogs[index];

    return GestureDetector(
      onTap: () {
        push(context, DogPage(dog));
      },
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _img(dog.foto),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                dog.nome,
                style: TextStyle(fontSize: 26, color: Colors.orange),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }
}
