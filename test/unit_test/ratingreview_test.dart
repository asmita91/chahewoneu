
import 'package:chahewoneu/Services/firebaseService.dart';
import 'package:chahewoneu/models/ratingreview_model.dart';
import 'package:chahewoneu/repositories/ratingreview_repository.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

void main()async{
  FirebaseService.db=FakeFirebaseFirestore();
  final RatingReviewRepository ratingReviewRepository =RatingReviewRepository();
  test("create a ratingreview", () async{
    var response = await ratingReviewRepository
        .addRatingReview(
        RatingReviewModel(
          rating: "test rating",
          review: "test review",
          username: "test username"
        )
    );
    expect(response, true);
  }
  );
}
