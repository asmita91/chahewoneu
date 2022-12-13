import 'package:chahewoneu/AdminScreens/AdminDashboard.dart';
import 'package:chahewoneu/AdminScreens/adminlogin_screen.dart';
import 'package:chahewoneu/UserScreens/UserLogin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "userlogin": (context) => UserLoginPage(),
        "adminlogin": (context) => AdminLoginScreen(),
        "admindashboard": (context) => AdminDashboard(),
      }));
}
