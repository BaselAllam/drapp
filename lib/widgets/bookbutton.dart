import 'package:drapp/theme/sharedcolors.dart';
import 'package:flutter/material.dart';



class BookButton extends StatefulWidget {

  Function onTap;
  final double height;
  final double width;

  BookButton(this.onTap, this.height, this.width);

  @override
  _BookButtonState createState() => _BookButtonState();
}

class _BookButtonState extends State<BookButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
        alignment: Alignment.center,
        child: Text(
          'Book',
          style: TextStyle(color: Colors.white, fontSize: 17.0),
        ),
      ),
    );
  }
}