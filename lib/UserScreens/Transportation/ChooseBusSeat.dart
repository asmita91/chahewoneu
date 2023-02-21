// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_flushbar/flutter_flushbar.dart';
// import 'package:intl/intl.dart';
//
//
// bool isSelected = false;
// bool isBooked = false;
//
// class Bus extends StatefulWidget {
//   static String route="ChooseBusSeat";
//   Bus(selectedDate, {Key? key}) : super(key: key);
//
//   @override
//   State<Bus> createState() => _BusState();
// }
//
// class _BusState extends State<Bus> {
//   String selectedDate="";
//   var countSeatLeft = 2 * 10;
//   var countSeatCenter = 2 * 2;
//   var countSeatRight = 2 * 10;
//   var listSeatLeft = [];
//   var listSeatCenter = [];
//   var listSeatRight = [];
//
//   @override
//   void initState() {
//     initSeatValueToList(listSeatLeft, countSeatLeft, "l");
//     initSeatValueToList(listSeatCenter, countSeatCenter, "c");
//     initSeatValueToList(listSeatRight, countSeatRight, "r");
//     setVisiblitySeat();
//     super.initState();
//   }
//   void showToast(BuildContext context, Color color, String message) {
//     Flushbar(
//       duration: Duration(seconds: 3),
//       backgroundColor: color,
//       messageText: Text(
//         message,
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 16.0,
//         ),
//       ),
//     ).show(context);
//   }
//
//   initSeatValueToList(List data, count, side) {
//     var objectData;
//     //init variable to save your object data
//     for (int i = 0; i < count; i++) {
//       objectData = {
//         "id": side + "${i + 1}",
//         "isBooked": false,
//         "isAvailable": true,
//         "isSelected": false,
//         "isVisible": true,
//       };
//       //this format object for every seat has
//       setState(() {
//         data.add(objectData);
//         //add object to list
//       });
//     }
//     print(data);
//   }
//
//   setVisiblitySeat() {
//     setState(() {
//       listSeatLeft[2]["isVisible"] = false; // left column index 0
//       listSeatLeft[2]["isVisible"] = false; // left column index 1
//       listSeatLeft[2]["isVisible"] = false; // left column index 0
//       listSeatRight[2]["isVisible"] = false; // right column index 1
//       listSeatRight[2]["isVisible"] = false; // right column index 2
//       listSeatRight[2]["isVisible"] = false; // right column index 5
//       listSeatCenter[2]["visible"]=false;
//
//     });
//     //this function to set where's the position of the seat that should be invisible
//   }
//
//   setSelectedToBooked() {
//     listSeatLeft.forEach((seat) {
//       if (seat["isSelected"]) {
//         setState(() {
//           seat["isBooked"] = true;
//         });
//       }
//     });
//     listSeatCenter.forEach((seat) {
//       if (seat["isSelected"]) {
//         setState(() {
//           seat["isBooked"] = true;
//         });
//       }
//     });
//     listSeatRight.forEach((seat) {
//       if (seat["isSelected"]) {
//         setState(() {
//           seat["isBooked"] = true;
//         });
//       }
//     });
//     if(selectedDate==""){
//       showToast(context, Colors.red, "Please select date");
//     }else if((listSeatLeft.isEmpty && listSeatCenter.isEmpty && listSeatRight.isEmpty)){
//       showToast(context, Colors.red, "Please select seat");
//     }else{
//       // BusSeat(selectedDate,"17",alignmentMap);
//       // BusRepo().sendBookingDetailsToFirebase(busSeat);
//       showToast(context, Colors.green, "Booked Successfully");
//
//
//     }
//
//
//     //this function to loop every side of seat, from selected to booked, u also can this function to send to u'r serves side
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               child: Text("Bus Seat Booking",
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.w500,
//                   height: 2.5,
//
//                 ),
//               ),
//             ),
//             SizedBox(height: 22),
//             Container(
//               alignment: Alignment.topLeft,
//               padding: EdgeInsets.only(left: 22),
//               child: Text("Arrival Date ",style:
//               TextStyle(
//                 fontSize: 18,
//                 fontFamily: "Times New Roman",
//                 color: Colors.black,
//                 fontStyle: FontStyle.normal,
//
//               ),),
//             ),
//             SizedBox(height: 10,),
//             // Container(
//             //   alignment: Alignment.topLeft,
//             //   padding: EdgeInsets.only(left: 20,top: 10),
//             //   child: MaterialButton(
//             //     onPressed: (){}, child: const Padding(padding: EdgeInsets.only(top: 10,bottom: 10),
//             //     child: Text("Choose Date",style: TextStyle(
//             //       fontSize: 15,
//             //       fontFamily: "Times New Roman",
//             //       color: Colors.white,
//             //     ),),
//             //   ),
//             //     color: Colors.deepPurple,
//             //   ),
//             // ),
//             SizedBox(height: 10),
//       Row(
//         children: [
//           Container(
//             alignment: Alignment.topLeft,
//             padding: EdgeInsets.only(left: 20, top: 10),
//             child: MaterialButton(
//               onPressed: () async {
//                 DateTime? pickedDate = await showDatePicker(
//                     context: context,
//                     initialDate: DateTime.now(),
//                     firstDate: DateTime(1950),
//                     //DateTime.now() - not to allow to choose before today.
//                     lastDate: DateTime(2100));
//                 if (pickedDate != null) {
//                   print(
//                       pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
//                   String formattedDate =
//                   DateFormat('yyyy-MM-dd').format(pickedDate);
//                   setState(() {
//                     //set output date to TextField value.
//                     selectedDate = formattedDate;
//                   });
//                 } else {}
//               },
//               child: Text(
//                 "Choose Date",
//                 style: TextStyle(
//                   fontSize: 15,
//                   fontFamily: "Times New Roman",
//                   color: Colors.white,
//                 ),
//               ),
//               color: Colors.deepPurple,
//             ),
//           ),
//
//             // Container(
//             //   alignment: Alignment.topLeft,
//             //   margin: EdgeInsets.all(10.6),
//             //   padding: EdgeInsets.only(left: 80),
//             //   child: MaterialButton(
//             //     onPressed: (){}, child: const Padding(padding: EdgeInsets.only(top: 10,bottom: 10),
//             //     child: Text("Choose Date",style: TextStyle(
//             //       fontSize: 15,
//             //       fontFamily: "Times New Roman",
//             //       color: Colors.white,
//             //     ),),
//             //   ),
//             //     color: Colors.deepPurple,
//             //   ),
//             // ),
//           SizedBox(width: 20.0),
//           Text(selectedDate,
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 13,
//                   fontStyle: FontStyle.italic,
//                   letterSpacing: 2)),
//         ],
//       ),
//
//             SizedBox(
//               height: 20,
//             ),
//             SizedBox(
//               height: 20,
//             ),
//
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: 20),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       child: Row(
//                         children: [
//                           Container(
//                             width: 20,
//                             height: 20,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(5),
//                               color: Color.fromARGB(255, 196, 44, 34),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(left: 10),
//                             child: Text(
//                               "Booked",
//
//
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Container(
//                       child: Row(
//                         children: [
//                           Container(
//                             width: 20,
//                             height: 20,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(5),
//                               color: Colors.purple,
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(left: 10),
//                             child: Text("Selected"),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Container(
//                       child: Row(
//                         children: [
//                           Container(
//                             width: 20,
//                             height: 20,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(5),
//                               border: Border.all(
//                                 width: 1,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(left: 10),
//                             child: Text("available"),
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: 10),
//               // height: 100,
//               width: MediaQuery.of(context).size.width,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   widgetSeat(listSeatLeft, false),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   Expanded(
//                     child: widgetSeat(listSeatCenter, true),
//                   ),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   widgetSeat(listSeatRight, false),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 setSelectedToBooked();
//               },
//               child: Text("Book"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget widgetSeat(List dataSeat, bool isCenter) {
//     return Container(
//       width: MediaQuery.of(context).size.width / 3.93,
//       child: GridView.builder(
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: isCenter ? 4 : 3,
//           childAspectRatio: isCenter ? 1 : 1,
//         ),
//         itemCount: dataSeat.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Visibility(
//             visible: dataSeat[index]["isVisible"],
//             child: GestureDetector(
//               onTap: () {
//                 setState(() {
//                   dataSeat[index]["isSelected"] =
//                   !dataSeat[index]["isSelected"];
//                 });
//               },
//               child: Container(
//                 margin: EdgeInsets.all(5),
//                 width: 20,
//                 height: 20,
//                 decoration: BoxDecoration(
//                   color: dataSeat[index]["isBooked"]
//                       ? Colors.red
//                       : dataSeat[index]["isSelected"]
//                       ? Colors.purple
//                       : Colors.transparent,
//                   border: Border.all(
//                     color: Colors.grey,
//                   ),
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
//
//
//


//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
import 'package:chahewoneu/constant/my_constraints.dart';
import 'package:chahewoneu/model/aeroplane_seat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';
import 'package:intl/intl.dart';

import '../../model/bus_seat.dart';
import '../../repositories/BusRepo.dart';

bool isSelected = false;
bool isBooked = false;

class Bus extends StatefulWidget {
  static String route = "Airplane";
  Bus({Key? key}) : super(key: key);

  @override
  State<Bus> createState() => _BusState();
}

class _BusState extends State<Bus> {
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
      BusSeat busSeat =
      BusSeat(selectedDate, "16", alignmentMap);
      BusRepo().sendBookingDetailsToFirebase(busSeat);
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
              child: Text("Bus Seat Booking",
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
                    width: 130,
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
      width: MediaQuery.of(context).size.width / 3.93,
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,

          // childAspectRatio: 1.7,
        ),
        itemCount: 26,
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
