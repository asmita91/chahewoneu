import 'package:chahewoneu/WeatherScreen/single_weather.dart';
import 'package:chahewoneu/WeatherScreen/slider.dart';
import 'package:chahewoneu/WeatherScreen/weather_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transformer_page_view/transformer_page_view.dart';
import 'package:weather/weather.dart';

import 'building_transform.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
    final String API_KEY = "cd638ae85731cd6ac79b3ceda5047f00";
  int _currentPage = 0;
  late String bgImg;

  String cityName = 'Kongens Lyngby';
  late WeatherFactory wf;
  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }
  Weather? currentWeather;
  List<WeatherLocation> openLocation = [];

  getWeather(String cityName) async {
    try{
      var weatherFinder = await wf.currentWeatherByCityName(cityName);
      print("WEAHER :: ");
      print(weatherFinder);
      setState(() {
        currentWeather = weatherFinder;
      });
      openLocation.add(WeatherLocation(city: currentWeather!.areaName.toString(),
          dateTime: currentWeather!.date.toString(),
          temparature: currentWeather!.temperature.toString(),
          weatherType: currentWeather!.weatherMain.toString(),
          iconUrl: currentWeather!.weatherIcon.toString(),
          wind: currentWeather!.windSpeed!.toInt(),
          rain: currentWeather!.rainLastHour != null ? currentWeather!.rainLastHour!.toInt() : 0,
          humidity: currentWeather!.humidity != null ? currentWeather!.humidity!.toInt() : 0,
          // wind: currentWeather!.windSpeed!.toInt(),
          // rain: currentWeather!.rainLastHour!.toInt(),
          // humidity: currentWeather!.humidity!.toInt()
        )
      );
    }catch(e){
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wf = new WeatherFactory("856822fd8e22db5e1ba48c0e7d69844a");
    getWeather("Kathmandu");
  }

  @override
  Widget build(BuildContext context) {

    if(locationList[_currentPage].weatherType == 'Sunny') {
      bgImg = 'assets/images/sunny.jpg';
    } else if(locationList[_currentPage].weatherType == 'Night') {
      bgImg = 'assets/images/night.jpg';
    } else if(locationList[_currentPage].weatherType == 'Rainy') {
      bgImg = 'assets/images/rainy.jpg';
    } else if(locationList[_currentPage].weatherType == 'Cloudy') {
      bgImg = 'assets/images/cloudy.jpeg';
    }

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
        actions: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: GestureDetector(
              onTap: () => print('Menu Clicked!'),
              child: SvgPicture.asset(
                'assets/images/regepage.jpg',
                height: 30,
                width: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: currentWeather == null ? CircularProgressIndicator() :  Container(
        child: Stack(
          children: [
            Image.asset(
              bgImg,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.black38),
            ),
            Container(
              margin: EdgeInsets.only(top: 140, left: 15),
              child: Row(
                children: [
                  for(int i = 0; i<locationList.length; i++)
                    if( i == _currentPage )
                      SliderDot(true)
                    else
                      SliderDot(false)
                ],
              ),
            ),
            TransformerPageView(
              scrollDirection: Axis.horizontal,
              transformer: ScaleAndFadeTransformer(),
              viewportFraction: 0.8,
              onPageChanged: _onPageChanged,
              itemCount: openLocation.length,
              itemBuilder: (ctx, i) => SingleWeather(i, openLocation),
            ),
          ],
        ),
      ),
    );
  }
}