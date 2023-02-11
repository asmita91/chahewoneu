import 'package:chahewoneu/constant/my_constraints.dart';
import 'package:chahewoneu/repositories/AirplaneRepo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
bool isSelected = false;
bool isBooked = false;
class AdminAirplane extends StatefulWidget {
  static String route = "AdminAirplane";
  AdminAirplane({Key? key}) : super(key: key);
  @override
  State<AdminAirplane> createState() => _AdminAirplaneState();
}
class _AdminAirplaneState extends State<AdminAirplane> {
  var countSeatLeft = 2 * 13;
  var countSeatRight = 2 * 13;
  Map<int, String> leftSelectedSeat = <int, String>{};
  Map<int, String> rightSelectedSeat = <int, String>{};
  Map<int, String> leftBookedSeat = <int, String>{};
  Map<int, String> rightBookedSeat = <int, String>{};
  @override
  void initState() {
    initSeatValueToMap(leftBookedSeat);
    initSeatValueToMap(rightBookedSeat);
    super.initState();
  }
  initSeatValueToMap(Map<int, String> selectedSeatMap) {
    // print("The Bye is: --> $selectedSeatMap");
    if (selectedSeatMap.isNotEmpty) {
      selectedSeatMap.forEach((int key, String value) {
        // print("The Book Seat: --> $key:$value");
        setState(() {
          if (value == null) {
            value = txtAvailableString;
          }
          selectedSeatMap[key] = value;
        });
      });
    }
  }
  void setSelectedToBooked() {
    leftBookedSeat = leftSelectedSeat;
    rightBookedSeat = rightSelectedSeat;
    Map<String, List<int>> alignmentMap = {};
    List<int> leftSelectedNumList = [];
    List<int> rightSelectedNumList = [];
    leftBookedSeat.forEach((int key, String value) {
      setState(() {
        if (value == txtSelectedString) {
          value = txtBookedString;
          leftSelectedSeat[key] = txtBookedString;
        }
        leftSelectedNumList.add(key);
        alignmentMap[txtLeft] = leftSelectedNumList;
        print("The left booked of index:$key --> $value");
      });
    });
    rightBookedSeat.forEach((int key, String value) {
      setState(() {
        if (value == txtSelectedString) {
          value = txtBookedString;
          rightSelectedSeat[key] = txtBookedString;
        }
        rightSelectedNumList.add(key);
        alignmentMap[txtRight] = rightSelectedNumList;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 80.0),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Text("Admin Airplane Seat Booking",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    height: 2.5,
                  )),
            ),
            SizedBox(height: 20.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color.fromARGB(255, 196, 44, 34),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text(
                              "Booked",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.purple,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text("Selected"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                width: 1,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text("Available"),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              // height: 100,
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 20),
                  widgetSeat1(leftSelectedSeat, txtLeft),
                  SizedBox(
                    width: 140,
                  ),
                  widgetSeat2(rightSelectedSeat, txtRight),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  var myData = await AirplaneRepo().getAllBookingData();
                  final leftData = myData["Left"] as List<int>;
                  final rightData = myData["Right"] as List<int>;
                  print("Left: $leftData and Right: $rightData}");
                  // setState(() {
                  //   leftBookedSeat = leftData;
                  //   rightBookedSeat = rightData;
                  // });
                },
                child: Text("Click Me"))
          ],
        ),
      ),
    );
  }
  Widget widgetSeat1(Map<int, String> reservedSeat, String alignment) {
    return Container(
      width: MediaQuery.of(context).size.width / 3.93,
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.7,
        ),
        itemCount: 26,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(5),
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: leftBookedSeat[index] == txtBookedString
                  ? Colors.red
                  : Colors.transparent,
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          );
        },
      ),
    );
  }
  Widget widgetSeat2(Map<int, String> reservedSeat, String alignment) {
    return Container(
      width: MediaQuery.of(context).size.width / 3.93,
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.7,
        ),
        itemCount: 26,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(5),
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: rightBookedSeat[index] == txtBookedString
                  ? Colors.red
                  : Colors.transparent,
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          );
        },
      ),
    );
  }
}