import 'package:flutter/material.dart';

class Tp6 extends StatefulWidget {
  const Tp6({Key? key}) : super(key: key);

  @override
  State<Tp6> createState() => _Tp6State();
}

class _Tp6State extends State<Tp6> {
  final List<Map> data = [
    {
      'judul': 'Native App',
      'detail': 'IOS,Android,Web',
      'color': Colors.red,
    },
    {
      'judul': 'Hybrid App',
      'detail': 'IOS,Android,Web,Javascript,Dart',
      'color': const Color.fromARGB(255, 63, 63, 61),
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: data[index]['color'],
            ),
            title: Text(data[index]['judul']!),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Detail'),
                    content: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              data[index]['judul']!,
                              style: TextStyle(
                                  color: Colors.blue[400], fontSize: 30),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              data[index]['detail']!,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        );
      },
    )));
  }
}
