import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Transportation extends StatefulWidget {
  const Transportation({Key? key}) : super(key: key);

  @override
  State<Transportation> createState() => _TransportationState();
}

class _TransportationState extends State<Transportation> {
  bool _isBlur = false;
  List<String> image = ["airplane.png", "Car.png", "hiace.png", "bus.png"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(20),
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0,
                    mainAxisExtent: 200),
                itemCount: 4,
                itemBuilder: (_, index) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.lightGreen,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("Images/${image[index]}"),
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
                          },
                          child: Text("More"),
                        )),
                  );
                })),
      ),
    );
  }
}
