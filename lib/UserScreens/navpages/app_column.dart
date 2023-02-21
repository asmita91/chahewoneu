import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'icons_text_widget.dart';

class AppColumn extends StatefulWidget {
  final String placeName;
  final String time;
  final int price;
  final int rate;
  const AppColumn(
      {super.key,
      required this.placeName,
      required this.time,
      required this.price,
      required this.rate});

  @override
  State<AppColumn> createState() => _AppColumnState();
}

class _AppColumnState extends State<AppColumn> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 128),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(widget.placeName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
            const SizedBox(
              height: 7,
            ),
            Row(
              children: [
                const Icon(
                  Icons.access_time,
                  size: 15,
                  color: Colors.blue,
                ),
                const SizedBox(
                  width: 5,
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(text: "Capital's Distance:"),
                      TextSpan(
                        // text: place.distanceFromCap.toString(),
                        text: widget.time,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: "km"),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                const Icon(
                  Icons.currency_rupee,
                  size: 15,
                  color: Colors.green,
                ),
                const SizedBox(
                  width: 5,
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(text: "Estimated cost:"),
                      TextSpan(
                        // text: "Rs.${place.estimatedPrice}",
                        text: widget.rate.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            IconAndTextWidget(
                icon: Icons.star_border_sharp,
                subText: "Rates --> ${widget.price}",
                iconColor: Colors.yellow),
          ],
        ),
      ),
    );
    //     })
    //   ]);
    // });
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
