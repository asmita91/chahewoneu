import 'package:chahewoneu/AdminScreens/app_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminTransportation extends StatefulWidget {
  const AdminTransportation({Key? key}) : super(key: key);

  @override
  State<AdminTransportation> createState() => _AdminTransportationState();
}

class _AdminTransportationState extends State<AdminTransportation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: AppIcon(
            icon: Icons.arrow_back_ios_outlined,
          ),
          title: Text("View The Booked Transportation"),
        ),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
              color: Colors.white,
              child: Column(children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed("/AdminCar");
                          },
                          child: Container(
                            margin: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("Assets/Images/Car.png"),
                                  fit: BoxFit.cover),
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed("/AdminHiace");
                          },
                          child: Container(
                            margin: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("Assets/Images/hiace.png"),
                                  fit: BoxFit.cover),
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed("/AdminAirplane");
                          },
                          child: Container(
                            margin: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage("Assets/Images/airplane.png"),
                                  fit: BoxFit.cover),
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed("/AdminBus");
                          },
                          child: Container(
                            margin: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("Assets/Images/bus.png"),
                                  fit: BoxFit.cover),
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ])),
        ));
  }
}
