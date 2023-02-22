// import 'package:chahewoneu/constant/my_constraints.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// bool isSelected = false;
// bool isBooked = false;
//
// class Bus extends StatefulWidget {
//   Bus({Key? key}) : super(key: key);
//   @override
//   State<Bus> createState() => _BusState();
// }
//
// class _BusState extends State<Bus> {
//   // var isBooked
//   var countSeatLeft = 2 * 13;
//   var countSeatRight = 2 * 13;
//   var listSeatLeft = [];
//   var listSeatRight = [];
//   Map<int, String> leftSelectedSeat = <int, String>{};
//   Map<int, String> rightSelectedSeat = <int, String>{};
//   Map<int, String> leftBookedSeat = <int, String>{};
//   Map<int, String> rightBookedSeat = <int, String>{};
//   @override
//   void initState() {
//     // initSeatValueToMap(myMapSeatLeft, countSeatLeft, "l");
//     //l for left, c for center , r for right
//     //first param "listSeatLeft","listSeatCenter","listSeatRight" that similar like object temp that u want to save the data
//     // second param is for like how many seat on every side
//     // third param is for naming value every seat //look line 38
//     initSeatValueToList(listSeatLeft, countSeatLeft, "l");
//     initSeatValueToList(listSeatRight, countSeatRight, "r");
//     initSeatValueToMap(leftSelectedSeat, countSeatLeft, "l");
//     super.initState();
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
//     // print(data);
//   }
//
//   initSeatValueToMap(Map<int, String> selectedSeatMap, count, side) {
//     print("The reserved seat List is: --> $selectedSeatMap");
//     selectedSeatMap.forEach((int key, String value) {
//       setState(() {
//         value ??= txtAvailableString;
//         selectedSeatMap[key] = value;
//         print("The reserved seat List is: --> $selectedSeatMap");
//       });
//     });
//   }
//
//   void setSelectedToBooked() {
//     // listSeatLeft.forEach((seat) {
//     //   if (seat["isSelected"]) {
//     //     setState(() {
//     //       seat["isBooked"] = true;
//     //     });
//     //   }
//     // });
//     //
//     // listSeatRight.forEach((seat) {
//     //   if (seat["isSelected"]) {
//     //     setState(() {
//     //       seat["isBooked"] = true;
//     //     });
//     //   }
//     // });
//     //this function to loop every side of seat, from selected to booked, u also can this function to send to u'r serves side
//     leftBookedSeat = leftSelectedSeat;
//     leftBookedSeat.forEach((int key, String value) {
//       setState(() {
//         if (value == txtSelectedString) {
//           value = txtBookedString;
//           setColor(txtBookedString);
//         }
//         print("The booked of index:$key --> $value");
//       });
//     });
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
//               margin: EdgeInsets.only(top: 15),
//               child: Text("Airplane Seat Booking",
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black,
//                     height: 2.5,
//                   )),
//             ),
//             SizedBox(
//               height: 22,
//             ),
//             Container(
//               alignment: Alignment.topLeft,
//               padding: EdgeInsets.only(left: 22),
//               child: Text(
//                 "Arrival Date ",
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontFamily: "Times New Roman",
//                   color: Colors.black,
//                   fontStyle: FontStyle.normal,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               alignment: Alignment.topLeft,
//               padding: EdgeInsets.only(left: 20, top: 10),
//               child: MaterialButton(
//                 onPressed: () {},
//                 child: const Padding(
//                   padding: EdgeInsets.only(top: 10, bottom: 10),
//                   child: Text(
//                     "Choose Date",
//                     style: TextStyle(
//                       fontSize: 15,
//                       fontFamily: "Times New Roman",
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//                 color: Colors.deepPurple,
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             SizedBox(height: 20),
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
//                             child: Text("Available"),
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
//                   SizedBox(width: 20),
//                   // widgetSeat(listSeatLeft),
//                   widgetSeat1(leftSelectedSeat),
//                   SizedBox(
//                     width: 140,
//                   ),
//                   widgetSeat(listSeatRight),
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
//   Widget widgetSeat(List dataSeat) {
//     return Container(
//       width: MediaQuery.of(context).size.width / 3.93,
//       child: GridView.builder(
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           childAspectRatio: 1.7,
//         ),
//         itemCount: dataSeat.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Visibility(
//             visible: dataSeat[index]["isVisible"],
//             child: GestureDetector(
//               onTap: () {
//                 setState(() {
//                   dataSeat[index]["isSelected"] =
//                       !dataSeat[index]["isSelected"];
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
//                           ? Colors.purple
//                           : Colors.transparent,
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
//
//   Widget widgetSeat1(Map<int, String> reservedSeat) {
//     return Container(
//       width: MediaQuery.of(context).size.width / 3.93,
//       child: GridView.builder(
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           childAspectRatio: 1.7,
//         ),
//         itemCount: 26,
//         itemBuilder: (BuildContext context, int index) {
//           return Visibility(
//             visible: true,
//             child: GestureDetector(
//               onTap: () {
//                 setState(() {
//                   if (reservedSeat[index] == null) {
//                     reservedSeat[index] = txtAvailableString;
//                   }
//                   if (reservedSeat[index] == txtAvailableString) {
//                     reservedSeat[index] = txtSelectedString;
//                     print("I Clicked on: $index ==> ${reservedSeat[index]}");
//                   } else if (reservedSeat[index] == txtSelectedString) {
//                     reservedSeat[index] = txtAvailableString;
//                     print("II Clicked on: $index ==> ${reservedSeat[index]}");
//                   } else {
//                     reservedSeat[index] = txtAvailableString;
//                     print(" III Clicked on: $index ==> ${reservedSeat[index]}");
//                   }
//                 });
//               },
//               child: Text("-> ${reservedSeat[index]}"),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   Color setColor(String statusType) {
//     Color newColor = Colors.transparent;
//     if (statusType == txtBookedString) {
//       newColor = Colors.red;
//     } else if (statusType == txtSelectedString) {
//       newColor = Colors.purple;
//     } else {
//       newColor = Colors.yellow;
//     }
//     return newColor;
//   }
// }
//
// class ShowSeat extends StatelessWidget {
//   final String statusType;
//   const ShowSeat({required this.statusType});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(5),
//       width: 20,
//       height: 20,
//       decoration: BoxDecoration(
//         color: setColor(statusType),
//         border: Border.all(
//           color: Colors.grey,
//         ),
//         borderRadius: BorderRadius.circular(5),
//       ),
//     );
//   }
//
//   Color setColor(String statusType) {
//     Color newColor = Colors.transparent;
//     if (statusType == txtBookedString) {
//       newColor = Colors.red;
//     } else if (statusType == txtSelectedString) {
//       newColor = Colors.purple;
//     } else {
//       newColor = Colors.yellow;
//     }
//     return newColor;
//   }
// }
