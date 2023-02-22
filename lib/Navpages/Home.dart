import 'package:chahewoneu/AdminScreens/NavBar.dart';
import 'package:flutter/material.dart';
import '../../Colors.dart';
import '../UserScreens/navpages/place_details.dart';
import '../UserScreens/userhotel.dart';



class Home extends StatefulWidget {
  const Home ({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{
  bool isGrid=true;
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 8, vsync: this);

    return Scaffold(
      drawer: NavBar(),
        appBar:AppBar(
          elevation:0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            size: 30,
            // color: AppColor.Events,
          ),
        ),

      body:Column(children: [


        //side bar
        Container(
          padding: const EdgeInsets.only(top: 5),
          margin: const EdgeInsets.only(right: 250),
          child: Text(
            "Discover",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              color: AppColor.Events,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        //text
        SizedBox(height: 30),
        //tab bar
        Container(
          child:TabBar(
              controller: tabController,
              labelColor: Color.fromARGB(255, 93, 171, 210),
              unselectedLabelColor: Colors.black,
              isScrollable: false,
              // isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              // indicator: ,
              tabs: [
                Tab(text: "Places"),
                Tab(text: "Events"),
                Tab(text: "Booking"),
                Tab(text: "Hotel"),
                Tab(text: "Transportation")
              ]),
        ),
        Container(
          height: 300,
          width: double.maxFinite,
          child: TabBarView(controller: tabController,
              children: [
                Expanded(child: PlaceDetails()),
                Text(" "),
            Text(" "),
                Expanded(child: UserHotelScreen()),
            Text(" ")
          ]),
        )
      ]),
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