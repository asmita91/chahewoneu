import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/Hotel_Model.dart';
import '../viewmodels/hotel_viewmodel.dart';

class UserEventScreen extends StatefulWidget {
  const UserEventScreen({Key? key}) : super(key: key);

  @override
  State<UserEventScreen> createState() => _UserEventScreenState();
}

class _UserEventScreenState extends State<UserEventScreen> {
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
            SizedBox(
              height: 20,
            ),
            StreamBuilder(
                stream: hotel,
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<HotelModel>> snapshot) {
                  if (snapshot.hasError) return Text("Error");
                  return Container(
                    margin: EdgeInsets.only(right: 20),
                    child: ListView(
                        children: [
                        ],

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