//Ghandruk.jpg//images
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_column.dart';
import 'app_icons.dart';

class PlaceDescription extends StatelessWidget {
  final String text;

  const PlaceDescription({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        image: AssetImage("Images/Pokhara.jpg"))))),
        Positioned(
            top: MediaQuery.of(context).size.width * 0.1,
            left: MediaQuery.of(context).size.width * 0.04,
            right: MediaQuery.of(context).size.width * 0.03,
            child: Row(
              children: [
                AppIcon(icon: Icons.arrow_back),
              ],
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
                        text,
                        //make changes from 3:43
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      AppColumn(),
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
                    ]))),
      ]),
    );
  }
}
