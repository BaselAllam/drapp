import 'package:drapp/models/doctors/doctormodel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


mixin DoctorController on Model{


  bool _isGetDoctorLoading = false;
  bool get isGetDoctorLoading => _isGetDoctorLoading;

  bool _isAddDoctorLoading = false;
  bool get isAddDoctorLoading => _isAddDoctorLoading;

  List<DoctorModel> _allDoctors = [];
  List<DoctorModel> get allDoctors => _allDoctors;


  getDoctors() async {

    _isGetDoctorLoading = true;
    notifyListeners();

    http.Response _response = await http.get(Uri.parse('https://drappprivate-default-rtdb.firebaseio.com/doctors.json'));
    
    var _data = json.decode(_response.body);

    if(_response.statusCode == 200) {
      _data.forEach((x, y) {
        DoctorModel _newDoctor = DoctorModel.fromJson(y, x);
        _allDoctors.add(_newDoctor);
      });
    }

    _isGetDoctorLoading = false;
    notifyListeners();
  }


  addnewDoctor() async {

    _isAddDoctorLoading = true;
    notifyListeners();

    Map<String, dynamic> _data = {
      'doctorName' : 'Bassel',
      'doctorImage' : 'https://firebasestorage.googleapis.com/v0/b/drappprivate.appspot.com/o/pexels-photo-5452293.jpeg?alt=media&token=006f4cca-fbb8-4520-a9a1-f676cf50ed90',
      'location' : 'Cairo',
      'patient' : 200,
      'price' : 500,
      'rating' : '4.9'
    };

    http.Response _response = await http.post(
      Uri.parse('https://drappprivate-default-rtdb.firebaseio.com/doctors.json'),
      body: json.encode(_data)
    );
    
    print('${_response.statusCode} ${_response.body}');

    _isAddDoctorLoading = false;
    notifyListeners();

  }

}