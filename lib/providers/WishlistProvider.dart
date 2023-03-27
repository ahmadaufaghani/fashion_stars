import 'package:fashion_stars/models/FashionsModel.dart';
import 'package:flutter/material.dart';

class WishlistProvider with ChangeNotifier {
  List<FashionsModel> _wishlist = [];

  List<FashionsModel> get wishlist => _wishlist;

  set wishlist(List<FashionsModel> wishlist) {
    _wishlist = wishlist;
    notifyListeners();
  }

  isWishlist(FashionsModel fashion) {
    if(_wishlist.indexWhere((element) => element.id == fashion.id) == -1) {
      return false;
    } else {
      return true;
    }
  }

  setFashions(FashionsModel fashion) {
      if(!isWishlist(fashion)) {
          _wishlist.add(fashion);
      } else {
        _wishlist.removeWhere((element)=> element.id == fashion.id);
      }
      notifyListeners();
  }
}