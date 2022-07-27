import 'package:flutter/material.dart';

import '../modules/login_screen.dart';

void navigateToAndFinish({
  required Widget widget,
  required context,
}) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (route) => false,
  );
}

void navigateTo({
  required Widget widget,
  required context,
}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}


