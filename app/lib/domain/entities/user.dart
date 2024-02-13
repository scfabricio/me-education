import 'dart:convert';

import 'package:app/domain/vos/email.dart';
import 'package:app/domain/vos/name.dart';

class User {
  final int id;
  final Email email;
  final Name name;

  User({
    required this.id, 
    required this.email,
    required this.name
  });

  User copyWith({
    int? id,
    Email? email,
    Name? name,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'name': name,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      email: Email(map['email'] as String),
      name: Name(map['name'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(id: $id, email: $email, name: $name)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.email == email &&
      other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ email.hashCode ^ name.hashCode;
}
