import 'package:chahewoneu/AdminScreens/AdminBookingPlace.dart';
import 'package:chahewoneu/AdminScreens/AdminCar.dart';
import 'package:chahewoneu/AdminScreens/AdminHiace.dart';
import 'package:chahewoneu/AdminScreens/NavBar.dart';
import 'package:chahewoneu/AdminScreens/Payment/receivePayment.dart';
import 'package:chahewoneu/AdminScreens/adminlogin_screen.dart';
import 'package:chahewoneu/UserScreens/ForgetPassword.dart';
import 'package:chahewoneu/UserScreens/UserLogin.dart';
import 'package:chahewoneu/UserScreens/User_NavBar.dart';
import 'package:chahewoneu/UserScreens/hoteldescription.dart';
import 'package:chahewoneu/UserScreens/navpages/ChangePassword.dart';
import 'package:chahewoneu/UserScreens/navpages/Homepage.dart';
import 'package:chahewoneu/UserScreens/navpages/account_screen.dart';
import 'package:chahewoneu/UserScreens/navpages/email_change.dart';
// import 'package:chahewoneu/UserScreens/navpages/UserEditProfile.dart';
import 'package:chahewoneu/UserScreens/register_screen.dart';
import 'package:chahewoneu/ViewModel/GlobalUIViewModel.dart';
import 'package:chahewoneu/ViewModel/PlaceViewModel.dart';
import 'package:chahewoneu/viewmodels/People_viewmodel.dart';
import 'package:chahewoneu/viewmodels/authenti_viewmodel.dart';
import 'package:chahewoneu/viewmodels/event_viewmodel.dart';
import 'package:chahewoneu/viewmodels/hotel_viewmodel.dart';
import 'package:chahewoneu/viewmodels/payment_viewmodel.dart';
import 'package:chahewoneu/viewmodels/ratingreview_viewmodel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'AdminScreens/AdminAirplane.dart';
import 'AdminScreens/AdminDashboard.dart';

import 'AdminScreens/AdminRatingReview.dart';
import 'AdminScreens/AdminTransPage.dart';
import 'AdminScreens/SplashScreen.dart';
import 'AdminScreens/hoteladd.dart';
import 'Navpages/Home.dart';
import 'Navpages/ProfilePage.dart';
import 'UserScreens/Payment/KhaltiTest.dart';
import 'UserScreens/Transportation/ChooseAirplaneSeat.dart';
import 'UserScreens/Transportation/ChooseBusSeat.dart';
import 'UserScreens/Transportation/ChooseHiaceSeat.dart';
import 'UserScreens/Transportation/PopUpMenu.dart';
import 'UserScreens/UserRatingReview.dart';
import 'UserScreens/navpages/UserProfile.dart';
import 'UserScreens/usereditprofile.dart';
import 'UserScreens/userevent.dart';
import 'UserScreens/userhotel.dart';
import 'WeatherScreen/weather.dart';

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
        ChangeNotifierProvider<AuthViewModel>(
            create: (_) => AuthViewModel()),
        ChangeNotifierProvider<GlobalUIViewModel>(
            create: (_) => GlobalUIViewModel()),
        ChangeNotifierProvider<RatingReviewViewModel>(
            create: (_) => RatingReviewViewModel()),
        ChangeNotifierProvider<PeopleViewModel>(
            create: (_) => PeopleViewModel()),
        ChangeNotifierProvider<HotelViewModel>(
            create: (_) => HotelViewModel()),
        ChangeNotifierProvider<PlaceViewModel>(
            create: (_) => PlaceViewModel()),
        ChangeNotifierProvider<HotelViewModel>(
            create: (_) => HotelViewModel()),
        ChangeNotifierProvider<PlaceViewModel>(
            create: (_) => PlaceViewModel()),
        ChangeNotifierProvider<PaymentViewModel>(
            create: (_) => PaymentViewModel()),
        ChangeNotifierProvider<EventViewModel>(
            create: (_) => EventViewModel()),
      ],
      child: GetMaterialApp(
        title: 'Chahewoneu',
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(
        //   primarySwatch: Colors.red,
        // ),
        initialRoute: "/splashScreen",
        routes: {
          "/splashScreen": (context) => SplashScreen(),
          "/registration": (context) => RegisterScreen(),
          "/userLogin": (context) => UserLoginPage(),

          "/useredit": (context) => WeatherScreen(),


          "/userDashboard": (context) => UserHomePage(),

          "/adminDashboard": (context) => Home(),
          // "/adminDashboard": (context) => AdminDashboard(),
          "/car_popup": (context) => PopUp(),
          "/forgotPassword": (context) => ForgetPasswordPage(),
          "/adminPayment": (context) => AdminPayment(),
          "/ChooseAirplaneSeat": (context) => Airplane(),
          "/ChooseHiaceSeat": (context) => Hiace(),
          "/ChooseBusSeat": (context) => Bus(),

          "/UserNavBar": (context) => UserNavBar(),
          "/AdminNavBar": (context) => NavBar(),
          "/Adminhotel": (context) => HotelAddPlace(),
          "/hoteldescription": (context) => HotelDescription(),
          "/Userhotel": (context) => UserHotelScreen(),
          // "/Package": (context) => Package(),
          "/Weather": (context) => WeatherScreen(),
          "/UserRatereview": (context) => UserRatingReview(),
          "/AdminRatereview": (context) => AdminRatingReview(),
          AdminAirplane.route: (context) => AdminAirplane(),
          "userlogin": (context) => UserLoginPage(),
          "/adminlogin": (context) => AdminLoginScreen(),
          "admindashboard": (context) => AdminDashboard(),
          // "/Airplane": (context) => Airplane(),
          // "/Hiace": (context) => Hiace(),
          // "/Bus": (context) => Bus(),
          // "/profile": (context) => UserProfile(),
          // "/ChooseHiaceSeat": (context) => Hiace(),
          // "/airplane": (context) => Airplane(),
          // "/MeansOfTransportation": (context) => Transportation(),
          "/MeansOfTransportationAdmin": (context) => AdminTransportation(),
          "/AdminCar": (context) => AdminCar(),

          "/AdminHiace": (context) => AdminHiace(),
          // "/userPayment": (context) => KhaltiPayment(),
          "/adminPayment": (context) => AdminPayment(),
          // "/choosebus": (context) => Bus(),

          "/AdminHiace": (context) => AdminHiace(),
          "/choosebus": (context) => Bus(),
          "/Adminplace": (context) => BookingPlace(),
          "/UserEvent": (context) => AdminRatingReview(),
          "/AdminPlace": (context) => BookingPlace(),
          "/userPayment":(context)=> KhaltiTest(),

          //for profile
          "/email":(BuildContext context)=> ChangeEmail(),
          "/profile":(BuildContext context)=> AccountScreen(),
          "/yourprofile":(BuildContext context)=> ProfileInfo(),
          "/change_password":(BuildContext context)=> ChangePassword(),
        },
      ),
    );
  }
}