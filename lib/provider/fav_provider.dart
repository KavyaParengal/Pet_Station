import 'package:flutter/cupertino.dart';

class FavProvider_class extends ChangeNotifier{
  List _itemImage=[];
  List _itemName=[];
  List _breed=[];
  List _itemPrice=[];

  List get favoriteImage=>_itemImage;
  List get favoriteName=>_itemName;
  List get favoriteBreed=>_breed;
  List get favoritePrice=>_itemPrice;

  void favorites(String image,String name,String breed,String price){
    final favitem=_itemImage.contains(image);
    if(favitem){
      _itemImage.remove(image);
      _itemName.remove(name);
      _breed.remove(breed);
      _itemPrice.remove(price);
    }
    else{
      _itemImage.add(image);
      _itemName.add(name);
      _breed.add(breed);
      _itemPrice.add(price);
    }
    notifyListeners();
  }

  bool icn_change(String image){
    final favIcn=_itemImage.contains(image);
    return favIcn;
  }

}
