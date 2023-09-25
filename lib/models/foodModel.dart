
class ViewFoodModel {
  int id;
  int categoryIdId;
  String categoryName;
  String productName;
  String productType;
  String netWeight;
  String companyName;
  String benefit;
  String price;
  String marketedBy;
  String description;
  String expdate;
  String image1;
  String image2;
  String image3;
  String image4;
  String image5;
  double rating;
  int rating_count;
  String foodstatus;

  ViewFoodModel({
        required this.id,
        required this.categoryIdId,
        required this.categoryName,
        required this.productName,
        required this.productType,
        required this.netWeight,
        required this.companyName,
        required this.benefit,
        required this.price,
        required this.marketedBy,
        required this.description,
        required this.expdate,
        required this.image1,
        required this.image2,
        required this.image3,
        required this.image4,
        required this.image5,
        required this.rating,
        required this.rating_count,
        required this.foodstatus});

  factory ViewFoodModel.fromJson(Map<String, dynamic> json) {
    return ViewFoodModel(
        id : json['id']==null?0:json['id'],
        categoryIdId : json['categoryId_id']==null?0:json['categoryId_id'],
        categoryName : json['categoryName']==null?'':json['categoryName'],
        productName : json['product_name']==null?'':json['product_name'],
        productType : json['product_type']==null?'':json['product_type'],
        netWeight : json['net_weight']==null?'':json['net_weight'],
        companyName : json['company_name']==null?'':json['company_name'],
        benefit : json['benefit']==null?'':json['benefit'],
        price : json['price']==null?'':json['price'],
        marketedBy : json['marketed_by']==null?'':json['marketed_by'],
        description : json['description']==null?'':json['description'],
        expdate : json['expdate']==null?'':json['expdate'],
        image1 : json['image1']==null?'':json['image1'],
        image2 : json['image2']==null?'':json['image2'],
        image3 : json['image3']==null?'':json['image3'],
        image4 : json['image4']==null?'':json['image4'],
        image5 : json['image5']==null?'':json['image5'],
        rating : json['rating']==null?0:json['rating'],
        rating_count : json['rating_count']==null?0:json['rating_count'],
        foodstatus : json['foodstatus']==null?'':json['foodstatus'],
    );
  }

}