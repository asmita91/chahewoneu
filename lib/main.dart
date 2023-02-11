import 'package:chahewoneu/AdminScreens/AdminDashboard.dart';
import 'package:chahewoneu/UserScreens/User_NavBar.dart';
import 'package:chahewoneu/UserScreens/navpages/Homepage.dart';
import 'package:chahewoneu/UserScreens/navpages/UserProfile.dart';
import 'package:chahewoneu/UserScreens/navpages/my_page.dart';
import 'package:chahewoneu/UserScreens/navpages/place_details.dart';
import 'package:chahewoneu/UserScreens/navpages/search_page.dart';
import 'package:chahewoneu/UserScreens/navpages/single_page_description.dart';
import 'package:chahewoneu/ViewModel/PlaceViewModel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AdminScreens/NavBar.dart';
import 'UserScreens/navpages/Main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<PlaceViewModel>(
              create: (_) => PlaceViewModel())
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

          initialRoute: "UserHomePage",
          routes: {
            UserHomePage.route: (context) => UserHomePage(),
            // UserProfilePage.route:(context)=>UserProfilePage(),
            PlaceDetails.route: (context) => PlaceDetails(),
            PlaceDescription.route: (context) =>
                PlaceDescription(null, null, null, null, null, null),
            "/Usersidebar": (context) => UserNavBar(),
            "/mypage": (context) => Mypage(),
            "/searchpage": (context) => SearchPage(),
            "/Mainpage": (context) => MainPage(),
            "/AdminDashboard": (context) => AdminDashboard(),
            "/sidebar": (context) => NavBar(),
            "/userprofilepage":(context)=>UserProfilePage(),
          },
          // MainPage(),
          // UserLoginPage()
          // HomePage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void showNotification() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showNotification, //to bring notification
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
