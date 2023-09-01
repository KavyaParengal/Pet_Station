

class ViewCategoryItemsModel{
  int id;
  String categoryName;
  String name;
  String breed;
  String age;
  String gender;
  String price;
  String description;
  String image1;
  String image2;
  String image3;
  String image4;

  ViewCategoryItemsModel(
      {required this.id,
        required this.categoryName,
        required this.name,
        required this.breed,
        required this.age,
        required this.gender,
        required this.price,
        required this.description,
        required this.image1,
        required this.image2,
        required this.image3,
        required this.image4});

  factory ViewCategoryItemsModel.fromJson(Map<String, dynamic> json) {

    return ViewCategoryItemsModel(
      id: json['id'],
      categoryName: json['categoryName'],
      name: json['name'],
      breed: json['breed'],
      age: json['age'],
      gender: json['gender'],
      price: json['price'],
      description: json['description'],
      image1: json['image1'],
      image2: json['image2'],
      image3: json['image3'],
      image4: json['image4']
    );
  }
}