import 'package:flutter/widgets.dart';

class FavoriteItemProvider with ChangeNotifier{
  final List _favoriteList = [];
  List get favoriteList => _favoriteList;

  void addFavorite(value){
    favoriteList.add(value);
    notifyListeners();
  }

  void removeFavorite(value){
    favoriteList.remove(value);
    notifyListeners();
  }
}