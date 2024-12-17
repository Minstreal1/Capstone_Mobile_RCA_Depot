// To parse this JSON data, do
//
//     final depotInformation = depotInformationFromJson(jsonString);

import 'dart:convert';

import 'package:rca_depot/app/model/material_type.dart';

DepotInformation depotInformationFromJson(String str) => DepotInformation.fromJson(json.decode(str));

String depotInformationToJson(DepotInformation data) => json.encode(data.toJson());

class DepotInformation {
    int? id;
    String? depotName;
    String? location;
    double? latitude;
    double? longitude;
    bool? isWorking;
    double? balance;
    List<MaterialTypeData>? depotMaterials;

    DepotInformation({
        this.id,
        this.depotName,
        this.location,
        this.latitude,
        this.longitude,
        this.isWorking,
        this.balance,
        this.depotMaterials,
    });

    DepotInformation copyWith({
        int? id,
        String? depotName,
        String? location,
        double? latitude,
        double? longitude,
        bool? isWorking,
        double? balance,
        List<MaterialTypeData>? depotMaterials,
    }) => 
        DepotInformation(
            id: id ?? this.id,
            depotName: depotName ?? this.depotName,
            location: location ?? this.location,
            latitude: latitude ?? this.latitude,
            longitude: longitude ?? this.longitude,
            isWorking: isWorking ?? this.isWorking,
            balance: balance ?? this.balance,
            depotMaterials: depotMaterials ?? this.depotMaterials,
        );

    factory DepotInformation.fromJson(Map<String, dynamic> json) => DepotInformation(
        id: json["id"],
        depotName: json["depotName"],
        location: json["location"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        isWorking: json["isWorking"],
        balance: json["balance"]?.toDouble(),
        depotMaterials: json["depotMaterials"] == null ? [] : List<MaterialTypeData>.from(json["depotMaterials"]!.map((x) => MaterialTypeData.fromJsonDepotInformation(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "depotName": depotName,
        "location": location,
        "latitude": latitude,
        "longitude": longitude,
        "isWorking": isWorking,
        "balance": balance,
        "depotMaterials": depotMaterials == null ? [] : List<dynamic>.from(depotMaterials!.map((x) => x.toJson())),
    };
}



