
class ViewCategoryModel{
  int id;
  String category_name;
  String category_image;

  ViewCategoryModel({
    required this.id, required this.category_name, required this.category_image
  });

  factory ViewCategoryModel.fromJson(Map<String, dynamic> json){
      return ViewCategoryModel(
        id: json['id'],
        category_name: json['category_name'],
        category_image: json['category_image']
      );
  }
}
