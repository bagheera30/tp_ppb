class User {
  int? id;
  String name;

  User({this.id, required this.name});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name};
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(name: map['name'] as String, id: map['id'] as int);
  }
}
