import 'dart:convert';

List<FeedbackObject> FeedbackObjectFromJson(String str) =>
    List<FeedbackObject>.from(
        json.decode(str).map((x) => FeedbackObject.fromJson(x)));

String FeedbackObjectToJson(List<FeedbackObject> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FeedbackObject {
  FeedbackObject({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory FeedbackObject.fromJson(Map<String, dynamic> json) => FeedbackObject(
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
    required this.name,
    required this.review,
  });

  int user;
  String date;
  String name;
  String review;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        date: json["date"],
        name: json["name"],
        review: json["review"],
      );
  Map<String, dynamic> toJson() => {
        "user": user,
        "date": date,
        "name": name,
        "review": review,
      };
}
