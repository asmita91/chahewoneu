import 'package:chahewoneu/UserScreens/User_NavBar.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Colors.dart';
import 'place_details.dart';

class UserHomePage extends StatefulWidget {
  static String route = "UserHomePage";
  const UserHomePage({Key? key}) : super(key: key);

  @override
  State<UserHomePage> createState() => _PlacesState();
}

class _PlacesState extends State<UserHomePage> with TickerProviderStateMixin {
  // List pages = [
  //   UserProfilePage(),
  //   MainPage(),
  //
  // ];
  // int currentIndex = 0;
  // void onTap(int index) {
  //   setState(() {
  //     currentIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      //SideBar
      drawer: UserNavBar(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: AppColor.Events,
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
// 1st Children
          children: [
// discover text
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.04),
                child: Text(
                  "Discover",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),
              ),
            ),

// 3rd children
// tabbar
            SizedBox(height: 15),
            Expanded(
              child: Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    labelPadding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.04),
                    controller: _tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: CircleTabIndicator(
                        colors: AppColor.AdminDashboardPage
                        , radius: 4),
                    tabs: [
                      Tab(text: "Places"),
                      Tab(text: "Booking"),
                      Tab(text: "Emotions"),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 600,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Expanded(child: PlaceDetails()),
                  Text("hi"),
                  Text("Contents")
                ],
                // Transportation(),
              ),
            )
          ]),
//       bottomNavigationBar: BottomNavigationBar(
//           type: BottomNavigationBarType.shifting,
//           backgroundColor: Colors.white,
//           onTap: onTap,
//           currentIndex: currentIndex,
//
//           unselectedFontSize: 0,
//           selectedFontSize: 0,
//           selectedItemColor: Colors.blue,
//           unselectedItemColor: Colors.black,
//           showUnselectedLabels: false,
//           showSelectedLabels: false,
//           elevation: 0,
// // when ever there is a bar they take a list of children or item
//           items: [
//             BottomNavigationBarItem(label: "Home", icon: Icon(Icons.apps)),
//             BottomNavigationBarItem(label: "My", icon: Icon(Icons.person)),
//           ]),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color colors;
  double radius;
  CircleTabIndicator({required this.colors, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
// TODO: implement createBoxPainter
    return _CirclePainter(colors: Colors.black, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color colors;
  double radius;
  _CirclePainter({required this.colors, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = colors;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
