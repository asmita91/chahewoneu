import 'package:chahewoneu/UserScreens/Transportation/ChooseAirplaneSeat.dart';
import 'package:chahewoneu/UserScreens/Transportation/ChooseBusSeat.dart';
import 'package:chahewoneu/UserScreens/Transportation/ChooseHiaceSeat.dart';
import 'package:chahewoneu/models/Booking_Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'PopUpMenu.dart';

class Transportation extends StatefulWidget {
  Transportation(this.data, {Key? key}) : super(key: key);
  BookingModel? data;
  @override
  State<Transportation> createState() => _TransportationState();
}

class _TransportationState extends State<Transportation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
            children: [
              Text(widget.data!.id.toString()),
              Container(),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage("Assets/Images/Car.png"),
                      fit: BoxFit.cover,
                    )),
                child: Align(alignment: Alignment.bottomCenter, child: PopUp()),
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage("Assets/Images/Bus.png"),
                        fit: BoxFit.cover,
                      )),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightGreenAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        onPressed: () {
                          timeDilation = 0.4;
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Bus(data: widget.data)));
                        },
                        child: Text("View More"),
                      ))),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage("Assets/Images/hiace.png"),
                        fit: BoxFit.cover,
                      )),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightGreenAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        onPressed: () {
                          timeDilation = 0.4;
                          // Navigator.of(context).pushNamed("/hiace");
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Hiace(data: widget.data)));
                        },
                        child: Text("View More"),
                      ))),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage("Assets/Images/Airplane.png"),
                        fit: BoxFit.cover,
                      )),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightGreenAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        onPressed: () {
                          timeDilation = 0.4;
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  Airplane(data: widget.data)));

                          // Navigator.of(context).pushNamed("/airplane", arguments: widget.data);
                        },
                        child: Text("View More"),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
