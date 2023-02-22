import 'package:chahewoneu/Navpages/Home.dart';
import 'package:flutter/material.dart';

import 'AdminRatingReview.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Ritika'),
            accountEmail: Text('example@gmail.com'),
            currentAccountPicture:CircleAvatar(
              child:ClipOval(
                child:Image.network('https://i.pinimg.com/736x/ef/6c/2a/ef6c2a5a8ae72d6d8437fd5ee421220d.jpg',
               // decoration:BoxDecoration(
               //   image:DecorationImage(
                   fit:BoxFit.cover,
                   // image:AssetImage("Images/Goshaikunda.jpg"),
                   width:60,
                   height:60 ,
               ),
              ),
            ),
            decoration: BoxDecoration(
              color : Colors.blue,
              image: DecorationImage(
                    image: NetworkImage('https://www.peacenepaltreks.com/public/uploads/HIMALAYAN-PEAKS-OF-NEPAL.png'),
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
            onTap: () => Navigator.of(context).pushNamed("/adminPayment"),
          ) ,
          Divider(),

          ListTile(
            leading: Icon(Icons.rate_review),
            title: Text('Rate and Review'),
            onTap: () => Navigator.of(context).pushNamed("/AdminRatereview"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.hotel),
            title: Text('Hotel'),
            onTap: () => Navigator.of(context).pushNamed("/Adminhotel"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.place),
            title: Text('Place'),
            onTap: () => Navigator.of(context).pushNamed("/Adminplace"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.event),
            title: Text('Events'),
            onTap: () => Navigator.of(context).pushNamed("/Adminevents"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Exit'),
            onTap: () => Home(),
          ) ,
          Divider(),

        ],
      ),
    );
  }
}