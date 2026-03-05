import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NavBarController extends ChangeNotifier{
  bool _isVisible = true;
  bool get isVisible => _isVisible;

  void toggle(){
    _isVisible = !_isVisible;
    notifyListeners();
  }

  void show(){
    if (_isVisible != true){
      _isVisible = true;
      notifyListeners();
    }
  }

  void hide(){
    if (_isVisible != false){
      _isVisible = false;
      notifyListeners();
    }
  }

  void attachScrollController(ScrollController scrollController, {double threshold = 40}) {
    double lastOffset = 0;
    ScrollDirection? direction = ScrollDirection.reverse;

    void listener() {
      final offset = scrollController.offset;
      final newDirection = scrollController.position.userScrollDirection;

      if (direction != newDirection) {
        lastOffset = offset;
        direction = newDirection;
      }

      if (_isVisible && offset - lastOffset > threshold) {
        hide();
        lastOffset = offset;
      } else if (!_isVisible && lastOffset - offset > threshold) {
        show();
        lastOffset = offset;
      }
    }

    scrollController.addListener(listener);
  }
}