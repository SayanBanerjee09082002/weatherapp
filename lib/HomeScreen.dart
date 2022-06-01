import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'Searching.dart';
import 'weather.dart';

class ProcessData extends StatefulWidget {
  ProcessData({this.locationWeather});

  final locationWeather;

  @override
  State<ProcessData> createState() => _ProcessDataState();
}

class _ProcessDataState extends State<ProcessData> {
  WeatherModel weather = WeatherModel();
  String cityName = 'India';
  int temperature = 0;
  int feelsLikeTemperature = 0;
  int condition = 100;
  String weatherType = 'Sunny';
  String weatherIcon = 'https://img.icons8.com/clouds/344/clouds.png';
  int humidity = 0;
  int pressure = 0;

  @override
  void initState() {
    super.initState();
    process(widget.locationWeather);
  }

  void process(dynamic weatherData) async {
    setState(() {
      if (weatherData == null) {
        weatherType = 'Error';
        return;
      }
      cityName = weatherData['name'] + weatherData['sys']['country'];
      temperature = weatherData['main']['temp'];
      feelsLikeTemperature = weatherData['main']['feels']['like'];
      weatherType = weatherData['weather'][0]['description'];
      weatherIcon = weather.getWeatherIcon(condition);
      humidity = weatherData['main']['humidity'];
      pressure = weatherData['main']['pressure'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://cdn.dribbble.com/users/3474264/screenshots/16771748/media/71c3710e4011359391975e33c170b54e.png?compress=1&resize=1000x750&vertical=top'),
            fit: BoxFit.cover,
          ),
        ),
        child: Expanded(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      weatherType,
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    // SizedBox(
                    //   width: 180.0,
                    // ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            cityName = Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Searching()),
                            ) as String;
                          },
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.center,
                  // child: Image.network(weatherIcon),
                  child: Image.network(weatherIcon),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            cityName,
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '$temperature°',
                            style: TextStyle(
                              fontSize: 75.0,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'feels like $feelsLikeTemperature°',
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                'Pressure',
                                style: TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.white,
                                ),
                              ),
                              Image.network(
                                'https://img.icons8.com/ios-filled/344/clouds.png',
                                height: 45.0,
                                alignment: Alignment.center,
                              ),
                              Text(
                                '$pressure',
                                style: TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                'Humidity',
                                style: TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.white,
                                ),
                              ),
                              Image.network(
                                'https://img.icons8.com/ios-filled/344/intense-rain.png',
                                height: 45.0,
                                alignment: Alignment.center,
                              ),
                              Text(
                                '$humidity',
                                style: TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: new DotsIndicator(
                  dotsCount: 2,
                  position: 1.0,
                  decorator: DotsDecorator(
                    activeColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
