

class ViewCategoryItemsModel{
  int id;
  String categoryName;
  String name;
  String breed;
  String age;
  String gender;
  String price;
  String expdate;
  String description;
  String image1;
  String image2;
  String image3;
  String image4;
  double rating;
  int rating_count;

  ViewCategoryItemsModel(
      {required this.id,
        required this.categoryName,
        required this.name,
        required this.breed,
        required this.age,
        required this.gender,
        required this.price,
        required this.expdate,
        required this.description,
        required this.image1,
        required this.image2,
        required this.image3,
        required this.image4,
        required this.rating,
        required this.rating_count
      });

  factory ViewCategoryItemsModel.fromJson(Map<String, dynamic> json) {

    return ViewCategoryItemsModel(
      id: json['id']==null?0:json['id'],
      categoryName: json['categoryName']==null?'':json['categoryName'],
      name: json['name']==null?'':json['name'],
      breed: json['breed']==null?'':json['breed'],
      age: json['age']==null?'':json['age'],
      gender: json['gender']==null?'':json['gender'],
      price: json['price']==null?'':json['price'],
      expdate: json['expdate']==null?'':json['expdate'],
      description: json['description']==null?'':json['description'],
      image1: json['image1']==null?'':json['image1'],
      image2: json['image2']==null?'':json['image2'],
      image3: json['image3']==null?'':json['image3'],
      image4: json['image4']==null?'':json['image4'],
      rating: json['rating']==null?0:json['rating'],
      rating_count: json['rating_count']==null?0:json['rating_count']
    );
  }
}