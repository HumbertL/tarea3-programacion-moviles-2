import 'package:flutter/material.dart';
import 'package:tarea3pm/pages/BookPage.dart';

import 'Book.dart';

class BookWidget extends StatelessWidget {
  final Book bookObject;

  const BookWidget({super.key, required this.bookObject});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (() {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BookPage(BookObject: bookObject)));
      }),
      child: Column(
        children: [
          Container(
            height: 120,
            margin: EdgeInsets.all(8),
            child: Positioned.fill(
                child: Image.network("${bookObject.imagelink}")),
          ),
          Text(
            "${bookObject.title}",
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
          )
        ],
      ),
    );
  }
}
