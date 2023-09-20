
class ViewFoodModel {
  int? id;
  int? categoryIdId;
  String? categoryName;
  String? productName;
  String? productType;
  String? netWeight;
  String? companyName;
  String? benefit;
  String? price;
  String? marketedBy;
  String? description;
  String? expdate;
  String? image1;
  String? image2;
  String? image3;
  String? image4;
  String? image5;
  Null? rating;
  String? foodstatus;

  ViewFoodModel(
      {this.id,
        this.categoryIdId,
        this.categoryName,
        this.productName,
        this.productType,
        this.netWeight,
        this.companyName,
        this.benefit,
        this.price,
        this.marketedBy,
        this.description,
        this.expdate,
        this.image1,
        this.image2,
        this.image3,
        this.image4,
        this.image5,
        this.rating,
        this.foodstatus});

  factory ViewFoodModel.fromJson(Map<String, dynamic> json) {
    return ViewFoodModel(
        id : json['id'],
        categoryIdId : json['categoryId_id'],
        categoryName : json['categoryName'],
        productName : json['product_name'],
        productType : json['product_type'],
        netWeight : json['net_weight'],
        companyName : json['company_name'],
        benefit : json['benefit'],
        price : json['price'],
        marketedBy : json['marketed_by'],
        description : json['description'],
        expdate : json['expdate'],
        image1 : json['image1'],
        image2 : json['image2'],
        image3 : json['image3'],
        image4 : json['image4'],
        image5 : json['image5'],
        rating : json['rating'],
        foodstatus : json['foodstatus'],
    );
  }

}