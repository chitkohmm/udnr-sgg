import 'package:flutter/cupertino.dart';

extension MediaQueryX on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get width => mediaQuery.size.width;

  double get height => mediaQuery.size.height;

  double wp(double val) => width * val / 100;

  double hp(double val) => height * val / 100;
}
