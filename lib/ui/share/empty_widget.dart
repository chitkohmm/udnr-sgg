import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key, this.text}) : super(key: key);
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/not_found.webp",
            height: 180,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(text ?? "There is no related book."),
          )
        ],
      ),
    );
  }
}
