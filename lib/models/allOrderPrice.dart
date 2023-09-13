class AllOrderPriceModel{
  String price;

  AllOrderPriceModel({required this.price});

  factory AllOrderPriceModel.fromJson(Map<String, dynamic> json){
    return AllOrderPriceModel(
        price: json['total_price']
    );
  }
}
