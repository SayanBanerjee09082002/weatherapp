import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'HomeScreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void initState(){
    super.initState();
    getLocData();
  }

  void getLocData() async{
    var weatherData =  await WeatherModel().getLocationWeather();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ProcessData(locationWeather: weatherData,)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: SpinKitThreeBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}



















