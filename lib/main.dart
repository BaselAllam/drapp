import 'package:drapp/models/mainModel.dart';
import 'package:drapp/screens/login.dart';
import 'package:drapp/screens/signup.dart';
import 'package:drapp/screens/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget{

@override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: MainModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreens(),
        routes: {
          'login' : (context) => Login(),
          'signup' : (context) => SignUp()
        },
      ),
    );
  }
}