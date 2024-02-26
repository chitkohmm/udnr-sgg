import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BorrowBookCard extends StatelessWidget {
  const BorrowBookCard(
      {Key? key,
      required this.bookName,
      required this.authorName,
      required this.bookCover,
      required this.left})
      : super(key: key);
  final String bookName;
  final String authorName;
  final String bookCover;
  final String left;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 6,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 1)
          ]),
      child: Row(
        children: [
          Container(
            width: 85,
            height: 150,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: CachedNetworkImage(
              imageUrl: bookCover,
              errorWidget: (context, _, child) {
                return Container(
                  color: Colors.grey.shade400,
                );
              },
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bookName,
                  maxLines: 1,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w700),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  authorName,
                  maxLines: 1,
                  style: const TextStyle(color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                ),
                // Text(
                //   left == "1" ? "$left day left" : "$left days left",
                //   style: const TextStyle(color: Colors.blue),
                // )
                Text(
                  left == "1" ? "$left day left" : "$left days left",
                  style: const TextStyle(color: Colors.blue),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
