import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Matheus A de P S'),
              accountEmail: Text('matheus_adps@hotmail.com'),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfk_B0ZHfI87YwF7zIODfOX2RuObBsqRHIyyED03UWMPBYvNx2&s')),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Favoritos'),
              subtitle: Text('Mais informações...'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print('Favorite');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Ajuda'),
              subtitle: Text('Mais informações...'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print('Help');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sair'),
              subtitle: Text('Mais informações'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print('Exit');
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
