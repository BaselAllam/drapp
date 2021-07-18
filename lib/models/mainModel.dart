import 'package:drapp/models/category/categorycontroller.dart';
import 'package:drapp/models/doctors/doctorcontroller.dart';
import 'package:scoped_model/scoped_model.dart';



class MainModel extends Model with CategoryController, DoctorController{}