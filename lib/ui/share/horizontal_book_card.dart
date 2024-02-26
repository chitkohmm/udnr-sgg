import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HorizontalBookCard extends StatefulWidget {
  const HorizontalBookCard(
      {Key? key,
      required this.name,
      required this.authorName,
      required this.bookCover,
      required this.expiredDay})
      : super(key: key);
  final String name;
  final String authorName;
  final String bookCover;
  final String expiredDay;

  @override
  State<HorizontalBookCard> createState() => _HorizontalBookCardState();
}

class _HorizontalBookCardState extends State<HorizontalBookCard> {
  @override
  void initState() {
    _expireString(int.parse(widget.expiredDay));
    super.initState();
  }

  void _expireString(int expiredDay) {
    if (expiredDay == 0) {
      expire = "Today";
    } else if (expiredDay == 1) {
      expire = "Yesterday";
    } else {
      expire = "$expiredDay days ago";
    }
  }

  String expire = "";
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
              errorWidget: (context, _, child) {
                return Container(
                  color: Colors.grey.shade400,
                );
              },
              imageUrl: widget.bookCover,
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
                  widget.name,
                  maxLines: 1,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w700),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  widget.authorName,
                  maxLines: 1,
                  style: const TextStyle(color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  expire,
                  style: const TextStyle(color: Colors.red),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
