// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:provider/provider.dart';
// import '../models/ratingreview_model.dart';
// import '../viewmodels/ratingreview_viewmodel.dart';
//
//
// class AdminRatingReview extends StatefulWidget {
//   const AdminRatingReview({Key? key}) : super(key: key);
//
//   @override
//   State<AdminRatingReview> createState() => _AdminRatingReviewState();
// }
//
// class _AdminRatingReviewState extends State<AdminRatingReview> {
//   FirebaseFirestore db = FirebaseFirestore.instance;
//   late RatingReviewViewModel _ratingReviewViewModel;
//   @override
//   void initState(){
//     _ratingReviewViewModel = Provider.of<RatingReviewViewModel>(context, listen: false);
//     _ratingReviewViewModel.getRatingReview();
//
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     var ratingreview =context.watch<RatingReviewViewModel>().ratingreview;
//     return Scaffold(
//       body: StreamBuilder(
//           stream: ratingreview,
//           builder: (context,
//               AsyncSnapshot<QuerySnapshot<RatingReviewModel>> snapshot) {
//             if (snapshot.hasError) return Text("Error");
//             return ListView(
//               children: [
//                 ...snapshot.data!.docs.map((document) {
//                   RatingReviewModel ratingreview = document.data();
//
//                   return ListTile(
//                     leading: Text(ratingreview.username),
//                     title: Text(
//                       ratingreview.rating ,
//                       style: TextStyle(fontSize: 40),
//                     ),
//                     subtitle: Text(ratingreview.review),
//                   );
//                 }),
//               ],
//             );
//           }),
//     );
//   }
// }
//


import 'package:flutter/material.dart';

class ReviewItem {
  final String username;
  final String review;
  final int rating;

  ReviewItem({
    required this.username,
    required this.review,
    required this.rating,
  });
}

class AdminRatingReview extends StatelessWidget {
  final List<ReviewItem> reviews = [
    ReviewItem(
      username: 'John Doe',
      review: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      rating: 5,
    ),
    ReviewItem(
      username: 'Jane abhra',
      review: 'Vestibulum commodo velit vel nulla sodales, a rhoncus justo commodo.',
      rating: 4,
    ),
    ReviewItem(
      username: 'Jim Smith',
      review: 'Sed vitae dolor vel mi dapibus hendrerit.',
      rating: 3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Reviews'),
      ),
      body: ListView.builder(
        itemCount: reviews.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      reviews[index].username,
                      style: TextStyle(fontSize: 18),
                    ),
                    Row(
                      children: List.generate(
                        reviews[index].rating,
                            (index) => Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  reviews[index].review,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
