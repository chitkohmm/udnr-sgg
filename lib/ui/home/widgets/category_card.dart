import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      clipBehavior: Clip.antiAlias,
      height: MediaQuery.of(context).size.height / 5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            blurRadius: 4,
            spreadRadius: 1,
            color: Colors.black12,
          )
        ],
      ),
      child: CachedNetworkImage(
        imageUrl:
            "https://i.pinimg.com/564x/ef/d4/01/efd4012581aa59fa0cadc2d29e7faa58.jpg",
        errorWidget: (context, _, dynamic) {
          return const Center(
            child: Icon(
              Icons.error,
              color: Colors.grey,
            ),
          );
        },
        fit: BoxFit.cover,
      ),
    );
  }
}
