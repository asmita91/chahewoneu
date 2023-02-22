

import 'package:chahewoneu/AdminScreens/AdminAirplane.dart';
import 'package:chahewoneu/AdminScreens/AdminCar.dart';
import 'package:chahewoneu/AdminScreens/AdminDashboard.dart';
import 'package:chahewoneu/AdminScreens/AdminHiace.dart';
import 'package:chahewoneu/AdminScreens/AdminTransPage.dart';
import 'package:chahewoneu/AdminScreens/adminlogin_screen.dart';
import 'package:chahewoneu/UserScreens/Transportation/ChooseAirplaneSeat.dart';
import 'package:chahewoneu/UserScreens/Transportation/ChooseBusSeat.dart';
import 'package:chahewoneu/UserScreens/Transportation/meansOfTransportation.dart';
import 'package:chahewoneu/UserScreens/UserLogin.dart';
import 'package:chahewoneu/model/bus_seat.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'UserScreens/Transportation/ChooseHiaceSeat.dart';
import 'UserScreens/Transportation/date_Picker.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/AdminHiace",
      routes: {
        AdminAirplane.route: (context) => AdminAirplane(),
        "userlogin": (context) => UserLoginPage(),
        "adminlogin": (context) => AdminLoginScreen(),
        "admindashboard": (context) => AdminDashboard(),
        "/ChooseHiaceSeat": (context) => Hiace(),
        Airplane.route: (context) => Airplane(),
        "/MeansOfTransportation": (context) => Transportation(),
        "/MeansOfTransportationAdmin": (context) => AdminTransportation(),
        "/AdminCar": (context) => AdminCar(),
        "/AdminHiace":(context)=>AdminHiace(),
        "/choosebus":(context)=>Bus(),
      }));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // primarySwatch: Colors.deepPurple,
        brightness: Brightness.dark
      ),

      home: DatePicker(),
    );
  }
}
