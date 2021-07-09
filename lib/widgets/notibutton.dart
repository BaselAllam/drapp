import 'package:flutter/material.dart';



class NotiButton extends StatefulWidget {

  @override
  _NotiButtonState createState() => _NotiButtonState();
}

class _NotiButtonState extends State<NotiButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.notifications),
      onPressed: () {},
    );
  }
}