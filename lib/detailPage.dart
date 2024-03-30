import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Map data;

  DetailPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data['judul'],
              style: TextStyle(color: data['color'], fontSize: 30),
            ),
            const SizedBox(height: 16),
            Text(
              data['detail'],
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Go back',
                style: TextStyle(color: Colors.blue, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
