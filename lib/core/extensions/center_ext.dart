import 'package:flutter/widgets.dart';

extension SetNewValueToInt on int {
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
