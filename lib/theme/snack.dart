import 'package:flutter/material.dart';



SnackBar snack(Color color, String content) {
  return SnackBar(
    backgroundColor: color,
    content: Text(
      '$content',
      style: TextStyle(color: Colors.white),
    ),
    duration: Duration(seconds: 3)
  );
}