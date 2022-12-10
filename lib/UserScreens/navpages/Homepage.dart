// import 'package:dashboard/pages/navpages/Colors/AppColors.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import '../Colors.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {


  List <String> image = [
    "Pokhara.jpg",
    "Chitwan.jpg",
    "Ghandruk.jpg",
// "Ghoshaikunda.jpg",
// "Mustang.jpg",
// "Kathmandu.jpg"
  ];


  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

// 1st Children
          children: [
            Container(
              padding: const EdgeInsets.only(top: 70, left: 20),

              // Menu
              child: Row(

                // sidebar
                children: [
                  Icon(Icons.menu, size: 30, color: Colors.black54),
                  Expanded(child: Container()),


                  // menu text
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    width: 50,
                    height: 50,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.5),

                    ),

                  ),
                ],
              ),
            ),

// 2nd children
            SizedBox(height: 40,),

            // discover text
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text("Discover",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
            ),

// 3rd children
            // tabbar
            SizedBox(height: 30),
            Container(
              child: Align(
                alignment: Alignment.centerLeft,


                child: TabBar(
                  labelPadding: const EdgeInsets.only(left: 20, right: 20),
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: CircleTabIndicator(
                      colors: AppColor.HomePage, radius: 4),

                  tabs: [
                    Tab(text: "Places"),
                    Tab(text: "Booking"),
                    Tab(text: "Emotions"),

                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    height: 250,
                    width: double.maxFinite,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        ListView.builder(
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return
                              Container(
                                margin: const EdgeInsets.only(
                                    right: 15, top: 10),
                                width: 200,
                                height: 250,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                      // image: AssetImage("images/Pokhara.jpg"),
                                        image: AssetImage(
                                            "images" + image[index]),
                                        // image:AssetImage("images"+image.elementAt(index)),
                                        fit: BoxFit.cover)

                                ),
                              );
                          },
                        ),
                        Text("There"),
                        Text("Bye")
                      ],
                    ),
                  ),


                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    height: 250,
                    width: double.maxFinite,

                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        ListView.builder(
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return
                              Container(
                                margin: const EdgeInsets.only(
                                    right: 15, top: 10),
                                width: 200,
                                height: 250,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: AssetImage("images/bugati.jpg"),
                                        fit: BoxFit.cover)
                                ),
                              );
                          },),


                      ],
                    ),

                  ),
                ], //children
              ), //child
            ),
          ]
      ),
    );
  }
}


    class CircleTabIndicator extends Decoration{
  final Color  colors;
  double radius;
  CircleTabIndicator({required this.colors,required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(colors:Colors.black,radius:radius);
  }
}

class _CirclePainter extends BoxPainter{
  final Color  colors;
  double radius;
  _CirclePainter({required this.colors,required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint =Paint();
    _paint.color=colors;
    _paint.isAntiAlias=true;
    final Offset circleOffset =Offset(configuration.size!.width/2 -radius/2 , configuration.size!.height -radius);
    canvas.drawCircle(offset+circleOffset, radius, _paint);
  }

}
