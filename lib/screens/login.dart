import 'package:drapp/models/global.dart';
import 'package:drapp/screens/botoomnavbar/bottomnavbar.dart';
import 'package:drapp/screens/signup.dart';
import 'package:drapp/theme/sharedcolors.dart';
import 'package:drapp/theme/snack.dart';
import 'package:drapp/theme/texttheme.dart';
import 'package:flutter/material.dart';




class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

GlobalKey<FormState> emailKey = GlobalKey<FormState>();
GlobalKey<FormState> passwordKey = GlobalKey<FormState>();

GlobalKey<FormState> mainKey = GlobalKey<FormState>();

bool isSecured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: backgroundColor,
        title: Text(
          'Login',
          style: mainTextStyle,
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: mainKey,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                height: MediaQuery.of(context).size.height/3,
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage('https://img.freepik.com/free-vector/mobile-login-concept-illustration_114360-83.jpg?size=338&ext=jpg'),
                    fit: BoxFit.fill
                  ),
                ),
              ),
              field(Icons.email_outlined, 'Email Address', false, emailController, emailKey),
              field(Icons.lock, 'Password', isSecured, passwordController, passwordKey),
              TextButton(
                child: Text(
                  'Login', 
                  style: TextStyle(color: Colors.white, fontSize: 20.0)
                ),
                style: TextButton.styleFrom(
                  backgroundColor: mainColor,
                ),
                onPressed: () {
                  if(!mainKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      snack(Colors.red, 'Some Fields Required')
                    );
                  }else{
                    setDataLocaly('email', emailController.text);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {return BottomNavBar();}));
                  }
                },
              ),
              TextButton(
                child: Text(
                  'Signup', 
                  style: TextStyle(color: mainColor, fontSize: 20.0)
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(color: mainColor, width: 1.5)
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'signup');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  field(IconData icon, String label, bool secure, TextEditingController controller, Key key) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        key: key,
        validator: (value) {
          if(value!.isEmpty) {
            return 'This Filed Required';
          }
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: mainColor, width: 0.5)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: mainColor, width: 0.5)
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.red, width: 0.5)
          ),
          prefixIcon: Icon(
            icon,
            color: mainColor,
            size: 20.0
          ),
          labelText: '$label',
          labelStyle: TextStyle(color: mainColor, fontSize: 15.0),
          suffixIcon: label == 'Password' ? IconButton(
            icon: Icon(Icons.remove_red_eye),
            color: subIconColor,
            iconSize: 17.0,
            onPressed: () {
              setState(() {
                isSecured = !isSecured;
              });
            }
          ) : null,
        ),
        obscureText: secure,
        controller: controller
      ),
    );
  }
}