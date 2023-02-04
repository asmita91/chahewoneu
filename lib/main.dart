import 'package:chahewoneu/AdminScreens/Payment/receivePayment.dart';
import 'package:chahewoneu/AdminScreens/adminlogin_screen.dart';
import 'package:chahewoneu/UserScreens/ForgetPassword.dart';
import 'package:chahewoneu/UserScreens/Transportation/ChooseBusSeat.dart';
import 'package:chahewoneu/UserScreens/Transportation/meansOfTransportation.dart';
import 'package:chahewoneu/UserScreens/UserLogin.dart';
import 'package:chahewoneu/UserScreens/navpages/Homepage.dart';
import 'package:chahewoneu/UserScreens/navpages/Places_subpage.dart';
import 'package:chahewoneu/UserScreens/register_screen.dart';
import 'package:chahewoneu/viewmodels/payment_viewmodel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:provider/provider.dart';

import 'Navpages/Home.dart';
import 'UserScreens/Payment/KhaltiTest.dart';
import 'UserScreens/Transportation/ChooseAirplaneSeat.dart';
import 'UserScreens/Transportation/ChooseHiaceSeat.dart';
import 'UserScreens/Transportation/PopUpMenu.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(PaymentModel());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);
}

class PaymentModel extends StatelessWidget {
  const PaymentModel({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PaymentViewModel>(
            create: (_) => PaymentViewModel())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        // home: LoginScreen(),
        initialRoute: "/userPayment",
        routes: {
          // "/splashScreen": (context)=>SplashScreen();
          "/registration": (context) => RegisterScreen(),
          "/userLogin": (context) => UserLoginPage(),
          "/adminLogin": (context) => AdminLoginScreen(),
          "/userDashboard": (context) => UserHomePage(),
          "/adminDashboard": (context) => Home(),
          "/transportation_dash": (context) => Transportation(),
          "/car_popup": (context) => PopUp(),
          "/forgotPassword": (context) => ForgetPasswordPage(),
          "/userPayment": (context) => KhaltiPayment(),
          "/adminPayment": (context) => AdminPayment(),
          "/placeSubPage": (context) => PlaceDescription(text: "Context"),
          "/ChooseAirplaneSeat": (context) => Airplane(),
          "/ChooseHiaceSeat": (context) => ChooseHiaceSeat(),
          "/ChooseBusSeat": (context) => ChooseBusSeat(),
        },
      ),
    );
  }
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
