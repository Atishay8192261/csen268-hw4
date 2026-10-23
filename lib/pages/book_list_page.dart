import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../navigation/router.dart';

class BookListPage extends StatelessWidget {
  final bool byAuthor;
  const BookListPage({super.key, required this.byAuthor});

  @override
  Widget build(BuildContext context) {
    String heading = 'Sorted by Title';
    if (byAuthor) {
      heading = 'Sorted by Author';
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Books'),
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 20),
            child: Text(
              heading,
              style: const TextStyle(fontSize: 28, height: 36 / 28),
            ),
          ),
          for (int i = 0; i < 4; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                tileColor: const Color(0xFFFEF7FF),
                minTileHeight: 80,
                titleAlignment: ListTileTitleAlignment.top,
                title: const Text('Da Vinci Code'),
                subtitle: const Text('Dan Brown'),
                onTap: () {
                  if (byAuthor) {
                    context.goNamed(RouteName.byAuthorDetail);
                  } else {
                    context.goNamed(RouteName.byTitleDetail);
                  }
                },
              ),
            ),
        ],
      ),
    );
  }
}
