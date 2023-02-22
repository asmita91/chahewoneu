import 'package:flutter/material.dart';

import 'navpages/Homepage.dart';

class UserNavBar extends StatelessWidget {
  const UserNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('User'),
            accountEmail: Text('example@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed("/profile");
                },
                child: ClipOval(
                  child: Image.network(
                    'https://i.pinimg.com/736x/ef/6c/2a/ef6c2a5a8ae72d6d8437fd5ee421220d.jpg',
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: NetworkImage(
                    'https://www.peacenepaltreks.com/public/uploads/HIMALAYAN-PEAKS-OF-NEPAL.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.cloud_circle),
            title: Text('Weather'),
            onTap: () => Navigator.of(context).pushNamed("/Weather"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Payment'),
            onTap: () => Navigator.of(context).pushNamed("/userPayment"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.rate_review),
            title: Text('Rate and Review'),
            onTap: () => Navigator.of(context).pushNamed("/UserRatereview"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Exit'),
            onTap: () => UserHomePage(),
          ),
          Divider(),
        ],
      ),
    );
  }
}
