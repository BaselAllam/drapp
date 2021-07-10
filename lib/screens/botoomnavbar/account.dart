import 'package:drapp/theme/icontheme.dart';
import 'package:drapp/theme/sharedcolors.dart';
import 'package:drapp/theme/texttheme.dart';
import 'package:drapp/widgets/notibutton.dart';
import 'package:flutter/material.dart';



class Account extends StatefulWidget {

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {

Map<int, List> data = {
  0 : [Icons.account_circle, 'My Account'],
  1 : [Icons.settings, 'Settings'],
  2 : [Icons.info_outline, 'About us'],
  3 : [Icons.email_outlined, 'Contact us'],
};

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
          'Account',
          style: mainTextStyle,
        ),
      ),
      backgroundColor: backgroundColor,
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(
                data[index]![0],
                color: mainIconColor,
                size: 20.0
              ),
              title: Text(
                data[index]![1],
                style: mainTextStyle,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: subIconColor,
                size: 20.0,
              ),
              onTap: () {},
            );
          }
        ),
      ),
    );
  }
}