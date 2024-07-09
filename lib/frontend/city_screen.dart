import 'package:flutter/material.dart';

import 'constant.dart';


class cityScreen extends StatefulWidget {
  const cityScreen({super.key});

  @override
  State<cityScreen> createState() => _cityScreenState();
}

class _cityScreenState extends State<cityScreen> {
  String cityName = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('images/city_background.jpg'),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        // constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(   //to give input of text
                  onChanged: (value){
                   cityName = value;
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: kTextFieldInputDecoration,
                ),
              ),
              TextButton(
                onPressed: () {
                  // how to pass data backwords
                  Navigator.pop(context, cityName);
                  print("cityscren");
                  print(cityName);
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

