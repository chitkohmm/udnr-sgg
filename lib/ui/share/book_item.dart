import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  BookItem({
    Key? key,
    required this.name,
    required this.authorName,
    required this.photo,
    this.isLocal,
    this.onDelete,
  }) : super(key: key);

  final String name;
  final String authorName;
  final String photo;
  bool? isLocal = false;
  VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
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
                child: isLocal == true
                    ? Image.file(
                        File(photo),
                        errorBuilder: (context, _, widget) {
                          return const Center(
                            child: Icon(Icons.image_not_supported),
                          );
                        },
                        fit: BoxFit.cover,
                      )
                    : CachedNetworkImage(
                        imageUrl: photo,
                        errorWidget: (context, _, dynamic) {
                          return Container(
                            color: Colors.grey.shade400,
                          );
                        },
                        fit: BoxFit.cover,
                      ),
              ),
              isLocal == true
                  ? Positioned(
                      top: -20,
                      right: -20,
                      child: IconButton(
                        onPressed: onDelete,
                        icon: const Icon(
                          CupertinoIcons.minus_circle,
                          color: Colors.red,
                        ),
                      ),
                    )
                  : const SizedBox.shrink()
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                maxLines: 1,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                authorName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
