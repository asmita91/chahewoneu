import 'package:chahewoneu/UserScreens/UserLogin.dart';
import 'package:flutter/material.dart';

import 'AdminScreen/adminlogin_screen.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/userlogin": (context) => UserLoginPage(),
        "/adminlogin": (context) => AdminLoginScreen(),
      }));
}
