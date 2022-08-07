import 'package:flutter/material.dart';

import '../theme.dart';

class FacilityItem extends StatelessWidget {
  final String imageUrl;
  final String number;
  final String name;
  const FacilityItem(
      {super.key,
      required this.imageUrl,
      required this.number,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl,
          width: 32,
        ),
        const SizedBox(
          height: 8,
        ),
        Text.rich(TextSpan(
            text: number,
            style: purpleTextStyle.copyWith(fontSize: 14),
            children: [
              TextSpan(
                  text: " $name", style: greyTextStyle.copyWith(fontSize: 14))
            ]))
      ],
    );
  }
}
