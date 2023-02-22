import 'package:chahewoneu/ViewModel/PlaceViewModel.dart';
import 'package:chahewoneu/models/place.dart';
import 'package:chahewoneu/widget/page_stack.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlaceDetails extends StatefulWidget {
  static String route = "PlaceDetails";
  const PlaceDetails({Key? key}) : super(key: key);

  @override
  State<PlaceDetails> createState() => _PlaceDetailsState();
}

class _PlaceDetailsState extends State<PlaceDetails> {
  late PlaceViewModel _placeViewModel;
  PageController pageController = PageController(viewportFraction: 0.85);

  @override
  void initState() {
    _placeViewModel = Provider.of<PlaceViewModel>(context, listen: false);
    _placeViewModel.getPlace();
    super.initState();
  }

  @override
  // dispose the pagecontroller when we leave the page
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var place = context.watch<PlaceViewModel>().place;
    List<Place_Model> places = [];
    return Column(
      children: [
        Expanded(
          child: Container(
            child: StreamBuilder(
                stream: place,
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Place_Model>> snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text("Error");
                  } else {
                    for (var querySnapshotPlace in snapshot.data!.docs) {
                      final Place_Model place = querySnapshotPlace.data();
                      places.add(place);
                    }
                    return MyPageViewController(pageController, places);
                  }
                }),
          ),
        ),
      ],
    );
  }
}

class MyPageViewController extends StatelessWidget {
  final PageController controller;
  final List<Place_Model> places;

  MyPageViewController(this.controller, this.places);

  @override
  Widget build(BuildContext context) {
    List<Place_Model> lessThan5 = [];
    List<Place_Model> greaterThan5 = [];

    for (int i = 0; i <= places.length - 1; i++) {
      print("The total i is: -->$i");
      if (i <= 2) {
        print("The IF value of  i is: $i");
        lessThan5.add(places[i]);
      } else {
        print("The Else value of  i is:$i");
        greaterThan5.add(places[i]);
      }
    }
    return Column(
      children: [
        Expanded(child: firstPageViewController(controller, lessThan5)),
        Expanded(
          child: secondPageViewController(controller, greaterThan5),
        )
      ],
    );
  }

  Widget firstPageViewController(
      PageController pageController, List<Place_Model> places) {
    return PageView.builder(
        controller: pageController,
        itemCount: places.length,
        itemBuilder: (context, position) {
          return _createPageSlider(places[position], position);
        });
  }

  Widget secondPageViewController(
      PageController pageController, List<Place_Model> places) {
    return PageView.builder(
        controller: pageController,
        itemCount: places.length,
        itemBuilder: (context, position) {
          return _createPageSlider(places[position], position);
        });
  }

  Widget _createPageSlider(Place_Model place, int index) {
    return Column(
      children: [
        Flexible(
          child: CreatePageStack(
            index: index,
            placeName: place.placeName,
            placeDescription: place.placeDescription,
            imageLink: place.imageUrl,
            time: place.distanceFromCap,
            price: place.estimatedPrice,
            placeId: place.placeId,
          ),
        ),
      ],
    );
  }
}
