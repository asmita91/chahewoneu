import 'package:chahewoneu/ViewModel/PlaceViewModel.dart';
import 'package:chahewoneu/models/place.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'app_column.dart';
import 'app_icon.dart';
import 'expandable_text_Widget.dart';

class PlaceDescription2 extends StatefulWidget {
  static String route = "PlaceDescription";
  const PlaceDescription2({Key? key}) : super(key: key);

  @override
  State<PlaceDescription2> createState() => _PlaceDescriptionState();
}

class _PlaceDescriptionState extends State<PlaceDescription2> {
  late PlaceViewModel _placeViewModel;
  var _currentPageValue = 0.0;
  PageController pageController = PageController(viewportFraction: 0.85);

  @override
  void initState() {
    _placeViewModel = Provider.of<PlaceViewModel>(context, listen: false);
    _placeViewModel.getPlace();
    print("The Final Place -->${_placeViewModel.getPlace()}");
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var place = context.watch<PlaceViewModel>().place;
    int weight = 0;
    return Scaffold(
        body: StreamBuilder(
            stream: place,
            builder:
                (context, AsyncSnapshot<QuerySnapshot<Place_Model>> snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Error");
              } else {
                return PageView.builder(
                    controller: pageController,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, position) {
                      List<Place_Model> places = [];
                      for (var querySnapshotPlace in snapshot.data!.docs) {
                        final Place_Model place = querySnapshotPlace.data();
                        places.add(place);
                      }
                      return Stack(children: [
                        Positioned(
                            left: 0,
                            right: 0,
                            child: Container(
                                width: double.maxFinite,
                                //takes all available width
                                height:
                                    MediaQuery.of(context).size.height / 2.2,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            places[0].imageUrl))))),
                        Positioned(
                            top: MediaQuery.of(context).size.width * 0.1,
                            left: MediaQuery.of(context).size.width * 0.04,
                            right: MediaQuery.of(context).size.width * 0.03,
                            child: InkWell(
                              child: Row(
                                children: [
                                  AppIcon(icon: Icons.arrow_back),
                                ],
                              ),
                              onTap: () {
                                Navigator.of(context).pop("/SubPages");
                              },
                            )),
                        Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            top: MediaQuery.of(context).size.height / 2.5,
                            child: Container(
                                padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.height * 0.04,
                                  right:
                                      MediaQuery.of(context).size.height * 0.03,
                                  top:
                                      MediaQuery.of(context).size.height * 0.03,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(40),
                                        topLeft: Radius.circular(40)),
                                    color: Colors.white),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Overview",
                                        //make changes from 3:43
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Expanded(
                                        child: SingleChildScrollView(
                                          child: ExpandableTextWidget(
                                            Des_text:
                                                places[0].placeDescription,
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: AppColumn(
                                            placeName: places[0].placeName,
                                            time: places[0]
                                                .distanceFromCap
                                                .toString(),
                                            price: places[0].estimatedPrice,
                                            rate: places[0].estimatedPrice),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                    ]))),
                      ]);
                    });
              }
            }),
        bottomNavigationBar: Container(
            height: 75,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                )),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.lightGreenAccent,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "People",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              onPressed: () {
                                weight--;
                              },
                              constraints: BoxConstraints()
                                  .tighten(height: 10.0, width: 10.0),
                              shape: CircleBorder(),
                              elevation: 7.0,
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 10.0,
                              ),
                              fillColor: Colors.white24,
                            ),
                            Text(
                              weight.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w600),
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                weight++;
                              },
                              constraints: BoxConstraints()
                                  .tighten(height: 10.0, width: 10.0),
                              shape: CircleBorder(),
                              elevation: 7.0,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 10.0,
                              ),
                              fillColor: Colors.white24,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightGreenAccent,
                          // minimumSize: Size.fromHeight(40),
                          padding: EdgeInsets.only(
                            left: 30,
                            right: 30,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          elevation: 3),
                      onPressed: () {
                        Navigator.of(context).pushNamed("/dashboard");
                      },
                      child: Text("Book Now",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ))),
                ])));
  }
}
