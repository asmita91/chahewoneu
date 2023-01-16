import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserHotelScreen extends StatelessWidget {
  Widget _searchBar() {
    return Container(
      height: 50,
      width: 350,
      child: Material(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: "Search Something",
            prefixIcon: Icon(
              Icons.search,
              size: 26,
            ),
            fillColor: Color(0xffe4e4e4),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget _hotel({
    required String image,
    required String tittle,
    required String subtittle,
    required double price,
  }) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            width: 310,
            decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(image),
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
          ),
          Container(
            height: 80,
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
                    tittle,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Color(0xffdf842b),
                        size: 20,
                      ),
                      Container(
                        width: 260,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              subtittle,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              '\$ $price',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.sort,
          size: 35,
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(9),
            child: Center(
              child: Container(
                height: 50,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/man.png'),
                    )),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 80,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello flutter baba",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "where are you now ?",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _searchBar(),
                Container(
                  height: 47,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Color(0xffdf842b),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Hotel Near You",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _hotel(
                    image: "assets/home1.png",
                    price: 200,
                    subtittle: 'kathmandu nepal',
                    tittle: "Astom Hotel room",
                  ),
                  _hotel(
                    image: "assets/home2.png",
                    price: 150,
                    subtittle: 'kathmandu nepal',
                    tittle: "Astom Hotel room",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Near by You",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _hotel(
                    image: "assets/home3.png",
                    price: 150,
                    subtittle: 'kathmandu nepal',
                    tittle: "Astom Hotel room",
                  ),
                  _hotel(
                    image: "assets/home4.png",
                    price: 150,
                    subtittle: 'kathmandu nepal',
                    tittle: "Astom Hotel room",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}