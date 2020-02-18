import 'package:carros/pages/carro/carro.dart';
import 'package:carros/widgets/text.dart';
import 'package:flutter/material.dart';

class CarroPage extends StatelessWidget {
  Carro carro;
  CarroPage(this.carro);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(carro.nome),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.place),
            onPressed: _onClickMapa,
          ),
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: _onClickVideo,
          ),
          PopupMenuButton<String>(
            onSelected: (String value) => _onClickPopupMenu(value),
            itemBuilder: (BuildContext context){
              return [
              PopupMenuItem(value: "Editar", child: Text("Editar"),),
              PopupMenuItem(value: "Deletar", child: Text("Deletar"),),
              PopupMenuItem(value: "Share", child: Text("Editar"),)
            ];
          },)
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            Image.network(carro.urlFoto),
            _bloco1(),
            Divider(),
            _bloco2(),
          ],
        ),
    );
  }

  Row _bloco1() {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  text(carro.nome, fontSize: 20, bold: true),
                  text(carro.tipo,)
                ],
              ),
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.favorite, color: Colors.red, size: 40,),
                    onPressed: _onClickFavorito,),
                  IconButton(
                    icon: Icon(Icons.share, size: 40,),
                    onPressed: _onClickShare,
                  )
                ],
              )
            ],
          );
  }

  void _onClickMapa() {
  }

  void _onClickVideo() {
  }

  _onClickPopupMenu(String value) {
    switch(value){
      case "Editar":
        print("Editar");
        break;
      case "Deletar":
        print("Deletar");
        break;
      case "Share":
        print("Share");
        break;
    }
  }

  _bloco2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20,),
        text(carro.descricao, bold: true,),
        SizedBox(height: 20,),
        text(
            "É um fato conhecido de todos que um leitor se distrairá com o conteúdo de texto legível de uma página quando estiver "
                "examinando sua diagramação. A vantagem de usar Lorem Ipsum é que ele tem uma distribuição normal de letras, "
                "ao contrário de \"Conteúdo aqui, conteúdo aqui\", fazendo com que ele tenha uma aparência similar a de um texto "
                "legível. Muitos softwares de publicação e editores de páginas na internet agora usam Lorem Ipsum como texto-modelo "
                "padrão, e uma rápida busca por 'lorem ipsum' mostra vários websites ainda em sua fase de construção. Várias versões "
                "novas surgiram ao longo dos anos, eventualmente por acidente, e às vezes de propósito (injetando humor, e "
                "coisas do gênero)."
                "O trecho padrão original de Lorem Ipsum, usado desde o século XVI, está reproduzido abaixo para os interessados. "
                "Seções 1.10.32 e 1.10.33 de \"de Finibus Bonorum et Malorum\" de Cicero também foram reproduzidas abaixo em sua forma "
                "exata original, acompanhada das versões para o inglês da tradução feita por H. Rackham em 1914." ),
      ],
    );
  }

  void _onClickFavorito() {
  }

  void _onClickShare() {
  }

}
