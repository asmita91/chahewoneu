import 'package:flutter/material.dart';

class ChooseHiaceSeat extends StatefulWidget {
  const ChooseHiaceSeat({Key? key}) : super(key: key);

  @override
  State<ChooseHiaceSeat> createState() => _ChooseHiaceSeatState();
}

class _ChooseHiaceSeatState extends State<ChooseHiaceSeat> {
  var countSeatLeft = 2 * 10;
  var countSeatCenter = 2 * 2;
  var countSeatRight = 2 * 10;
  var listSeatLeft = [];
  var listSeatCenter = [];
  var listSeatRight = [];

  @override
  void initState() {

    initSeatValueToList(listSeatLeft, countSeatLeft, "l");
    initSeatValueToList(listSeatCenter, countSeatCenter, "c");
    initSeatValueToList(listSeatRight, countSeatRight, "r");
    setVisiblitySeat();
    super.initState();
  }

  initSeatValueToList(List data, count, side) {
    var objectData;
    for (int i = 0; i < count; i++) {
      objectData = {
        "id": side + "${i + 1}",
        "isBooked": false,
        "isAvailable": true,
        "isSelected": false,
        "isVisible": true,
      };
      setState(() {
        data.add(objectData);
      });
    }
    print(data);
  }

  setVisiblitySeat() {
    setState(() {
      listSeatLeft[2]["isVisible"] = false;
      listSeatLeft[2]["isVisible"] = false;
      listSeatLeft[2]["isVisible"] = false;
      listSeatRight[2]["isVisible"] = false;
      listSeatRight[2]["isVisible"] = false;
      listSeatRight[2]["isVisible"] = false;
    });
  }

  setSelectedToBooked() {
    listSeatLeft.forEach((seat) {
      if (seat["isSelected"]) {
        setState(() {
          seat["isBooked"] = true;
        });
      }
    });
    listSeatCenter.forEach((seat) {
      if (seat["isSelected"]) {
        setState(() {
          seat["isBooked"] = true;
        });
      }
    });
    listSeatRight.forEach((seat) {
      if (seat["isSelected"]) {
        setState(() {
          seat["isBooked"] = true;
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
