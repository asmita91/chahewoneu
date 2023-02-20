import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';
import 'package:intl/intl.dart';

import '../../model/bus_seat.dart';
import '../../repositories/BusRepo.dart';

class ChooseBusSeat extends StatefulWidget {
  static String route="ChooseBusSeat";
  ChooseBusSeat(selectedDate, {Key? key}) : super(key: key);

  @override
  State<ChooseBusSeat> createState() => _ChooseBusSeatState();
}

class _ChooseBusSeatState extends State<ChooseBusSeat> {
  String selectedDate="";
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

  initSeatValueToList(List data, count, side) {
    var objectData;
    //init variable to save your object data
    for (int i = 0; i < count; i++) {
      objectData = {
        "id": side + "${i + 1}",
        "isBooked": false,
        "isAvailable": true,
        "isSelected": false,
        "isVisible": true,
      };
      //this format object for every seat has
      setState(() {
        data.add(objectData);
        //add object to list
      });
    }
    print(data);
  }

  setVisiblitySeat() {
    setState(() {
      listSeatLeft[2]["isVisible"] = false; // left column index 0
      listSeatLeft[2]["isVisible"] = false; // left column index 1
      listSeatLeft[2]["isVisible"] = false; // left column index 0
      listSeatRight[2]["isVisible"] = false; // right column index 1
      listSeatRight[2]["isVisible"] = false; // right column index 2
      listSeatRight[2]["isVisible"] = false; // right column index 5
    });
    //this function to set where's the position of the seat that should be invisible
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
    if(selectedDate==""){
      showToast(context, Colors.red, "Please select date");
    }else if((listSeatLeft.isEmpty && listSeatCenter.isEmpty && listSeatRight.isEmpty)){
      showToast(context, Colors.red, "Please select seat");
    }else{
      // BusSeat(selectedDate,"17",alignmentMap);
      // BusRepo().sendBookingDetailsToFirebase(busSeat);
      showToast(context, Colors.green, "Booked Successfully");


    }


    //this function to loop every side of seat, from selected to booked, u also can this function to send to u'r serves side
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
              child: Text("Bus Seat Booking",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  height: 2.5,

                ),
              ),
            ),
            SizedBox(height: 22),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 22),
              child: Text("Arrival Date ",style:
              TextStyle(
                fontSize: 18,
                fontFamily: "Times New Roman",
                color: Colors.black,
                fontStyle: FontStyle.normal,

              ),),
            ),
            SizedBox(height: 10,),
            // Container(
            //   alignment: Alignment.topLeft,
            //   padding: EdgeInsets.only(left: 20,top: 10),
            //   child: MaterialButton(
            //     onPressed: (){}, child: const Padding(padding: EdgeInsets.only(top: 10,bottom: 10),
            //     child: Text("Choose Date",style: TextStyle(
            //       fontSize: 15,
            //       fontFamily: "Times New Roman",
            //       color: Colors.white,
            //     ),),
            //   ),
            //     color: Colors.deepPurple,
            //   ),
            // ),
            SizedBox(height: 10),
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

            // Container(
            //   alignment: Alignment.topLeft,
            //   margin: EdgeInsets.all(10.6),
            //   padding: EdgeInsets.only(left: 80),
            //   child: MaterialButton(
            //     onPressed: (){}, child: const Padding(padding: EdgeInsets.only(top: 10,bottom: 10),
            //     child: Text("Choose Date",style: TextStyle(
            //       fontSize: 15,
            //       fontFamily: "Times New Roman",
            //       color: Colors.white,
            //     ),),
            //   ),
            //     color: Colors.deepPurple,
            //   ),
            // ),
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
            SizedBox(
              height: 20,
            ),

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
                            child: Text("available"),
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
                  widgetSeat(listSeatLeft, false),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: widgetSeat(listSeatCenter, true),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  widgetSeat(listSeatRight, false),
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

  Widget widgetSeat(List dataSeat, bool isCenter) {
    return Container(
      width: MediaQuery.of(context).size.width / 3.93,
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isCenter ? 4 : 3,
          childAspectRatio: isCenter ? 1 : 1,
        ),
        itemCount: dataSeat.length,
        itemBuilder: (BuildContext context, int index) {
          return Visibility(
            visible: dataSeat[index]["isVisible"],
            child: GestureDetector(
              onTap: () {
                setState(() {
                  dataSeat[index]["isSelected"] =
                  !dataSeat[index]["isSelected"];
                });
              },
              child: Container(
                margin: EdgeInsets.all(5),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: dataSeat[index]["isBooked"]
                      ? Colors.red
                      : dataSeat[index]["isSelected"]
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




