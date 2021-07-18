import 'package:drapp/responsive/responsive.dart';
import 'package:drapp/screens/doctorprofile.dart';
import 'package:drapp/theme/texttheme.dart';
import 'package:drapp/widgets/bookbutton.dart';
import 'package:drapp/widgets/favbutton.dart';
import 'package:flutter/material.dart';



class DoctoWidget extends StatefulWidget {

  final String name;
  final String image;

  DoctoWidget(this.name, this.image);

  @override
  _DoctoWidgetState createState() => _DoctoWidgetState();
}

class _DoctoWidgetState extends State<DoctoWidget> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData data = MediaQuery.of(context);
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
                image: NetworkImage(widget.image),
                fit: BoxFit.fill
              )
            ),
            alignment: Alignment.topRight,
            child: FavButton(),
          ),
          Positioned(
            left: 15.0,
            right: responsiveDoctorWidget(data),
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
                      '  ${widget.name}',
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
                        BookButton(
                          () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) {return DoctorProfile();}));
                          },
                          20.0,
                          50.0
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