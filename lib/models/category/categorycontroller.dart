import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drapp/models/category/categorymodel.dart';
import 'package:scoped_model/scoped_model.dart';



mixin CategoryController on Model{

  bool _isGetCategoryLoading = false;
  bool get isCategoryLoading => _isGetCategoryLoading;

  List<CategoryModel> _allCategories = [];
  List<CategoryModel> get allCategories => _allCategories;

  FirebaseFirestore fire = FirebaseFirestore.instance;


  getCategory() async {

    _isGetCategoryLoading = true;
    notifyListeners();
    
    var _data = await fire.collection('category').get();

    for(QueryDocumentSnapshot i in _data.docs) {
      CategoryModel _newCategory = CategoryModel.fromJson(i, id: i.id);
      _allCategories.add(_newCategory);
    }

    _isGetCategoryLoading = false;
    notifyListeners();

  }

}