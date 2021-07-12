import 'package:drapp/models/global.dart';
import 'package:drapp/screens/botoomnavbar/bottomnavbar.dart';
import 'package:drapp/theme/sharedcolors.dart';
import 'package:drapp/theme/snack.dart';
import 'package:drapp/theme/texttheme.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';




class SignUp extends StatefulWidget {

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController userNameController = TextEditingController();

GlobalKey<FormState> emailKey = GlobalKey<FormState>();
GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
GlobalKey<FormState> userNameKey = GlobalKey<FormState>();

GlobalKey<FormState> mainKey = GlobalKey<FormState>();

bool isSecured = true;

String gender = '';

DateTime pickedDate = DateTime.now();

PickedFile? pickedFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: backgroundColor,
        title: Text(
          'Signup',
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
              picSection(),
              field(Icons.email_outlined, 'Email Address', false, emailController, emailKey),
              field(Icons.email_outlined, 'User Name', false, userNameController, userNameKey),
              field(Icons.lock, 'Password', isSecured, passwordController, passwordKey),
              ListTile(
                title: Text(
                  'Gender',
                  style: mainTextStyle
                ),
                subtitle: Text(
                  '$gender',
                  style: subTextStyle
                ),
                trailing: PopupMenuButton(
                  child: Icon(Icons.arrow_circle_down_rounded, color: Colors.grey, size: 20.0),
                  itemBuilder: (BuildContext context) {
                    return <PopupMenuItem<String>>[
                      PopupMenuItem(
                        child: Text('Male'),
                        value: 'Male'
                      ),
                      PopupMenuItem(
                        child: Text('FeMale'),
                        value: 'FeMale'
                      ),
                    ];
                  },
                  onSelected: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
              ),
              ListTile(
                title: Text(
                  'Date of Birth',
                  style: mainTextStyle
                ),
                subtitle: Text(
                  '${pickedDate.toString().substring(0, 10)}',
                  style: subTextStyle
                ),
                trailing: Icon(Icons.calendar_view_day, color: Colors.grey, size: 20.0),
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1960),
                    initialDate: DateTime(1960),
                    lastDate: DateTime(2015),
                  );
                  setState(() {
                    pickedDate = picked!;
                  });
                },
              ),
              TextButton(
                child: Text(
                  'Signup', 
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
                  'Login', 
                  style: TextStyle(color: mainColor, fontSize: 20.0)
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(color: mainColor, width: 1.5)
                ),
                onPressed: () {
                  Navigator.pop(context);
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
  picSection() {
    return Container(
      height: MediaQuery.of(context).size.height/3,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(pickedFile == null ? 'assets/logo.png' : pickedFile!.path),
          fit: BoxFit.fill
        ),
      ),
      child: IconButton(
        icon: Icon(Icons.add_a_photo),
        color: Colors.black,
        iconSize: 25.0,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.white,
            builder: (BuildContext context) {
              return Container(
                margin: EdgeInsets.all(10.0),
                child: Column(
                  children : [
                    Text(
                        'Pick Image',
                        style: mainTextStyle,
                      ),
                    ListTile(
                      title: Text(
                        'Gallery',
                        style: mainTextStyle,
                      ),
                      onTap: () {
                        pickImg(ImageSource.gallery);
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Camera',
                        style: mainTextStyle,
                      ),
                      onTap: () {
                        pickImg(ImageSource.camera);
                      },
                    ),
                  ]
                ),
              );
            }
          );
        }
      ),
    );
  }
  pickImg(ImageSource source) async {

    PickedFile? _pick = await ImagePicker.platform.pickImage(source: source);
    setState(() {
      pickedFile = _pick;
    });
  }
}