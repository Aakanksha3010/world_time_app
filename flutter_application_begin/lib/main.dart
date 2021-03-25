import 'package:flutter/material.dart';
import 'package:flutter_application_begin/pages/home.dart';
import 'package:flutter_application_begin/pages/choose_location.dart';
import 'package:flutter_application_begin/pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes:{
    '/':(context) => Loading(),
    '/home':(context) => Home(),
    '/location':(context) => ChooseLocation()

  }

));


