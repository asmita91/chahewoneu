import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_column.dart';

class PlaceDetails extends StatefulWidget {
  const PlaceDetails({Key? key}) : super(key: key);

  @override
  State<PlaceDetails> createState() => _PlaceDetailsState();
}

class _PlaceDetailsState extends State<PlaceDetails>
    with TickerProviderStateMixin {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  double scaleFactor = 0.8; // show the 80% of original size
  @override
  // for zooming of each container
  // method inside staful cls only
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  // dispose the pagecontroller when we leave the page
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          itemBuilder: (context, position) {
            return _buildPageItem(position);
          }),
    );
  }

  Widget _buildPageItem(int index) {
    //using api of flutter
    //dart coding
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - scaleFactor);
      //1:44 bata resume
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
    } else if (index == _currentPageValue.floor() + 1) {
      var currentScale =
          scaleFactor + (_currentPageValue - index + 1) * (1 - scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(children: [
        Container(
          height: 200,
          margin: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven ? Color(0xFF69C5DF) : Color(0xFF9294CC),
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage("Images/Pokhara.jpg"))),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 110,
            margin: EdgeInsets.only(left: 50, right: 50, bottom: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Container(
              padding: EdgeInsets.only(top: 10, left: 15, right: 15),
              child: AppColumn(),
            ),
          ),
        ),
      ]),
    );
  }
}
