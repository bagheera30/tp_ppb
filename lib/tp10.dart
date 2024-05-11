import 'package:flutter/material.dart';
import 'package:tp/db/database.dart';
import 'package:tp/model/user.dart';

class Tugas extends StatefulWidget {
  const Tugas({super.key});

  @override
  State<Tugas> createState() => _TugasState();
}

class _TugasState extends State<Tugas> {
  final TextEditingController _namec = TextEditingController();
  List<User> users = [];
  final db = DatabaseHelper();
  @override
  void initState() {
    super.initState();
    rf();
  }

  void rf() {
    db.getUser().then((user) {
      setState(() {
        users = user;
      });
    });
  }

  void add() async {
    User newUser = User(name: _namec.text);
    await db.insertData(newUser);
    rf();
    _namec.text = '';
  }

  void edit(User user) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Name'),
        content: TextField(
          controller: _namec,
          decoration: InputDecoration(
            labelText: 'Edit name',
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
                user.name = _namec.text;
                await db.update(user);
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
            title: Text('add name'),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('close')),
              ElevatedButton(
                  onPressed: () {
                    add();
                    Navigator.pop(context);
                  },
                  child: Text('add'))
            ],
            content: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: TextField(
                  controller: _namec,
                  decoration: InputDecoration(
                    labelText: 'name',
                  ),
                ),
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('name'),
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
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text((index + 1).toString()),
                        backgroundColor:
                            index % 2 == 0 ? Colors.blue : Colors.green,
                        foregroundColor: Colors.white,
                        radius: 20,
                      ),
                      title: Text(users[index].name),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              _namec.text = users[index]
                                  .name; // Set current name in text field
                              edit(users[index]);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () async {
                              await db.delete(users[index].id ?? 0);
                              rf();
                            },
                          ),
                        ],
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
