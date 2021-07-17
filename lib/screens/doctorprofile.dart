import 'package:drapp/screens/map.dart';
import 'package:drapp/theme/sharedcolors.dart';
import 'package:drapp/theme/texttheme.dart';
import 'package:drapp/widgets/bookbutton.dart';
import 'package:flutter/material.dart';



class DoctorProfile extends StatefulWidget {

  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            header(),
            sectionTitle('About'),
            aboutSection(),
            sectionTitle('Biography'),
            biographySection()
          ],
        ),
      ),
    );
  }
  header() {
    double mainContainerHeight = MediaQuery.of(context).size.height/2.8;
    return Container(
      height: mainContainerHeight,
      child: Stack(
        children: [
          Container(
            color: mainColor,
            height: mainContainerHeight - 75,
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  iconSize: 20.0,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  'Doctor Profile',
                  style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.notifications),
                  color: Colors.white,
                  iconSize: 20.0,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Positioned(
            top: 50.0,
            left: 20.0,
            right: 20.0,
            height: mainContainerHeight - 75,
            child: Container(
              child: Card(
                color: Colors.white,
                elevation: 5.0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(15.0),
                          width: MediaQuery.of(context).size.width/3,
                          height: mainContainerHeight - 175,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            image: DecorationImage(
                              image: NetworkImage('https://images.pexels.com/photos/5452293/pexels-photo-5452293.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                              fit: BoxFit.fill
                            )
                          )
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BookButton(
                            () {},
                            40.0,
                            120.0
                          ),
                          IconButton(
                            icon: Icon(Icons.location_on),
                            color: mainColor,
                            iconSize: 20.0,
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(fullscreenDialog: true, builder: (_) {return Map();}));
                            }
                          )
                        ],
                      ),
                    )
                  ],
                )
              )
            )
          ),
        ],
      ),
    );
  }
  sectionTitle(String title) {
    return ListTile(
      title: Text(
        title,
        style: mainTextStyle
      ),
    );
  }
  sectionCard(Widget child) {
    return Card(
      margin: EdgeInsets.all(15.0),
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: child,
      ),
    );
  }
  aboutSection() {
    return sectionCard(
      Text(
        'Dr Ahmed Abd Aal Faculty of Medicine Cairo Univesity 2015\n PHD From Oxford 2020\n Wokrs in Om Ahmed Hospital',
        style: mainTextStyle,
      ),
    );
  }
  biographySection() {
    return sectionCard(
      Column(
        children: [
          biographyListTileItem('University', 'Cairo University'),
          biographyListTileItem('PHD', 'Oxford University'),
          biographyListTileItem('Certifications', '1st Certifications')
        ],
      ),
    );
  }
  biographyListTileItem(String title, String subTitle) {
    return ListTile(
      title: Text(
        title,
        style: subTextStyle,
      ),
      subtitle: Text(
        subTitle,
        style: mainTextStyle,
      )
    );
  }
}