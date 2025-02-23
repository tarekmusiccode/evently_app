import 'package:flutter/widgets.dart';

extension setNewValueToInt on int {
  String toAnotherString() {
    return "";
  }
}

extension CenterToWidget on Widget {
  Widget setCenter() {
    return Center(
      child: this,
    );
  }
}
