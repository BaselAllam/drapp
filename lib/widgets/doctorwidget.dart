import 'package:drapp/theme/sharedcolors.dart';
import 'package:drapp/theme/texttheme.dart';
import 'package:drapp/widgets/favbutton.dart';
import 'package:flutter/material.dart';



class DoctoWidget extends StatefulWidget {

  @override
  _DoctoWidgetState createState() => _DoctoWidgetState();
}

class _DoctoWidgetState extends State<DoctoWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
            height: 200.0,
            width: 250.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                image: NetworkImage('https://images.pexels.com/photos/5452293/pexels-photo-5452293.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                fit: BoxFit.fill
              )
            ),
            alignment: Alignment.topRight,
            child: FavButton(),
          ),
          Positioned(
            left: 30.0,
            right: 200.0,
            top: 35.0,
            bottom: 35.0,
              child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '  Doctor Name',
                      style: mainTextStyle
                    ),
                    Text(
                      '  Specilization',
                      style: subTextStyle,
                    ),
                    Text(
                      '  Rating: 5.0 *',
                      style: subTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 20.0,
                          width: 50.0,
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
                        Text(
                          ' 300\nPatient',
                          style: subTextStyle,
                        )
                      ],
                    )
                  ],
                ),
              ),
                    ),
            ),
        ],
      ),
    );
  }
}