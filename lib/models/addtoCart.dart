class AddtoCartModel {
  CartData? datas;
  String? message;
  bool? success;

  AddtoCartModel({this.datas, this.message, this.success});

  AddtoCartModel.fromJson(Map<String, dynamic> json) {
    datas = json['data'] != null ? CartData.fromJson(json['data']) : null;
    message = json['message'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.datas != null) {
      data['data'] = this.datas!.toJson();
    }
    data['message'] = this.message;
    data['success'] = this.success;
    return data;
  }
}

class CartData {
  int? id;
  String? itemname;
  String? breedname;
  String? image;
  String? quantity;
  String? totalPrice;
  String? category;
  String? cartStatus;
  String? expday;
  int? item;
  int? user;

  CartData(
      {this.id,
        this.itemname,
        this.breedname,
        this.image,
        this.quantity,
        this.totalPrice,
        this.category,
        this.cartStatus,
        this.expday,
        this.item,
        this.user});

  CartData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itemname = json['itemname'];
    breedname = json['breedname'];
    image = json['image'];
    quantity = json['quantity'];
    totalPrice = json['total_price'];
    category = json['category'];
    cartStatus = json['cart_status'];
    expday = json['expday'];
    item = json['item_id'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['itemname'] = this.itemname;
    data['breedname'] = this.breedname;
    data['image'] = this.image;
    data['quantity'] = this.quantity;
    data['total_price'] = this.totalPrice;
    data['category'] = this.category;
    data['cart_status'] = this.cartStatus;
    data['expday'] = this.expday;
    data['item_id'] = this.item;
    data['user'] = this.user;
    return data;
  }
}