class FavoriteItemModel {
  List<FavoriteData>? data;
  String? message;
  bool? success;

  FavoriteItemModel({this.data, this.message, this.success});

  FavoriteItemModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <FavoriteData>[];
      json['data'].forEach((v) {
        data!.add(new FavoriteData.fromJson(v));
      });
    }
    message = json['message'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['success'] = this.success;
    return data;
  }
}

class FavoriteData {
  int? id;
  int? itemId;
  int? userId;
  int? foodId;
  String? itemName;
  String? image;
  String? breed;
  String? price;
  String? favStatus;

  FavoriteData(
      {this.id,
        this.itemId,
        this.foodId,
        this.userId,
        this.itemName,
        this.image,
        this.breed,
        this.price,
        this.favStatus});

  FavoriteData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itemId = json['item_id'];
    foodId =json['fooditem_id'];
    userId = json['user_id'];
    itemName = json['item_name'];
    image = json['image'];
    breed = json['breed'];
    price = json['price'];
    favStatus = json['favStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['item_id'] = this.itemId;
    data['fooditem_id'] = this.foodId;
    data['user_id'] = this.userId;
    data['item_name'] = this.itemName;
    data['image'] = this.image;
    data['breed'] = this.breed;
    data['price'] = this.price;
    data['favStatus'] = this.favStatus;
    return data;
  }
}