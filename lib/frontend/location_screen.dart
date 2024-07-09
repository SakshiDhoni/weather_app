import 'package:flutter/material.dart';
import 'package:weather/backend/weather.dart';
import 'city_screen.dart';
import 'constant.dart';

class LocationScreen extends StatefulWidget {

  LocationScreen({
    required this.weather_data,
});

  final weather_data;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  int temp = 0;
  int condition = 0;
  String cityName = '';
  String icon = '';
  String msg ='';

  WeatherModel weather =  WeatherModel();
  @override
  void initState() {
    super.initState();
    update(widget.weather_data);
  }

   void update(dynamic weatherData){

    setState(() {

      if(weatherData == null ){
        temp = 0;
        icon = 'error';
        msg = 'unable to connect';
        cityName ='';
        return; // stop here only and will not go for next line
      }
      double temperature = weatherData['main']['temp'];
      temp = temperature.toInt();
      print(temp);
      condition = weatherData['weather'][0]['id'];
      print(condition);
      cityName = weatherData['name'];
      print(cityName);

      icon = weather.getWeatherIcon(condition);
      msg = weather.getMessage(temp);
    });

   }
  @override

  Widget build(BuildContext context) {
    return
      Scaffold(
        body:
    Container(
      decoration: BoxDecoration(
        // image: DecorationImage(
        //   image: AssetImage('assets/image/location_background.jpg'),
        //   fit: BoxFit.cover,
        //   colorFilter: ColorFilter.mode(
        //       Colors.white.withOpacity(0.8), BlendMode.dstATop),
        // ),
      ),
      constraints: BoxConstraints.expand(),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                  onPressed: () async{
                    var weatherDataObj = await weather.getLocationWeather();
                    update(weatherDataObj);
                  },
                  child: Icon(
                    Icons.near_me,
                    size: 50.0,
                  ),
                ),
                TextButton(
                  onPressed: () async{
                   var typeName = await Navigator.push(context,
                       MaterialPageRoute(builder: (context){
                        return cityScreen();
                    },
                    ),
                   );

                   if(typeName != null){
                     print("cityName");
                     print(typeName);
                     var city_data = await weather.getCityWeather(typeName);
                     update(city_data);

                   }
                  },
                  child: Icon(
                    Icons.location_city,
                    size: 50.0,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Row(
                children: <Widget>[
                  Text(
                   '$temp°C',
                    style: kTempTextStyle,
                  ),
                  Text(
                    icon,
                    style: kConditionTextStyle,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Text(
                msg +" in "+ cityName ,
                textAlign: TextAlign.right,
                style: kMessageTextStyle,
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
