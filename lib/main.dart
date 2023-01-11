import 'package:chahewoneu/AdminScreens/Payment/receivePayment.dart';
import 'package:chahewoneu/AdminScreens/adminlogin_screen.dart';
import 'package:chahewoneu/UserScreens/ForgetPassword.dart';
import 'package:chahewoneu/UserScreens/Transportation/ChooseBusSeat.dart';
import 'package:chahewoneu/UserScreens/Transportation/meansOfTransportation.dart';
import 'package:chahewoneu/UserScreens/UserLogin.dart';
import 'package:chahewoneu/UserScreens/navpages/Homepage.dart';
import 'package:chahewoneu/UserScreens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

import 'Navpages/Home.dart';
import 'UserScreens/Payment/KhaltiTest.dart';
import 'UserScreens/Transportation/ChooseAirplaneSeat.dart';
import 'UserScreens/Transportation/ChooseHiaceSeat.dart';
import 'UserScreens/Transportation/PopUpMenu.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/splashScreen",
    routes: {
      // "/splashScreen": (context)=>SplashScreen();
      "/registration": (context) => RegisterScreen(),
      "/userLogin": (context) => UserLoginPage(),
      "/adminLogin": (context) => AdminLoginScreen(),
      "/userDashboard": (context) => HomePage(),
      "/adminDashboard": (context) => Home(),
      "/transportation_dash": (context) => Transportation(),
      "/airplane_trans": (context) => Airplane(),
      "/bus_trans": (context) => ChooseBusSeat(),
      "/hiace_trans": (context) => ChooseHiaceSeat(),
      "/car_popup": (context) => PopUp(),
      "/forgotPassword": (context) => ForgetPasswordPage(),
      "/userPayment": (context) => KhaltiPayment(),
      "/adminPayment": (context) => AdminPayment(),
    },
  ));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
        publicKey: 'test_public_key_5a22ad67e707441b8362fc7bed556a8d',
        enabledDebugging: true,
        builder: (context, navKey) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: KhaltiPayment(),
              navigatorKey: navKey,
              localizationsDelegates: const [
                KhaltiLocalizations.delegate,
              ]);
        });
  }
}
