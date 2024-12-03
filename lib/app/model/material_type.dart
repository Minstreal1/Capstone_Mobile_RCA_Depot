// To parse this JSON data, do
//
//     final materialType = materialTypeFromJson(jsonString);

import 'dart:convert';

MaterialTypeData materialTypeFromJson(String str) =>
    MaterialTypeData.fromJson(json.decode(str));

String materialTypeToJson(MaterialTypeData data) => json.encode(data.toJson());

class MaterialTypeData {
  int? id;
  String? name;
  String? description;
  double? price;
  double? weight;

  MaterialTypeData(
      {this.id, this.name, this.description, this.price, this.weight = 0});

  MaterialTypeData copyWith({
    int? id,
    String? name,
    String? description,
    double? price,
  }) =>
      MaterialTypeData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        price: price ?? this.price,
      );

  factory MaterialTypeData.fromJson(Map<String, dynamic> json) =>
      MaterialTypeData(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
      };
  Map<String, dynamic> toJsonCreatePayment() => {
        "materialId": id,
        "quantity": weight,
      };
}
