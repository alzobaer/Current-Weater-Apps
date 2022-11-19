import 'package:flutter/material.dart';
import 'package:weatherapp_flutter/Activity/home.dart';
import 'package:weatherapp_flutter/Activity/location.dart';
import 'package:weatherapp_flutter/Activity/loading.dart';

void main(){
  runApp(MaterialApp(
    routes: {
      "/" : (context) => Loading(),
      "/home" : (context) => Home(),
    },
  ));
}
