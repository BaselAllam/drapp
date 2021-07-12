import 'package:drapp/screens/login.dart';
import 'package:drapp/screens/signup.dart';
import 'package:drapp/screens/splashscreen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget{

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreens(),
      routes: {
        'login' : (context) => Login(),
        'signup' : (context) => SignUp()
      },
    );
  }
}