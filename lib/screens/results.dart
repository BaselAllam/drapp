import 'package:drapp/models/mainModel.dart';
import 'package:drapp/theme/icontheme.dart';
import 'package:drapp/theme/sharedcolors.dart';
import 'package:drapp/theme/texttheme.dart';
import 'package:drapp/widgets/doctorwidget.dart';
import 'package:drapp/widgets/notibutton.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';



class Results extends StatefulWidget {

  MainModel model;

  Results(this.model);

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {

@override
void initState() {
  widget.model.getDoctors();
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model) {
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
            itemCount: model.allDoctors.length,
            itemBuilder: (context, index) {
              if(model.isGetDoctorLoading == true) {
                return Center(child: CircularProgressIndicator());
              }else{                
              return DoctoWidget(model.allDoctors[index].doctorName, model.allDoctors[index].doctorImage);
              }
            },
          ),
        ),
      );
      } 
    );
  }
}