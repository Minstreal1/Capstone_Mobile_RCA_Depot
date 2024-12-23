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
  bool? isActive;

  MaterialTypeData(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.weight = 0,
      this.isActive});

  MaterialTypeData copyWith(
          {int? id,
          String? name,
          String? description,
          double? price,
          bool? isActive}) =>
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
  factory MaterialTypeData.fromJsonDepotInformation(
          Map<String, dynamic> json) =>
      MaterialTypeData(
        id: json["materialId"],
        name: json["materialName"],
        description: json["materialDescription"],
        price: json["price"]?.toDouble(),
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
      };
  Map<String, dynamic> toJsonUpdate(bool? act) => {
        "materialId": id,
        "price": act!=null?(price!+ (price! * 0.12)).toStringAsFixed(2):price,
        "active": act ?? isActive,
      };
  Map<String, dynamic> toJsonCreatePayment() => {
        "materialId": id,
        "quantity": weight,
      };
}
