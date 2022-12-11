import 'dart:convert';

User UserFromJson(String str) =>
    User.fromJson(json.decode(str));
String UserToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.pk,
    required this.user,

  });
  String pk;
  String user;

  factory User.fromJson(Map<String, dynamic> json) => User(
      pk: json["pk"],
      user: json["user"]);

  Map<String, dynamic> toJson() => {
    "pk": pk,
    "user": user,
  };
}