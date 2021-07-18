import 'package:drapp/theme/icontheme.dart';
import 'package:drapp/theme/sharedcolors.dart';
import 'package:drapp/theme/texttheme.dart';
import 'package:drapp/widgets/doctorwidget.dart';
import 'package:drapp/widgets/notibutton.dart';
import 'package:flutter/material.dart';



class FavScreen extends StatefulWidget {
  const FavScreen({ Key? key }) : super(key: key);

  @override
  _FavScreenState createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          NotiButton()
        ],
        iconTheme: appBarIconTheme,
        centerTitle: true,
        title: Text(
          'Favorite Doctors',
          style: mainTextStyle,
        ),
      ),
      backgroundColor: backgroundColor,
      body: Container(
        margin: EdgeInsets.only(left: 5.0, right: 5.0),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 10,
          itemBuilder: (context, index) {
            return DoctoWidget('ahmed', '"https://firebasestorage.googleapis.com/v0/b/drappprivate.appspot.com/o/pexels-photo-5452293.jpeg?alt=media&token=006f4cca-fbb8-4520-a9a1-f676cf50ed90"');
          },
        ),
      ),
    );
  }
}