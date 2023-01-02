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

        ],
      ),
    );
  }
}