// To parse this JSON data, do
//
//     final scheduleCard = scheduleCardFromJson(jsonString);

import 'dart:convert';
import 'dart:developer';

import '../../app/model/material_type.dart';

ScheduleCard scheduleCardFromJson(String str) =>
    ScheduleCard.fromJson(json.decode(str));

String scheduleCardToJson(ScheduleCard data) => json.encode(data.toJson());

class ScheduleCard {
  int? scheduleId;
  DateTime? scheduleDate;
  List<MaterialTypeData>? materialType;
  String? status;
  Building? building;
  ResidentId? residentId;

  ScheduleCard({
    this.scheduleId,
    this.scheduleDate,
    this.materialType,
    this.status,
    this.building,
    this.residentId,
  });

  ScheduleCard copyWith({
    int? scheduleId,
    DateTime? scheduleDate,
    List<MaterialTypeData>? materialType,
    String? status,
    Building? building,
    ResidentId? residentId,
  }) =>
      ScheduleCard(
        scheduleId: scheduleId ?? this.scheduleId,
        scheduleDate: scheduleDate ?? this.scheduleDate,
        materialType: materialType ?? this.materialType,
        status: status ?? this.status,
        building: building ?? this.building,
        residentId: residentId ?? this.residentId,
      );

  factory ScheduleCard.fromJson(Map<String, dynamic> json) {
    List<MaterialTypeData> list = [];
    try {
      final List<dynamic> data = jsonDecode(json["materialType"]);
      list = data
          .map<MaterialTypeData>((item) => MaterialTypeData.fromJson(item))
          .toList();
    } catch (e) {
      log(e.toString());
      list = [];
    }
    return ScheduleCard(
      scheduleId: json["scheduleId"],
      scheduleDate: json["scheduleDate"] == null
          ? null
          : DateTime.parse(json["scheduleDate"]),
      materialType: list,
      status: json["status"],
      building:
          json["building"] == null ? null : Building.fromJson(json["building"]),
      residentId: json["residentId"] == null
          ? null
          : ResidentId.fromJson(json["residentId"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "scheduleId": scheduleId,
        "scheduleDate": scheduleDate?.toIso8601String(),
        "materialType": materialType,
        "status": status,
        "building": building?.toJson(),
        "residentId": residentId?.toJson(),
      };
}

class Building {
  int? buildingId;
  String? buildingName;
  String? location;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;

  Building({
    this.buildingId,
    this.buildingName,
    this.location,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  Building copyWith({
    int? buildingId,
    String? buildingName,
    String? location,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Building(
        buildingId: buildingId ?? this.buildingId,
        buildingName: buildingName ?? this.buildingName,
        location: location ?? this.location,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Building.fromJson(Map<String, dynamic> json) => Building(
        buildingId: json["buildingId"],
        buildingName: json["buildingName"],
        location: json["location"],
        description: json["description"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "buildingId": buildingId,
        "buildingName": buildingName,
        "location": location,
        "description": description,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class ResidentId {
  User? user;
  Apartment? apartment;

  ResidentId({
    this.user,
    this.apartment,
  });

  ResidentId copyWith({
    User? user,
    Apartment? apartment,
  }) =>
      ResidentId(
        user: user ?? this.user,
        apartment: apartment ?? this.apartment,
      );

  factory ResidentId.fromJson(Map<String, dynamic> json) => ResidentId(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        apartment: json["apartment"] == null
            ? null
            : Apartment.fromJson(json["apartment"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "apartment": apartment?.toJson(),
      };
}

class Apartment {
  dynamic createdAt;
  dynamic updatedAt;
  int? apartmentId;
  String? apartmentNumber;
  int? floor;
  String? residentCode;
  String? phoneNumber;

  Apartment({
    this.createdAt,
    this.updatedAt,
    this.apartmentId,
    this.apartmentNumber,
    this.floor,
    this.residentCode,
    this.phoneNumber,
  });

  Apartment copyWith({
    dynamic createdAt,
    dynamic updatedAt,
    int? apartmentId,
    String? apartmentNumber,
    int? floor,
    String? residentCode,
    String? phoneNumber,
  }) =>
      Apartment(
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        apartmentId: apartmentId ?? this.apartmentId,
        apartmentNumber: apartmentNumber ?? this.apartmentNumber,
        floor: floor ?? this.floor,
        residentCode: residentCode ?? this.residentCode,
        phoneNumber: phoneNumber ?? this.phoneNumber,
      );

  factory Apartment.fromJson(Map<String, dynamic> json) => Apartment(
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        apartmentId: json["apartmentId"],
        apartmentNumber: json["apartmentNumber"],
        floor: json["floor"],
        residentCode: json["residentCode"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "apartmentId": apartmentId,
        "apartmentNumber": apartmentNumber,
        "floor": floor,
        "residentCode": residentCode,
        "phoneNumber": phoneNumber,
      };
}

class User {
  String? phoneNumber;
  String? firstName;
  String? lastName;

  User({
    this.phoneNumber,
    this.firstName,
    this.lastName,
  });

  User copyWith({
    String? phoneNumber,
    String? firstName,
    String? lastName,
  }) =>
      User(
        phoneNumber: phoneNumber ?? this.phoneNumber,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        phoneNumber: json["phoneNumber"],
        firstName: json["firstName"],
        lastName: json["lastName"],
      );

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "firstName": firstName,
        "lastName": lastName,
      };
}
