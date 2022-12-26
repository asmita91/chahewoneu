import 'package:flutter/material.dart';


class UserWeatherScreen extends StatefulWidget {
  @override
  _UserWeatherScreenState createState() => _UserWeatherScreenState();
}

class _UserWeatherScreenState extends State<UserWeatherScreen> {
  int _currentPage = 0;
  late String bgImg;

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}