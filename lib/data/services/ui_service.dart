import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

enum NavBarAnimation{
  hard,
  soft
}
class NavBarController extends ChangeNotifier{
  NavBarAnimation _animation = NavBarAnimation.soft;
  NavBarAnimation get animation => _animation;

  bool _isVisible = true;
  bool get isVisible => _isVisible;

  void toggle({NavBarAnimation animation = NavBarAnimation.soft}){
    _isVisible = !_isVisible;
    _animation = animation;
    notifyListeners();
  }

  void show({NavBarAnimation animation = NavBarAnimation.soft}){
    if (_isVisible != true){
      _isVisible = true;
      _animation = animation;
      notifyListeners();
    }
  }

  void hide({NavBarAnimation animation = NavBarAnimation.soft}){
    if (_isVisible != false){
      _isVisible = false;
      _animation = animation;
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