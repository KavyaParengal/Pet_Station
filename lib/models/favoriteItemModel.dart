class FavoriteItemModel {
  Data? data;
  String? message;
  bool? success;

  FavoriteItemModel({this.data, this.message, this.success});

  FavoriteItemModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['success'] = this.success;
    return data;
  }
}

class Data {
  int? id;
  String? itemName;
  String? image;
  String? breed;
  String? price;
  String? favStatus;
  int? item;
  int? user;

  Data(
      {this.id,
        this.itemName,
        this.image,
        this.breed,
        this.price,
        this.favStatus,
        this.item,
        this.user});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itemName = json['item_name'];
    image = json['image'];
    breed = json['breed'];
    price = json['price'];
    favStatus = json['favStatus'];
    item = json['item'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['item_name'] = this.itemName;
    data['image'] = this.image;
    data['breed'] = this.breed;
    data['price'] = this.price;
    data['favStatus'] = this.favStatus;
    data['item'] = this.item;
    data['user'] = this.user;
    return data;
  }
}