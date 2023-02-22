import 'package:chahewoneu/UserScreens/navpages/app_column.dart';
import 'package:chahewoneu/UserScreens/navpages/single_page_description.dart';
import 'package:flutter/material.dart';

class CreatePageStack extends StatelessWidget {
  final int index;
  final String placeName;
  final String placeDescription;
  final String imageLink;
  final int time;
  final int price;
  final String? placeId;
  const CreatePageStack(
      {required this.index,
      required this.placeName,
      required this.placeDescription,
      required this.imageLink,
      required this.time,
      required this.price,
      this.placeId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PlaceDescription(
                      index,
                      placeName,
                      placeDescription,
                      imageLink,
                      time,
                      price,
                      placeId: placeId,
                    )));
      },
      child: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: Stack(alignment: Alignment.topCenter, children: [
            Expanded(
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: index.isEven ? Color(0xFF69C5DF) : Color(0xFF9294CC),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(imageLink))),
              ),
            ),
            Container(
              height: 110,
              width: 200,
              margin: EdgeInsets.only(top: 135.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: AppColumn(
                  placeName: placeName,
                  time: "$time",
                  price: price,
                  rate: price),
            ),
          ]),
        ),
      ),
    );
  }
}
