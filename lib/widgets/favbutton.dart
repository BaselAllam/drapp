import 'package:flutter/material.dart';



class FavButton extends StatefulWidget {

  @override
  _FavButtonState createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {

bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white38,
        shape: BoxShape.circle
      ),
      child: IconButton(
        icon: Icon(pressed == false ? Icons.favorite_border : Icons.favorite),
        iconSize: 20.0,
        color: Colors.red,
        onPressed: () {
          setState(() {
            pressed = !pressed;
          });
        },
      ),
    );
  }
}