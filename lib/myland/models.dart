// To parse required this JSON data, do
//
//     final userLand = userLandFromJson(jsonString);

import 'dart:convert';

List<UserLand> userLandFromJson(String str) => List<UserLand>.from(json.decode(str).map((x) => UserLand.fromJson(x)));

String userLandToJson(List<UserLand> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserLand {
    UserLand({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory UserLand.fromJson(Map<String, dynamic> json) => UserLand(
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
        required this.userFarmer,
        required this.size,
        required this.plant,
        required this.amountOfPlants,
        required this.amountOfUNeeded,
        required this.amountOfSNeeded,
        required this.amountOfKNeeded,
        required this.expectedYield,
        required this.grossIncome,
        required this.netIncome,
    });

    int userFarmer;
    int size;
    String plant;
    int amountOfPlants;
    double amountOfUNeeded;
    double amountOfSNeeded;
    double amountOfKNeeded;
    int expectedYield;
    int grossIncome;
    int netIncome;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        userFarmer: json["user_farmer"],
        size: json["size"],
        plant: json["plant"],
        amountOfPlants: json["amount_of_plants"],
        amountOfUNeeded: json["amount_of_u_needed"].toDouble(),
        amountOfSNeeded: json["amount_of_s_needed"].toDouble(),
        amountOfKNeeded: json["amount_of_k_needed"].toDouble(),
        expectedYield: json["expected_yield"],
        grossIncome: json["gross_income"],
        netIncome: json["net_income"],
    );

    Map<String, dynamic> toJson() => {
        "user_farmer": userFarmer,
        "size": size,
        "plant": plant,
        "amount_of_plants": amountOfPlants,
        "amount_of_u_needed": amountOfUNeeded,
        "amount_of_s_needed": amountOfSNeeded,
        "amount_of_k_needed": amountOfKNeeded,
        "expected_yield": expectedYield,
        "gross_income": grossIncome,
        "net_income": netIncome,
    };
}
