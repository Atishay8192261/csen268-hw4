import 'package:flutter/material.dart';

class BookDetailPage extends StatelessWidget {
  const BookDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book'),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(40),
        child: Text(
          'Detail of the Book',
          style: TextStyle(fontSize: 22, height: 28 / 22, color: Colors.grey),
        ),
      ),
    );
  }
}
