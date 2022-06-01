import 'Location.dart';
import 'InternetProcessing.dart';

const apiKey = 'e72ca729af228beabd5d20e3b7749713';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return 'https://img.icons8.com/clouds/344/clouds.png';
    } else if (condition < 400) {
      return 'https://img.icons8.com/clouds/344/rain.png';
    } else if (condition < 600) {
      return 'https://img.icons8.com/clouds/344/storm.png';
    } else if (condition < 700) {
      return 'https://img.icons8.com/clouds/344/snow.png';
    } else if (condition < 800) {
      return 'https://img.icons8.com/clouds/344/windy-weather.png';
    } else if (condition == 800) {
      return 'https://img.icons8.com/clouds/344/smiling-sun.png';
    } else if (condition <= 804) {
      return 'https://img.icons8.com/clouds/344/cloud.png';
    } else {
      return 'https://img.icons8.com/clouds/344/fahrenheit-symbol.png';
    }
  }

}