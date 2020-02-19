import 'package:carros/pages/carro/carro_page.dart';
import 'package:carros/utils/nav.dart';
import 'package:flutter/material.dart';
import 'carro.dart';

class CarrosListView extends StatelessWidget {
  List<Carro> carros;
  CarrosListView(this.carros);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: carros != null ? carros.length : 0,
          itemBuilder: (context, index) {
            Carro c = carros[index];
            return Card(
              color: Colors.grey[100],
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Image.network(
                        c.urlFoto ??
                            "https://www.google.com.br/imgres?imgurl=https%3A%2F%2Fwww.pomerode.sc.gov.br%2Fimg%2Fsecretarios%2Fimg-secretario.jpg&imgrefurl=https%3A%2F%2Fwww.pomerode.sc.gov.br%2Fimg%2Fsecretarios%2F&docid=ONb8X8LRYv5lpM&tbnid=cBOONF9pD4OvzM%3A&vet=10ahUKEwjukf6M6o_nAhVfH7kGHegIAHsQMwjWAShGMEY..i&w=210&h=300&hl=pt-BR&bih=625&biw=1366&q=IMAGEM%20N%C3%83O%20ENCONTRADA&ved=0ahUKEwjukf6M6o_nAhVfH7kGHegIAHsQMwjWAShGMEY&iact=mrc&uact=8",
                        width: 250,
                      ),
                    ),
                    Text(
                      c.nome ?? "Sem descrição",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "descrição...",
                      style: TextStyle(fontSize: 16),
                    ),
                    ButtonBarTheme(
                      data: ButtonBarTheme.of(context),
                      child: ButtonBar(
                        children: <Widget>[
                          FlatButton(
                            child: const Text('Details'),
                            onPressed: () => _onClickCarro(context, c),
                          ),
                          FlatButton(
                            child: const Text('Share'),
                            onPressed: () {/* ... */},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }

  _onClickCarro(context, Carro c) {
    push(context, CarroPage(c));
  }
}
