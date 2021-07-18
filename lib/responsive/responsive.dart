import 'package:flutter/material.dart';



double responsiveDoctorWidget(MediaQueryData data) {

  double _deviceHeight = data.size.height;

  if(_deviceHeight <= 540){
    return 125.0;
  }else{
    return 170.0;
  }
}



double responsiveDoctorProfile(MediaQueryData data) {

  double _deviceHeight = data.size.height;

  if(_deviceHeight <= 540){
    return 35.0;
  }else{
    return 75.0;
  }
}


double responsiveDoctorProfileImage(MediaQueryData data) {

  double _deviceHeight = data.size.height;

  if(_deviceHeight <= 540){
    return 135.0;
  }else{
    return 175.0;
  }
}