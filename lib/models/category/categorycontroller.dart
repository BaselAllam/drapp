import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drapp/models/category/categorymodel.dart';




class CategoryController{

  List<CategoryModel> _allCategories = [];
  List<CategoryModel> get allCategories => _allCategories;

  FirebaseFirestore fire = FirebaseFirestore.instance;


  getCategory() async {
    
    var _data = fire.collection('category').get().then((QuerySnapshot snap) {
      snap.docs.forEach((i) {
        CategoryModel _newCategory = CategoryModel.fromJson(i, id: i.id);
        _allCategories.add(_newCategory);
      });
    });
  }

}