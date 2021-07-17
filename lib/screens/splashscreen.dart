import 'dart:async';
import 'package:drapp/models/global.dart';
import 'package:drapp/screens/botoomnavbar/bottomnavbar.dart';
import 'package:drapp/screens/login.dart';
import 'package:flutter/material.dart';



class SplashScreens extends StatefulWidget {

  @override
  _SplashScreensState createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {

String? userData;

@override
void initState() {
  Timer(
    Duration(seconds: 10),
    () {
      Navigator.pushReplacementNamed(context, 'login');
    }
  );
  // checkSavedData();
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4ThOvISZ_Rse2ZYWxIL_9vmyVWHJY69OxGw&usqp=CAU'),
            CircularProgressIndicator(color: Colors.black,)
          ],
        )
      ),
    );
  }
  // checkSavedData() async {
  //   String returnedData = await getDataLocaly('email');
  //   setState(() {
  //     userData = returnedData;
  //   });
  // }
}