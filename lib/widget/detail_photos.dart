import 'package:flutter/material.dart';

class DetailPhotos extends StatelessWidget {
  final String imageUrl;
  const DetailPhotos({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          )),
    );
  }
}
