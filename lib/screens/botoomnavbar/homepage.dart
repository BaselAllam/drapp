import 'package:drapp/models/mainModel.dart';
import 'package:drapp/theme/icontheme.dart';
import 'package:drapp/theme/texttheme.dart';
import 'package:drapp/widgets/categorywidget.dart';
import 'package:drapp/widgets/notibutton.dart';
import 'package:flutter/material.dart';
import 'package:drapp/theme/sharedcolors.dart';
import 'package:scoped_model/scoped_model.dart';


class HomePage extends StatefulWidget {

  final MainModel model;

  HomePage(this.model);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

List categoryImages = [
  'https://img.icons8.com/ios/2x/4a90e2/medical-heart.png',
  'https://img.icons8.com/material-outlined/2x/4a90e2/dental-crown.png',
  'https://img.icons8.com/ios-glyphs/2x/4a90e2/mouth.png',
  'https://img.icons8.com/ios/2x/4a90e2/protection-mask.png',
  'https://img.icons8.com/ios-glyphs/2x/4a90e2/fever.png',
  'https://img.icons8.com/ios/2x/4a90e2/gastroscopy.png',
  'https://img.icons8.com/ios-glyphs/2x/4a90e2/kidney.png',
  'https://img.icons8.com/ios-glyphs/2x/4a90e2/bladder-flush.png',
  'https://img.icons8.com/ios/2x/4a90e2/dental-crown.png',
  'https://img.icons8.com/ios-glyphs/2x/4a90e2/sneeze.png',
  'https://img.icons8.com/ios/2x/4a90e2/fever.png',
  'https://img.icons8.com/ios-glyphs/2x/4a90e2/liver.png',
  'https://img.icons8.com/ios/2x/4a90e2/large-intestine.png',
  'https://img.icons8.com/ios/2x/4a90e2/kidney.png',
  'https://img.icons8.com/ios/2x/4a90e2/elbow-pain.png'
];

@override
void initState() {
  widget.model.getCategory();
  super.initState();
}

@override
void dispose() {
  widget.model.allCategories.clear();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model) {
        return Scaffold(
        appBar: AppBar(
          elevation: 2.0,
          backgroundColor: backgroundColor,
          leading: Icon(Icons.menu),
          actions: [
            NotiButton()
          ],
          iconTheme: appBarIconTheme,
          centerTitle: true,
          title: ListTile(
            title: Text(
              'Find Doctor in',
              style: subTextStyle,
            ),
            subtitle: Row(
              children: [
                Icon(Icons.location_on, color: mainIconColor, size: 15.0),
                Text(
                  '  Cairo  ',
                  style: mainTextStyle,
                ),
                Icon(Icons.arrow_downward, color: mainIconColor, size: 15.0),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: model.isAddDoctorLoading == true ? CircularProgressIndicator() : Icon(Icons.add, color: Colors.white, size: 20.0),
          backgroundColor: mainColor,
          onPressed: () {
            model.addnewDoctor();
          },
        ),
        backgroundColor: backgroundColor,
        body: Container(
          margin: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(
            children: [
              SafeArea(
                top: true,
                child: ListTile(
                  title: Text(
                    '\nSearch by Categories...\n',
                    style: mainTextStyle,
                  ),
                ),
              ),
              Flexible(
                child: ScopedModelDescendant(
                  builder: (context, child, MainModel model) {
                    if(model.isCategoryLoading == true) {
                      return Center(child: CircularProgressIndicator());
                    }else{
                      return GridView.builder(
                        scrollDirection: Axis.vertical,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 15.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 0.7
                        ),
                        itemCount: model.allCategories.length,
                        itemBuilder: (context, index) {
                          return CategoryItem(model.allCategories[index].categoryImage, model.allCategories[index].categoryName);
                        },
                      );
                    }
                  }
                ),
              ),
            ],
          ),
        ),
      );
      }
    );
  }
}