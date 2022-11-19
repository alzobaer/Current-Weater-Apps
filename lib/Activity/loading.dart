import 'package:flutter/material.dart';
import 'package:weatherapp_flutter/Worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
  late String loc;
  void startApp() async {
    worker instance  = worker(location: "rajshahi");
    await instance.getData();

    temp = instance.temp;
    hum = instance.humidity;
    air_speed = instance.air_speed;
    des = instance.description;
    main = instance.main;
    loc = instance.location;
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home',arguments: {
        "temp_value" : temp,
        "hum_value" : hum,
        "air_speed_value" : air_speed,
        "des_value" : des,
        "main_value" : main,
        "loc_value" :loc,

      } );
    });
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/logo.png",height: 230,width: 230,),

            const Text("Current Weather",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
              ),),
            const SizedBox(height: 10,),
            const Text("Made By Al Zobaer Samrat",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white
              ),),
            const SizedBox(height: 30,),
            const SpinKitThreeInOut(
              color: Colors.white,
              size: 50.0,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue[500],

    );
  }
}