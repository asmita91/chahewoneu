import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('offlutter.com'),
            accountEmail: Text('example@gmail.com'),
            currentAccountPicture:CircleAvatar(
              child:ClipOval(
                child:Image.network('',
                  width:60,
                  height:60 ,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color : Colors.blue,
              image: DecorationImage(
                image: NetworkImage(
                  '',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.cloud_circle),
            title: Text('Weather'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Payment'),
            onTap: () => null,
          ) ,
          Divider(),

          ListTile(
            leading: Icon(Icons.rate_review),
            title: Text('Rate and Review'),
            onTap: () => null,
          ),

          Divider(),

          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Exit'),
            onTap: () => null,
          ) ,
          Divider(),

        ],
      ),
    );
  }
}