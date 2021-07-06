import 'package:drapp/theme/icontheme.dart';
import 'package:flutter/material.dart';
import 'package:drapp/theme/sharedcolors.dart';


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: Icon(Icons.menu),
        actions: [
          Icon(Icons.notifications),
        ],
        iconTheme: appBarIconTheme
      ),
    );
  }
}