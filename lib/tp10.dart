import 'package:flutter/material.dart';
import 'package:tp/db/database.dart';
import 'package:tp/model/user.dart';

class Tp10 extends StatefulWidget {
  const Tp10({super.key});

  @override
  State<Tp10> createState() => _Tp10State();
}

class _Tp10State extends State<Tp10> {
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
                        child: Text(users[index].id.toString()),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        radius: 20,
                      ),
                      title: Text(users[index].name),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () async {
                          await db.delete(users[index].id ?? 0);
                        },
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
