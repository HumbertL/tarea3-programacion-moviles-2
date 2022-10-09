import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../classes/Book.dart';

class BookPage extends StatelessWidget {
  final Book BookObject;
  const BookPage({super.key, required this.BookObject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detalles del libro",
        ),
        actions: [
          IconButton(
              onPressed: () => launchUrl(Uri.parse(BookObject.booklink)),
              icon: Icon(Icons.language)),
          IconButton(
              onPressed: () {
                Share.share(
                    "${BookObject.title}\nPáginas: ${BookObject.pages}");
              },
              icon: Icon(Icons.share))
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 300,
            margin: EdgeInsets.all(8),
            child: Positioned.fill(
                child: Image.network(
              "${BookObject.imagelink}",
              fit: BoxFit.cover,
            )),
          ),
          Text(
            "${BookObject.title}",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text("${BookObject.releaseddate}",
              style: TextStyle(fontWeight: FontWeight.bold)),
          Text("Pages: ${BookObject.pages}"),
          ExpansionTile(
            title: Text("Description"),
            children: [Text("${BookObject.description}")],
          )
        ],
      ),
    );
  }
}
