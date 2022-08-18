import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/category.dart';

class CategoryCustomeWidget extends StatelessWidget {
  Category category;

  CategoryCustomeWidget(this.category);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: category.imageUrl ?? 'not defined',
              fit: BoxFit.cover,
              width: 80,
              height: 80,
            ),
          ),
          Text(category.name ?? 'not defined'),
        ],
      ),
    );
  }
}
