import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../ViewModel/PlaceViewModel.dart';
import '../../models/PlacesModel.dart';
import 'icons_text_widget.dart';

class AppColumn extends StatefulWidget {
  final String time;
  final int price;
  const AppColumn({required this.time, required this.price});

  @override
  State<AppColumn> createState() => _AppColumnState();
}

class _AppColumnState extends State<AppColumn> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  late PlaceModel _placeModel;
  late PlaceViewModel _placeViewModel;

  @override
  // for zooming of each container
  // method inside staful cls only
  void initState() {
    _placeViewModel = Provider.of<PlaceViewModel>(context, listen: false);
    _placeViewModel.getPlace();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var place = context.watch<PlaceViewModel>().place;
    return StreamBuilder(
        stream: place,
        builder: (context, AsyncSnapshot<QuerySnapshot<PlaceModel>> snapshot) {
          if (snapshot.hasError) return Text("Error");
          return ListView(children: [
            ...snapshot.data!.docs.map((document) {
              PlaceModel place = document.data();
              return Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 32),
                  child: Column(
                    children: [
                      Text("Pokhara",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          )),
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 15,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          RichText(
                            text: TextSpan(
                              style: new TextStyle(color: Colors.black),
                              children: <TextSpan>[
                                new TextSpan(text: "Distance from capital:"),
                                new TextSpan(
                                  text: place.distanceFromCap.toString(),
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Center(
                        child: Row(
                          children: [
                            Icon(
                              Icons.currency_rupee,
                              size: 15,
                              color: Colors.green,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            RichText(
                              text: TextSpan(
                                style: new TextStyle(color: Colors.black),
                                children: <TextSpan>[
                                  new TextSpan(text: "Estimated cost:"),
                                  new TextSpan(
                                    text: "Rs.${place.estimatedPrice}",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconAndTextWidget(
                          icon: Icons.star_border_sharp,
                          subText: "Rates",
                          iconColor: Colors.yellow),
                    ],
                  ),
                ),
              );
            })
          ]);
        });
  }
}
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'icons_text_widget.dart';
//
// class AppColumn extends StatelessWidget {
//   const AppColumn({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           Text("Pokhara",
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20,
//               )),
//           SizedBox(
//             height: 10,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Wrap(
//                 children: List.generate(
//                     5,
//                         (index) => Icon(Icons.star,
//                         color: Colors.lightGreenAccent, size: 15)),
//               ),
//               SizedBox(width: 10),
//               Row(children: [
//                 Icon(Icons.thumb_up, color: Colors.orange),
//                 SizedBox(width: 5),
//                 Text("top rated",
//                     style: TextStyle(fontSize: 15, color: Colors.lightGreen))
//               ])
//             ],
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               IconAndTextWidget(
//                   icon: Icons.timelapse_sharp,
//                   subText: "5days",
//                   iconColor: Colors.blue),
//               IconAndTextWidget(
//                   icon: Icons.star, subText: "Rates", iconColor: Colors.yellow),
//               Text("10k", style: TextStyle(fontSize: 20))
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
