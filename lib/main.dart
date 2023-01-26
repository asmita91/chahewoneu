import 'package:chahewoneu/AdminScreens/AdminBookingPlace.dart';
import 'package:chahewoneu/AdminScreens/NavBar.dart';
import 'package:chahewoneu/AdminScreens/Payment/receivePayment.dart';
import 'package:chahewoneu/AdminScreens/adminlogin_screen.dart';
import 'package:chahewoneu/UserScreens/ForgetPassword.dart';
import 'package:chahewoneu/UserScreens/Transportation/ChooseBusSeat.dart';
import 'package:chahewoneu/UserScreens/Transportation/meansOfTransportation.dart';
import 'package:chahewoneu/UserScreens/UserLogin.dart';
import 'package:chahewoneu/UserScreens/User_NavBar.dart';
import 'package:chahewoneu/UserScreens/hoteldescription.dart';
import 'package:chahewoneu/UserScreens/navpages/Homepage.dart';
import 'package:chahewoneu/UserScreens/navpages/Places_subpage.dart';
import 'package:chahewoneu/UserScreens/register_screen.dart';
import 'package:chahewoneu/WeatherScreen/weather.dart';
import 'package:chahewoneu/viewmodels/People_viewmodel.dart';
import 'package:chahewoneu/viewmodels/authenti_viewmodel.dart';
import 'package:chahewoneu/viewmodels/hotel_viewmodel.dart';
import 'package:chahewoneu/viewmodels/place_viewmodel.dart';
import 'package:chahewoneu/viewmodels/ratingreview_viewmodel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AdminScreens/SplashScreen.dart';
import 'AdminScreens/hoteladd.dart';
import 'Navpages/Home.dart';
import 'Package.dart';
import 'UserScreens/Transportation/ChooseAirplaneSeat.dart';
import 'UserScreens/Transportation/ChooseHiaceSeat.dart';
import 'UserScreens/Transportation/PopUpMenu.dart';
import 'UserScreens/userhotel.dart';
import 'package:get/get.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const Chahewoneu());
}

class Chahewoneu extends StatelessWidget {
  const Chahewoneu({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthViewModel>(create: (_) => AuthViewModel()),
        ChangeNotifierProvider<RatingReviewViewModel>(
            create: (_) => RatingReviewViewModel()),
        ChangeNotifierProvider<PeopleViewModel>(
            create: (_) => PeopleViewModel()),
        ChangeNotifierProvider<HotelViewModel>(
            create: (_) => HotelViewModel()),
        ChangeNotifierProvider<PlaceView_Model>(
            create: (_) => PlaceView_Model()),
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        // theme: ThemeData(
        //   primarySwatch: Colors.red,
        // ),
        initialRoute: "/Adminhotel",
        routes: {
          "/splashScreen": (context)=>SplashScreen(),
          "/registration": (context) => RegisterScreen(),
          "/userLogin": (context) => UserLoginPage(),
          "/adminLogin": (context) => AdminLoginScreen(),
          "/userDashboard": (context) => UserHomePage(),
          "/adminDashboard": (context) => Home(),
          "/transportation_dash": (context) => Transportation(),
          "/car_popup": (context) => PopUp(),
          "/forgotPassword": (context) => ForgetPasswordPage(),
          // "/userPayment": (context) => KhaltiPayment(),
          "/adminPayment": (context) => AdminPayment(),
          // "/placeSubPage": (context) => PlaceDescription(text: "Context"),
          "/ChooseAirplaneSeat": (context) => Airplane(),
          "/ChooseHiaceSeat": (context) => ChooseHiaceSeat(),
          "/ChooseBusSeat": (context) => ChooseBusSeat(),
          "/UserNavBar": (context) => UserNavBar(),
          "/AdminNavBar": (context) => NavBar(),
          "/Adminhotel": (context) => HotelAddPlace(),
          "/hoteldescription": (context) => HotelDescription(),
          "/Userhotel": (context) => BookingPlace(),
          "/Package": (context) => Package(),
        },
      ),
    );
  }
}

// void main() {
//   runApp(MultiProvider(
//     providers: [
//       ChangeNotifierProvider(create: (_) => AuthViewModel() ),
//       ChangeNotifierProvider(create: (_) => RatingReviewViewModel() ),
//     ],
//     child: MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: "/registration",
//       routes: {
//         // "/splashScreen": (context)=>SplashScreen();
//         "/registration": (context) => RegisterScreen(),
//         "/userLogin": (context) => UserLoginPage(),
//         "/adminLogin": (context) => AdminLoginScreen(),
//         "/userDashboard": (context) => UserHomePage(),
//         "/adminDashboard": (context) => Home(),
//         "/transportation_dash": (context) => Transportation(),
//         "/car_popup": (context) => PopUp(),
//         "/forgotPassword": (context) => ForgetPasswordPage(),
//         "/userPayment": (context) => KhaltiPayment(),
//         "/adminPayment": (context) => AdminPayment(),
//         "/placeSubPage": (context) => PlaceDescription(text: "Context"),
//         "/ChooseAirplaneSeat": (context) => Airplane(),
//         "/ChooseHiaceSeat": (context) => ChooseHiaceSeat(),
//         "/ChooseBusSeat": (context) => ChooseBusSeat(),
//       },
//     ),
//   ));
//   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
//       overlays: [SystemUiOverlay.bottom]);
// }

// class Myapp extends StatelessWidget {
//   const Myapp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return KhaltiScope(
//         publicKey: 'test_public_key_5a22ad67e707441b8362fc7bed556a8d',
//         enabledDebugging: true,
//         builder: (context, navKey) {
//           return MaterialApp(
//               debugShowCheckedModeBanner: false,
//               home: KhaltiPayment(),
//               navigatorKey: navKey,
//               localizationsDelegates: const [
//                 KhaltiLocalizations.delegate,
//               ]);
//         });
//   }
// }
