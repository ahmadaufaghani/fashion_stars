import 'package:fashion_stars/models/FashionsModel.dart';
import 'package:fashion_stars/services/FashionsService.dart';
import 'package:flutter/cupertino.dart';

class FashionsProvider with ChangeNotifier{
  List<FashionsModel> _fashions = [];

  List<FashionsModel> get fashions => _fashions;

  set fashions(List<FashionsModel> fashions){
    _fashions = fashions;
    notifyListeners();
  }

  Future<void> getFashions() async {
    try {
      List<FashionsModel> fashions = await FashionsService().getFashions();
      _fashions = fashions;
    } catch (e) {
      print(e);
    }

    Future<void> getFashionsList(String? query) async {
      try {
        List<FashionsModel> fashions = await FashionsService().getFashionList(
            query);
        _fashions = fashions;
      } catch (e) {
        print(e);
      }
    }
  }
}