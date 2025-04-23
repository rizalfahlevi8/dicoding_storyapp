import 'dart:convert';

class User {
  String? userId;
  String? name;
  String? email;

  User({this.userId, this.name, this.email});

  @override
  String toString() =>
      'User(userId: $userId, name: $name, email: $email)';
  // agar saat print datanya kelihatan

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'email': email
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(userId: map['userId'], name: map['name'], email: map['email']);
  }

  String toJson() => json.encode(toMap());
  
  factory User.fromJson(String source) => User.fromMap(json.decode(source));

}
