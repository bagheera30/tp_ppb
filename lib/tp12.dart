import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Tp12 extends StatefulWidget {
  const Tp12({super.key});

  @override
  State<Tp12> createState() => _Tp12State();
}

class _Tp12State extends State<Tp12> {
  final TextEditingController _namec = TextEditingController();
  final TextEditingController _categoryc = TextEditingController();
  final TextEditingController _descriptionc = TextEditingController();
  List gudang = [];
  @override
  void initState() {
    super.initState();
    rf();
  }

  Future<void> delete(String id) async {
    String url = "http://10.0.2.2/api/delete.php";
    print('test');
    try {
      var r = await http.post(Uri.parse(url), body: {
        "id": id,
      });
      var res = jsonDecode(r.body);
      if (res["sukses"] == "true") {
        SnackBar(content: Text('data terhapus'));
      } else {
        print('gagal');
      }
      rf();
    } catch (e) {
      SnackBar(content: Text(e.toString()));
    }
    rf();
  }

  Future<void> rf() async {
    String url = "http://10.0.2.2/api/readData.php";
    try {
      var r = await http.get(Uri.parse(url));
      setState(() {
        gudang = jsonDecode(r.body);
      });
    } catch (e) {
      SnackBar(
        content: Text(e.toString()),
      );
    }
  }

  Future<void> add() async {
    if (_namec.text.isNotEmpty ||
        _categoryc.text.isNotEmpty ||
        _descriptionc.text.isNotEmpty) {
      try {
        String url = "http://10.0.2.2/api/insertData.php";
        var r = await http.post(Uri.parse(url), body: {
          "name": _namec.text,
          "category": _categoryc.text,
          "description": _descriptionc.text
        });
        var res = jsonDecode(r.body);
        if (res["success"] == "true") {
          SnackBar(
            content: Text('data tersimpan'),
          );
        }
      } catch (e) {
        SnackBar(
          content: Text(e.toString()),
        );
      }
    } else {
      SnackBar(
        content: Text('tidak boleh kosong'),
      );
    }
    rf();
    _namec.text = '';
    _categoryc.text = '';
    _descriptionc.text = '';
  }

  void edit(String id, String name, String category, String description) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('edit Name'),
        content: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.3,
          ),
          child: Column(
            children: [
              TextField(
                controller: _namec,
                decoration: InputDecoration(
                  labelText: 'Edit name',
                ),
              ),
              TextField(
                controller: _categoryc,
                decoration: InputDecoration(
                  labelText: 'Edit category',
                ),
              ),
              TextField(
                controller: _descriptionc,
                decoration: InputDecoration(
                  labelText: 'Edit description',
                ),
              ),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel')),
          ElevatedButton(
              onPressed: () async {
                name = _namec.text;
                category = _categoryc.text;
                description = _descriptionc.text;

                var r = await http
                    .post(Uri.parse("http://10.0.2.2/api/update.php"), body: {
                  "id": id,
                  "name": _namec.text,
                  "category": _categoryc.text,
                  "description": _descriptionc.text
                });
                var res = jsonDecode(r.body);
                if (res["success"] == "true") {
                  SnackBar(
                    content: Text('data terupdate'),
                  );
                } else {
                  print('ada error');
                }

                rf();
                _namec.text = '';
                Navigator.pop(context);
              },
              child: Text('Save')),
        ],
      ),
    );
  }

  void popup() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Name'),
        content: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.3,
          ),
          child: Column(
            children: [
              TextField(
                controller: _namec,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
              TextField(
                controller: _categoryc,
                decoration: InputDecoration(
                  labelText: 'Category',
                ),
              ),
              TextField(
                controller: _descriptionc,
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
              ),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Close'),
          ),
          ElevatedButton(
            onPressed: () {
              add();
              Navigator.pop(context);
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('gudang'),
          backgroundColor: Colors.blue,
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              popup();
            },
            child: Icon(Icons.add_alert_outlined)),
        body: Column(
          children: [
            Expanded(
              child: SafeArea(
                child: ListView.builder(
                  itemCount: gudang.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(
                            gudang[index]['name'],
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ), // Access 'name' property using bracket notation
                          subtitle: Text(
                            gudang[index]['category'],
                            style: TextStyle(fontSize: 15),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    _namec.text = gudang[index]['name'];
                                    _categoryc.text = gudang[index]['category'];
                                    _descriptionc.text =
                                        gudang[index]['description'];
                                    edit(
                                        gudang[index]['id'],
                                        gudang[index]['name'],
                                        gudang[index]['category'],
                                        gudang[index]['description']);
                                  },
                                  icon: Icon(Icons.edit)),
                              IconButton(
                                onPressed: () {
                                  delete(gudang[index]['id']);
                                  rf();
                                },
                                icon: Icon(Icons.delete),
                              )
                            ],
                          ), // Access 'category' property using bracket notation
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
