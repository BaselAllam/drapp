

class CategoryModel{

  String? id;
  String? categoryName;
  String? categoryImage;

  CategoryModel(this.id, this.categoryName, this.categoryImage);

  factory CategoryModel.fromJson(var i, {String? id}) {
    return CategoryModel(
      id,
      i['categoryName'],
      i['categoryImage']
    );
  }
}