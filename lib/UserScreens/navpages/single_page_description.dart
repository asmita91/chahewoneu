import 'package:chahewoneu/Constraints/constraint.dart';
import 'package:chahewoneu/UserScreens/Transportation/meansOfTransportation.dart';
import 'package:chahewoneu/ViewModel/PlaceViewModel.dart';
import 'package:chahewoneu/viewmodels/authenti_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../../models/Booking_Model.dart';
import 'app_column.dart';
import 'app_icon.dart';
import 'expandable_text_Widget.dart';

class PlaceDescription extends StatefulWidget {
  static String route = "PlaceDescription";
  final int? index;
  final String? placeId;
  final String? placeName;
  final String? placeDescription;
  final String? imageLink;
  final int? time;
  final int? price;

  PlaceDescription(this.index, this.placeName, this.placeDescription,
      this.imageLink, this.time, this.price,
      {this.placeId});

  @override
  State<PlaceDescription> createState() => _PlaceDescriptionState();
}

class _PlaceDescriptionState extends State<PlaceDescription> {
  late PlaceViewModel _placeViewModel;
  var _currentPageValue = 0.0;
  PageController pageController = PageController(viewportFraction: 0.85);
  int _count = 1;
  Future<void> savePeople() async {
    try {
      FirebaseFirestore db = FirebaseFirestore.instance;
      print(widget.placeId);
      final data = BookingModel(
        id: DateTime.fromMillisecondsSinceEpoch(1234567890123, isUtc: false)
            .toString(),
        date: DateTime.now().toString(),
        // userId: _auth.loggedInUser!.userId.toString(),
        userId: "XVnzERuTCnXjMKNmCdruMm1Qx2X2",
        placeId: widget.placeId!,
        people: _count,
        // rating: "$newRating",
        // review: review.text,
        // userId: auth.loggedInUser!.userId
      );
      await db.collection("bookings").add(data.toJson()).then((value) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Package created ")));

        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Transportation(data)));
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  late AuthViewModel _auth;
  @override
  void initState() {
    print(widget.placeId);
    _placeViewModel = Provider.of<PlaceViewModel>(context, listen: false);
    _auth = Provider.of<AuthViewModel>(context, listen: false);
    _placeViewModel.getPlace();
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  void _incrementCount() {
    setState(() {
      _count++;
    });
  }

  void _decrementCount() {
    if (_count < 2) {
      return;
    }
    setState(() {
      _count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    var place = context.watch<PlaceViewModel>().place;
    // var place = MyConstants.holdNavigatePlaceDetails;
    int weight = 0;
    return Scaffold(
        body: Stack(children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                  width: double.maxFinite,
                  //takes all available width
                  height: MediaQuery.of(context).size.height / 2.2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(widget.imageLink!))))),
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
                  MyConstants.holdNavigatePlaceDetails = null;
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
                    left: MediaQuery.of(context).size.height * 0.04,
                    right: MediaQuery.of(context).size.height * 0.03,
                    top: MediaQuery.of(context).size.height * 0.03,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40)),
                      color: Colors.white),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                              Des_text: widget.placeDescription!,
                            ),
                          ),
                        ),
                        Center(
                          child: AppColumn(
                              placeName: widget.placeName!,
                              time: widget.time!.toString(),
                              price: widget.price!,
                              rate: widget.price!),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ]))),
        ]),
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
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "People",
                            style: TextStyle(color: Colors.white),
                          ),
                          FloatingActionButton(
                            child: Icon(
                              Icons.add,
                              size: 15,
                            ),
                            onPressed: _incrementCount,
                            backgroundColor: Colors.transparent,
                          ),
                          Text(
                            "${_count}",
                            style: TextStyle(color: Colors.white),
                          ),
                          FloatingActionButton(
                            child: Icon(
                              Icons.remove,
                              size: 15,
                            ),
                            onPressed: _decrementCount,
                            backgroundColor: Colors.transparent,
                          )
                        ],
                      )),
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
                      ),
                      onPressed: () {
                        savePeople();
                      },
                      child: Text("Book Now",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ))),
                ])));
  }
}
