import 'package:flutter/material.dart';

class MainScreenNotifier extends ChangeNotifier {
  bool isDispose = false;

  int _pageIndex = 0;
  int get pageIndex => _pageIndex;
  set newIndex(int newIndex) {
    _pageIndex = newIndex;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    if (!isDispose) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    isDispose = true;
  }
}
