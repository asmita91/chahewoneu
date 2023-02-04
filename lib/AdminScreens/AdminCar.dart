// paste your code here
import 'package:chahewoneu/AdminScreens/app_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminCar extends StatefulWidget {
  const AdminCar({Key? key}) : super(key: key);

  @override
  State<AdminCar> createState() => _AdminCarState();
}

class _AdminCarState extends State<AdminCar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: AppIcon(
            icon: Icons.arrow_back_ios_outlined,
          ),
          title: Text("Users Who Booked Car"),
        ),
        body: ListView(children: [
          ListTile(
              leading: Container(
                width: MediaQuery.of(context).size.height / 20,
                height: MediaQuery.of(context).size.height / 20,
                child: CircleAvatar(
                  backgroundImage: AssetImage("Images/hiace.png"),
                ),
              ),
              title: Text("ASM",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              subtitle: Text("Applied for the car!",
                  style: TextStyle(color: Colors.green)))
        ]));
  }
}
