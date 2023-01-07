import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../models/ratingreview_model.dart';

class UserRatingReview extends StatefulWidget {
  const UserRatingReview({Key? key}) : super(key: key);

  @override
  State<UserRatingReview> createState() => _UserRatingReviewState();
}
class _UserRatingReviewState extends State<UserRatingReview> {
  TextEditingController review = new TextEditingController();
  final form = GlobalKey<FormState>();

  double newRating=0.0;
  hintStyle() {
    TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }
  formsOutline() {
    OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: Colors.white),
        borderRadius: BorderRadius.circular(30));
  }
  Future<void> submitRatingReview()async{
    FirebaseFirestore db =FirebaseFirestore.instance;
    final data = RatingReviewModel(
        rating: "$newRating",
        review: review.text,
    );

    db.collection("ratingreview").add(data.toJson()).then((value){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Rating and review submitted "))
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Rating and review'),
        ),
        body:  SingleChildScrollView(
        )
    );
  }
}

