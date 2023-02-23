import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/event_model.dart';
import '../viewmodels/event_viewmodel.dart';

class UserEventScreen extends StatefulWidget {
  const UserEventScreen({Key? key}) : super(key: key);
  @override
  State<UserEventScreen> createState() => _UserEventScreenState();
}


class _UserEventScreenState extends State<UserEventScreen> {

  FirebaseFirestore db = FirebaseFirestore.instance;
  late EventViewModel _eventViewModel;

  @override
  void initState(){
    _eventViewModel = Provider.of<EventViewModel>(context, listen: false);
    _eventViewModel.getEvent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var event =context.watch<EventViewModel>().event;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            SizedBox(
              height: 20,
            ),

            StreamBuilder(
                stream: event,
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<EventModel>> snapshot) {

                  if (snapshot.hasError) return Text("Error");
                  return Container(
                      margin: EdgeInsets.only(right: 20),
                  child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                        children: [
                          ...snapshot.data!.docs.map((document) {
                            EventModel event = document.data();
                            return Container(
                              margin: EdgeInsets.only(right: 20),

                              child: Column(
                                children: [
                                  event.imageUrl == null
                                      ||
                                      event.imageUrl
                                          == ""?
                                  Image.asset("Assets/Images/Pokhara.jpg",
                                    height: 80,
                                    width: 310, fit: BoxFit.cover,)
                                      :
                                  Container(
                                    height: 180,
                                    width: 310,

                                    decoration: BoxDecoration(
                                        color: Colors.grey,

                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image:

                                          NetworkImage(event.imageUrl.toString(
                                          )),
                                        ),
                                        borderRadius: BorderRadius.only(

                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        )),
                                  ),
                                  Container(
                                    height: 100,
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
                                            event.eventName.toString(),
                                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Icon(

                                                Icons.location_on,
                                                color: Color(0xffd7ff5e),
                                                size: 20,

                                              ),
                                              Container(

                                                width: 260,
                                                child: Row(

                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [

                                                    Text(

                                                      event.eventLocation.toString(),
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w300,
                                                      ),
                                                    ),
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




































































































































