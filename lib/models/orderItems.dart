class OrderItems {
  List<OrderData>? data;
  String? message;
  bool? success;

  OrderItems({this.data, this.message, this.success});

  OrderItems.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <OrderData>[];
      json['data'].forEach((v) {
        data!.add(new OrderData.fromJson(v));
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

class OrderData {
  int? id;
  int? userId;
  int? productId;
  String? productName;
  String? orderdate;
  String? breed;
  String? quantity;
  double? totalPrice;
  String? image;
  String? category;
  String? expday;
  String? orderStatus;

  OrderData(
      {this.id,
        this.userId,
        this.productId,
        this.productName,
        this.orderdate,
        this.breed,
        this.quantity,
        this.totalPrice,
        this.image,
        this.category,
        this.expday,
        this.orderStatus});

  OrderData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    productName = json['product_name'];
    orderdate = json['orderdate'];
    breed = json['breed'];
    quantity = json['quantity'];
    totalPrice = json['total_price'];
    image = json['image'];
    category = json['category'];
    expday = json['expday'];
    orderStatus = json['order_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['orderdate'] = this.orderdate;
    data['breed'] = this.breed;
    data['quantity'] = this.quantity;
    data['total_price'] = this.totalPrice;
    data['image'] = this.image;
    data['category'] = this.category;
    data['expday'] = this.expday;
    data['order_status'] = this.orderStatus;
    return data;
  }
}