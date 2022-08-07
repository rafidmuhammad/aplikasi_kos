import 'package:aplikasi_kos/theme.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  const NavBar({super.key, required this.imageUrl, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          imageUrl,
          width: 26,
        ),
        const Spacer(),
        Container(
          width: 30,
          height: 2,
          decoration: BoxDecoration(
              color: isActive ? purpleColor : whiteGreyColor2,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(1000))),
        )
      ],
    );
  }
}
