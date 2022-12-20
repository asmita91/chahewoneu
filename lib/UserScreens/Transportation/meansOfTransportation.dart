import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Transportation extends StatefulWidget {
  const Transportation({Key? key}) : super(key: key);

  @override
  State<Transportation> createState() => _TransportationState();
}

class _TransportationState extends State<Transportation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage("Images/Car.png"),
                    fit: BoxFit.cover,
                  )),
              child: Align(alignment: Alignment.bottomCenter, child: PopUp()),
            ),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage("Images/bus.png"),
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
                        Navigator.of(context).pushNamed("/Buspage");
                      },
                      child: Text("View More"),
                    ))),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage("Images/hiace.png"),
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
                        Navigator.of(context).pushNamed("/Hiacepage");
                      },
                      child: Text("View More"),
                    ))),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage("Images/airplane.png"),
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
                        Navigator.of(context).pushNamed("/Airplane.png");
                      },
                      child: Text("View More"),
                    )))
          ],
        ),
      ),
    );
  }
}
