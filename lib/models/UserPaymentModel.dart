// import 'package:chahewoneu/models/ratingreview_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'dart:convert';
//
// UserPayementModel userPaymentModelFromJson(String str) => UserPayementModel.fromJson(json.decode(str));
//
// String userPaymentModelToJson(UserPaymentModel data) => json.encode(data.toJson());
//
// class UserPaymentModel {
//   UserPaymentModel({
//
//     required this.rating,
//     required this.review,
//   });
//
//   String rating;
//   String review;
//
//   factory RatingReviewModel.fromFirebaseSnapshot(
//       DocumentSnapshot<Map<String, dynamic>> json) => RatingReviewModel(
//     rating: json["Rating"],
//     review: json["Review"],
//   );
//
//   factory RatingReviewModel.fromJson(Map<String, dynamic> json) => RatingReviewModel(
//     rating: json["Rating"],
//     review: json["Review"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "Rating": rating,
//     "Review": review,
//   };
//
// }
