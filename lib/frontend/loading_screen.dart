import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../backend/weather.dart';
import 'location_screen.dart';



class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {




  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {

    WeatherModel data = WeatherModel();
    var weatherData = await data.getLocationWeather();
   Navigator.push(context,
        MaterialPageRoute(builder: (context){
         return LocationScreen(weather_data:weatherData ,);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
           SpinKitDoubleBounce(
            color: Colors.white,
            size: 100.0,
          ),
      ),
    );
  }
}

