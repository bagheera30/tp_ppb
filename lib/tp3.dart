import 'package:flutter/material.dart';

class Box extends StatefulWidget {
  const Box({super.key});

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome, ',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(218, 116, 47, 244),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Muhammad Rizki Alfian - 1302210112',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(218, 116, 47, 244),
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
