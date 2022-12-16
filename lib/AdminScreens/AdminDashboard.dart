
import 'package:flutter/material.dart';
import '../Navpages/Home.dart';
import '../Navpages/ProfilePage.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  List pages=[
    Home(),
<<<<<<< HEAD
=======
    RateandReviewPage(),
    NotificationService(),
>>>>>>> 21b388833fddb63324fd474b867fbde79846542f
    ProfilePage(),

  ];

  int currentIndex=0;
  void onTap(int index){
    setState(() {
      currentIndex=index;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,

        unselectedFontSize: 0,
        selectedFontSize: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label:"Home"),
<<<<<<< HEAD
=======
          BottomNavigationBarItem(icon: Icon(Icons.rate_review),label:"Rate and Review"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications ),label: "Notifications"),
>>>>>>> 21b388833fddb63324fd474b867fbde79846542f
          BottomNavigationBarItem(icon: Icon(Icons.person),label:"Admin Profile" ),
        ],
      ),
    );
  }
}
