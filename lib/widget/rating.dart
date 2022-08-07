import 'package:aplikasi_kos/theme.dart';
import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  final int index;
  final int rating;
  const RatingItem({super.key, required this.index, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/star2.png",
      width: 20,
      color: index > rating ? greyColor : orangeColor,
    );
  }
}
