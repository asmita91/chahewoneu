import 'package:chahewoneu/constant/my_constraints.dart';
import 'package:chahewoneu/repositories/HiaceRepo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';
import 'package:intl/intl.dart';

import '../../model/hiace_seat.dart';
import '../../models/Booking_Model.dart';

bool isSelected = false;
bool isBooked = false;

class Hiace extends StatefulWidget {
  static String route = "Hiace";
  Hiace({Key? key, this.data}) : super(key: key);
  BookingModel? data;

  @override
  State<Hiace> createState() => _HiaceState();
}

class _HiaceState extends State<Hiace> {
  String selectedDate = "";
  // var isBooked
  var countSeatLeft = 2 * 13;
  var countSeatRight = 2 * 13;

  Map<int, String> leftSelectedSeat = <int, String>{};
  Map<int, String> rightSelectedSeat = <int, String>{};

  Map<int, String> leftBookedSeat = <int, String>{};
  Map<int, String> rightBookedSeat = <int, String>{};

  @override
  void initState() {
    initSeatValueToMap(leftSelectedSeat);
    initSeatValueToMap(rightSelectedSeat);

    super.initState();
  }

  void showToast(BuildContext context, Color color, String message) {
    Flushbar(
      duration: Duration(seconds: 3),
      backgroundColor: color,
      messageText: Text(
        message,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
    ).show(context);
  }

  initSeatValueToMap(Map<int, String> selectedSeatMap) {
    print("The reserved seat List is: --> $selectedSeatMap");
    if (selectedSeatMap.isEmpty) {
      selectedSeatMap.forEach((int key, String value) {
        setState(() {
          if (value == null) {
            value = txtAvailableString;
          }
          selectedSeatMap[key] = value;
          print("The reserved seat List is: --> $selectedSeatMap");
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
        print("The right booked of index:$key --> $value");
      });
    });

    if (selectedDate == "") {
      showToast(context, Colors.red, "Please select date");
    } else if ((leftSelectedNumList.isEmpty && rightSelectedNumList.isEmpty)) {
      showToast(context, Colors.red, "Please select seat");
    } else {
      print("Asmita data ==>${widget.data!}");
      HiaceSeat hiaceSeat = HiaceSeat(selectedDate, "7", alignmentMap, "1");
      HiaceRepo().sendBookingDetailsToFirebase(hiaceSeat);
      showToast(context, Colors.green, "Booked Successfully");
    }
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
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Text("Hiace Seat Booking",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    height: 2.5,
                  )),
            ),
            SizedBox(
              height: 22,
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 22),
              child: Text(
                "Arrival Date ",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Times New Roman",
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: MaterialButton(
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2100));
                      if (pickedDate != null) {
                        print(
                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        setState(() {
                          //set output date to TextField value.
                          selectedDate = formattedDate;
                        });
                      } else {}
                    },
                    child: Text(
                      "Choose Date",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Times New Roman",
                        color: Colors.white,
                      ),
                    ),
                    color: Colors.deepPurple,
                  ),
                ),
                SizedBox(width: 20.0),
                Text(selectedDate,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 2)),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(height: 20),
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
                    width: 220,
                  ),
                  widgetSeat1(rightSelectedSeat, txtRight),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setSelectedToBooked();
              },
              child: Text("Book"),
            ),
          ],
        ),
      ),
    );
  }

  Widget widgetSeat1(Map<int, String> reservedSeat, String alignment) {
    return Container(
      width: MediaQuery.of(context).size.width / 6.50,
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
        ),
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return Visibility(
            visible: true,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  if (reservedSeat[index] == null) {
                    reservedSeat[index] = txtAvailableString;
                  }
                  if (reservedSeat[index] == txtAvailableString) {
                    reservedSeat[index] = txtSelectedString;
                    print("I Clicked on: $index ==> ${reservedSeat[index]}");
                  } else if (reservedSeat[index] == txtSelectedString) {
                    reservedSeat[index] = txtAvailableString;
                    print("II Clicked on: $index ==> ${reservedSeat[index]}");
                  } else {
                    reservedSeat[index] = txtBookedString;
                    print(" III Clicked on: $index ==> ${reservedSeat[index]}");
                  }
                });
              },
              child: Container(
                margin: EdgeInsets.all(5),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: reservedSeat[index] == txtBookedString
                      ? Colors.red
                      : reservedSeat[index] == txtSelectedString
                          ? Colors.purple
                          : Colors.transparent,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
