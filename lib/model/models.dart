import 'dart:convert';

import 'package:flutter/cupertino.dart';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    required this.userId,
    required this.id,
    required this.title,
    this.body,
  });

  int userId;
  int id;
  String title;
  String? body;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}

// class User {
//   String name;
//   int? age;

//   User({required this.name, this.age});

//   factory User.fromJson(Map<String, dynamic> json) =>
//       User(name: json['name'], age: json['age']);
// }

// User user = User(name: "name");
// Post ram = Post(userId: 5, id: 6, title: "title", user: user);

// print(ram.body);

// []

// List users = [
//   {
//     'userId': 1,
//     "id": 2,
//     "title": "title",
//     "user": {"name": "Rupak", "age": 1}
//   },
//   {
//     'userId': 1,
//     "id": 2,
//     "title": "title",
//     "user": {"name": "Rupak", "age": 1}
//   },
//   {
//     'userId': 1,
//     "id": 2,
//     "title": "title",
//     "user": {"name": "Rupak", "age": 1}
//   }
// ];

// List<Post> mapUsers() {
//   List<Post> posts = users.map((e) => Post.fromJson(e)).toList();
//   // print(posts[0].user.age  ? : "no age");
//   return posts;
//   // return Post(userId: userId, id: id, title: title, user: user)
// }
