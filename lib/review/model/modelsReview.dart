

import 'package:flutter/material.dart';
import 'package:review/main.dart';
import 'package:review/drawer.dart';
import 'dart:convert';
import 'dart:convert';


List<Review> reviewFromJson(String str) => List<Review>.from(json.decode(str).map((x) => Review.fromJson(x)));

String reviewToJson(List<Review> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Review {
  Review({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    model: json["model"],
    pk: json["pk"],
    fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "model": model,
    "pk": pk,
    "fields": fields.toJson(),
  };
}

class Fields {
  Fields({
    required this.user,
    required this.rating,
    required this.date,
    required this.reviewText,
  });

  int user;
  double rating;
  DateTime date;
  String reviewText;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    user: json["user"],
    rating: json["rating"],
    date: DateTime.parse(json["date"]),
    reviewText: json["review_text"],
  );

  Map<String, dynamic> toJson() => {
    "user": user,
    "rating": rating,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "review_text": reviewText,
  };
}
