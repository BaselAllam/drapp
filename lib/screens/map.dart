import 'package:drapp/models/googlemap.dart';
import 'package:drapp/theme/texttheme.dart';
import 'package:flutter/material.dart';


class Map extends StatefulWidget {

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {

Widget? body;

@override
void initState() {
  checkMap();
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
    );
  }
  checkMap() async {
    var map = callMap();
    
  }
  alertDialog(String contetnt) {
    return AlertDialog(
      title: Text(
        'Attention',
        style: mainTextStyle,
      ),
      content: Text(
        '$contetnt',
        style: subTextStyle,
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.close),
          color: Colors.red,
          iconSize: 25.0,
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.done),
          color: Colors.green,
          iconSize: 25.0,
          onPressed: () {},
        ),
      ],
    );
  }
}