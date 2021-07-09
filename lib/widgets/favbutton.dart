import 'package:flutter/material.dart';



class FavButton extends StatefulWidget {
  const FavButton({ Key? key }) : super(key: key);

  @override
  _FavButtonState createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white38,
        shape: BoxShape.circle
      ),
      child: IconButton(
        icon: Icon(Icons.favorite_border),
        iconSize: 20.0,
        color: Colors.red,
        onPressed: () {},
      ),
    );
  }
}