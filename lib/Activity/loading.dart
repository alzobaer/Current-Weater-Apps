import 'package:flutter/material.dart';
import 'package:weatherapp_flutter/Worker/worker.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  late String temp;
  late String hum;
  late String air_speed;
  late String des;
  late String main;
  void startApp() async
  {
    worker instance  = worker(location: "Dhar");
    await instance.getData();

    temp = instance.temp;
    hum = instance.humidity;
    air_speed = instance.air_speed;
    des = instance.description;
    main = instance.main;
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      "temp_value" : temp,
      "hum_value" : hum,
      "air_speed_value" : air_speed,
      "des_value" : des,
      "main_value" : main

    } );
  }

  @override
  void initState() {
    // TODO: implement initState

    startApp();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Text("Loading")
      ),

    );
  }
}