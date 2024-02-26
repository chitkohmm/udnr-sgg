import 'package:flutter/material.dart';
import 'package:libms_flutter/common/methods/common_methods.dart';

const String kAPIVERSION = "v1";
void kGoToNextAndRemove(BuildContext context, Widget widget) {
  Navigator.pushAndRemoveUntil(
    context,
    CommonMethods.createRoute(page: widget),
    (route) => false,
  );
}

void kGoToNext(BuildContext context, Widget widget) {
  Navigator.push(context, CommonMethods.createRoute(page: widget));
}

double kDeviceHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double kDeviceWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
