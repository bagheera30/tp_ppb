import 'dart:math';

import 'package:flutter/material.dart';

class MatrixPage extends StatefulWidget {
  const MatrixPage({super.key});

  @override
  State<MatrixPage> createState() => _MatrixPageState();
}

class _MatrixPageState extends State<MatrixPage> {
  final TextEditingController _rowController = TextEditingController();
  final TextEditingController _columnController = TextEditingController();
  List<List<int>> _matrix = [];
  List<List<int>> _transposeMatrix = [];
  void _generateMatrix() {
    int rowCount = int.tryParse(_rowController.text) ?? 0;
    int columnCount = int.tryParse(_columnController.text) ?? 0;
    Random random = Random();

    _matrix = List<List<int>>.generate(
      rowCount,
      (_) => List<int>.generate(
        columnCount,
        (_) => random.nextInt(100),
      ),
    );

    _transposeMatrix = List<List<int>>.generate(
      columnCount,
      (i) => List<int>.generate(
        rowCount,
        (j) => _matrix[j][i],
      ),
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matrix Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _rowController,
              decoration: const InputDecoration(
                labelText: 'A',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _columnController,
              decoration: const InputDecoration(
                labelText: 'B',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: _generateMatrix,
              child: const Text('Generate Matrix'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Matrix: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    )),
                Text(_matrix.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    )),
                const SizedBox(height: 10),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Transpose Matrix: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    )),
                Text(_transposeMatrix.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
