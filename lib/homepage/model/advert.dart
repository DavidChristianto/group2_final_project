// To parse this JSON data, do
//
//     final advert = advertFromJson(jsonString);

import 'dart:convert';

List<Advert> advertFromJson(String str) => List<Advert>.from(json.decode(str).map((x) => Advert.fromJson(x)));

String advertToJson(List<Advert> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Advert {
    Advert({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Advert.fromJson(Map<String, dynamic> json) => Advert(
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
        required this.date,
        required this.title,
        required this.description,
        required this.adType,
        required this.username,
    });

    int user;
    String date;
    String title;
    String description;
    String adType;
    String username;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        date: json["date"],
        title: json["title"],
        description: json["description"],
        adType: json["ad_type"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "date": date,
        "title": title,
        "description": description,
        "ad_type": adType,
        "username": username,
    };
}
