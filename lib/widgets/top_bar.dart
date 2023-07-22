import 'package:flutter/material.dart';

applicationTopBar() {
  return AppBar(
    backgroundColor: Colors.white,
    shadowColor: Colors.transparent,
    elevation: 0,
    title: Row(
      children: [
        Image.asset(
          "assets/images/Menu.png",
          height: 24,
          width: 24,
        ),
        Spacer(),
        Image.asset(
          "assets/images/forum_black_24dp 1.png",
          height: 24,
          width: 24,
        ),
        SizedBox(
          width: 15,
        ),
        Image.asset(
          "assets/images/Notification.png",
          height: 24,
          width: 24,
        ),
        SizedBox(
          width: 10,
        ),
      ],
    ),
  );
}
