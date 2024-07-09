import 'dart:async';
import 'location.dart';
import 'networking.dart';

const openweatherURL = "https://api.openweathermap.org/data/2.5/weather";
const apiKey = '267868326ec038fd9b7bc94b94ea8e6f';

class WeatherModel {

   double latitude =0 ;
   double longitude =0 ;

  Future<dynamic> getCityWeather(String cityName) async{
     var url = ('https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');
     netWork getforCity = netWork(url: url);
     var CityData = await getforCity.getDATA();
     return CityData;
  }

  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getcurrentLocation();
    latitude = location.Latitude;
    longitude = location.Longitude;
    netWork get = netWork(url:'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
   var ans =  await get.getDATA();
   return ans;

  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}