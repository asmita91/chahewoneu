import 'package:chahewoneu/AdminScreens/AdminAirplane.dart';
import 'package:chahewoneu/AdminScreens/AdminDashboard.dart';
import 'package:chahewoneu/AdminScreens/AdminTransPage.dart';
import 'package:chahewoneu/AdminScreens/adminlogin_screen.dart';
import 'package:chahewoneu/UserScreens/Transportation/ChooseAirplaneSeat.dart';
import 'package:chahewoneu/UserScreens/Transportation/ChooseBusSeat.dart';
import 'package:chahewoneu/UserScreens/Transportation/meansOfTransportation.dart';
import 'package:chahewoneu/UserScreens/UserLogin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'UserScreens/Transportation/ChooseHiaceSeat.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AdminAirplane.route,
      routes: {
        AdminAirplane.route: (context) => AdminAirplane(),
        "userlogin": (context) => UserLoginPage(),
        "adminlogin": (context) => AdminLoginScreen(),
        "admindashboard": (context) => AdminDashboard(),
        "/ChooseBusSeat": (context) => ChooseBusSeat(),
        "/ChooseHiaceSeat": (context) => ChooseHiaceSeat(),
        Airplane.route: (context) => Airplane(),
        "/MeansOfTransportation": (context) => Transportation(),
        "/MeansOfTransportationAdmin": (context) => AdminTransportation(),
      }));
}
