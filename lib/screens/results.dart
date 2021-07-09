import 'package:drapp/theme/icontheme.dart';
import 'package:drapp/theme/sharedcolors.dart';
import 'package:drapp/theme/texttheme.dart';
import 'package:drapp/widgets/doctorwidget.dart';
import 'package:drapp/widgets/notibutton.dart';
import 'package:flutter/material.dart';



class Results extends StatefulWidget {

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
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
          'Results',
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
            return DoctoWidget();
          },
        ),
      ),
    );
  }
}