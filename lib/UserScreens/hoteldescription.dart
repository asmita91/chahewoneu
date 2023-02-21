import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/Hotel_Model.dart';
import '../viewmodels/hotel_viewmodel.dart';
import 'navpages/app_column.dart';
import 'navpages/app_icon.dart';
import 'navpages/expandable_text_Widget.dart';
class HotelDescription extends StatefulWidget {
  const HotelDescription({Key? key}) : super(key: key);

  @override
  State<HotelDescription> createState() => _HotelDescriptionState();
}

class _HotelDescriptionState extends State<HotelDescription> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  late HotelViewModel _hotelViewModel;
  @override
  void initState(){
    _hotelViewModel = Provider.of<HotelViewModel>(context, listen: false);
    _hotelViewModel.getHotel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var hotel =context.watch<HotelViewModel>().hotel;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            StreamBuilder(
                stream: hotel,
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<HotelModel>> snapshot) {
                  if (snapshot.hasError) return Text("Error");
                  return Container(
                    margin: EdgeInsets.only(right: 20),
                    child: SingleChildScrollView(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...snapshot.data!.docs.map((document) {
                            HotelModel hotel = document.data();

                            return Container(
                              margin: EdgeInsets.only(right: 20),
                              child: Column(
                                children: [
                                  hotel.imageUrl == null || hotel.imageUrl == ""? Image.asset("Assets/Images/Pokhara.jpg",
                                    height: 80,
                                    width: 310, fit: BoxFit.cover,) :
                                  Container(
                                    height: 80,
                                    width: 310,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(hotel.imageUrl.toString()),
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        )),
                                  ),
                                  Container(
                                    height: 80,
                                    width: 310,
                                    decoration: BoxDecoration(
                                        color: Color(0xfff1f1f1),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                        )),
                                    child: Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            hotel.hotelName.toString(),
                                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.location_on,
                                                color: Color(0xffdf842b),
                                                size: 20,
                                              ),
                                              Container(
                                                width: 260,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      hotel.location.toString(),
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w300,
                                                      ),
                                                    ),
                                                    Text(
                                                      hotel.price.toString(),
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}
