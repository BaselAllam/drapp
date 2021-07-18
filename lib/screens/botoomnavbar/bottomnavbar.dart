import 'package:drapp/models/mainModel.dart';
import 'package:drapp/screens/botoomnavbar/account.dart';
import 'package:drapp/screens/botoomnavbar/favscreen.dart';
import 'package:drapp/screens/botoomnavbar/homepage.dart';
import 'package:drapp/theme/sharedcolors.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';



class BottomNavBar extends StatefulWidget {

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: backgroundColor,
        elevation: 3.0,
        selectedIconTheme: IconThemeData(color: mainColor, size: 20.0),
        selectedItemColor: mainColor,
        selectedLabelStyle: TextStyle(color: mainColor, fontSize: 15),
        unselectedIconTheme: IconThemeData(color: subIconColor, size: 20.0),
        unselectedLabelStyle: TextStyle(color: subIconColor, fontSize: 15),
        unselectedItemColor: subIconColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Book'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Fav'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Acount'
          ),
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: checkBody()
    );
  }
  checkBody() {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model) {
        if(currentIndex == 0) {
          return HomePage(model);
        }else if(currentIndex == 1){
          return FavScreen();
        }else{
          return Account();
        }
      },
    );
  }
}