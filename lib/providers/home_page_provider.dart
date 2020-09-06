import 'package:flutter/material.dart';

class HomePageProvider with ChangeNotifier {
  int _index = 0;
  get currentIndex => _index;

  setIndex(int val) {
    this._index = val;
    notifyListeners();
  }
}