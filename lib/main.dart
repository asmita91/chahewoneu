
import 'package:chahewoneu/AdminScreens/AdminDashboard.dart';
import 'package:chahewoneu/AdminScreens/adminlogin_screen.dart';
import 'package:chahewoneu/UserScreens/Transportation/ChooseAirplaneSeat.dart';
import 'package:chahewoneu/UserScreens/Transportation/ChooseBusSeat.dart';
import 'package:chahewoneu/UserScreens/Transportation/meansOfTransportation.dart';
import 'package:chahewoneu/UserScreens/UserLogin.dart';
import 'package:chahewoneu/UserScreens/navpages/Homepage.dart';
import 'package:chahewoneu/viewmodels/ratingreview_viewmodel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AdminScreens/AdminRatingReview.dart';
import 'UserScreens/Transportation/ChooseHiaceSeat.dart';
import 'UserScreens/UserRatingReview.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RatingReviewViewModel>
          (create: (_)=>RatingReviewViewModel())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        initialRoute:"/Uratingreview" ,
        routes: {
          // "userlogin": (context) => UserLoginPage(),
          // "adminlogin": (context) => AdminLoginScreen(),
          // "admindashboard": (context) => AdminDashboard(),
          // "/ChooseBusSeat": (context) => ChooseBusSeat(),
          // "/ChooseHiaceSeat": (context) => ChooseHiaceSeat(),
          // "/ChooseAirplaneSeat": (context) => Airplane(),
          // "/MeansOfTransportation": (context) => Transportation(),
          // "/Homepage":(context)=> HomePage(),
          "/Uratingreview":(context)=> UserRatingReview(),
          "/Adratingreview":(context)=> AdminRatingReview(),
        },
      ),
    );
  }
}
