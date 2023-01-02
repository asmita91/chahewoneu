import 'package:chahewoneu/AdminScreens/AdminDashboard.dart';
import 'package:chahewoneu/AdminScreens/adminlogin_screen.dart';
import 'package:chahewoneu/UserScreens/Transportation/ChooseAirplaneSeat.dart';
import 'package:chahewoneu/UserScreens/Transportation/ChooseBusSeat.dart';
import 'package:chahewoneu/UserScreens/UserLogin.dart';
import 'package:flutter/material.dart';

import 'UserScreens/Transportation/ChooseHiaceSeat.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/Choosebusseat",
      routes: {
        "userlogin": (context) => UserLoginPage(),
        "adminlogin": (context) => AdminLoginScreen(),
        "admindashboard": (context) => AdminDashboard(),
        "/Choosebusseat": (context) => ChooseBusSeat(),
        "/ChooseHiaceSeat": (context) => ChooseHiaceSeat(),
        "/ChooseAirplaneSeat": (context) => Airplane(),
      }));
}
