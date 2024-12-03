// To parse this JSON data, do
//
//     final scheduleDetail = scheduleDetailFromJson(jsonString);

import 'dart:convert';

ScheduleDetail scheduleDetailFromJson(String str) => ScheduleDetail.fromJson(json.decode(str));

String scheduleDetailToJson(ScheduleDetail data) => json.encode(data.toJson());

class ScheduleDetail {
    int? scheduleId;
    DateTime? scheduleDate;
    String? status;
    Building? building;
    Collector? collector;
    Resident? residentId;

    ScheduleDetail({
        this.scheduleId,
        this.scheduleDate,
        this.status,
        this.building,
        this.collector,
        this.residentId,
    });

    ScheduleDetail copyWith({
        int? scheduleId,
        DateTime? scheduleDate,
        String? status,
        Building? building,
        Collector? collector,
        Resident? residentId,
    }) => 
        ScheduleDetail(
            scheduleId: scheduleId ?? this.scheduleId,
            scheduleDate: scheduleDate ?? this.scheduleDate,
            status: status ?? this.status,
            building: building ?? this.building,
            collector: collector ?? this.collector,
            residentId: residentId ?? this.residentId,
        );

    factory ScheduleDetail.fromJson(Map<String, dynamic> json) => ScheduleDetail(
        scheduleId: json["scheduleId"],
        scheduleDate: json["scheduleDate"] == null ? null : DateTime.parse(json["scheduleDate"]),
        status: json["status"],
        building: json["building"] == null ? null : Building.fromJson(json["building"]),
        collector: json["collector"] == null ? null : Collector.fromJson(json["collector"]),
        residentId: json["residentId"] == null ? null : Resident.fromJson(json["residentId"]),
    );

    Map<String, dynamic> toJson() => {
        "scheduleId": scheduleId,
        "scheduleDate": scheduleDate?.toIso8601String(),
        "status": status,
        "building": building?.toJson(),
        "collector": collector?.toJson(),
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
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
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

class Collector {
    User? user;

    Collector({
        this.user,
    });

    Collector copyWith({
        User? user,
    }) => 
        Collector(
            user: user ?? this.user,
        );

    factory Collector.fromJson(Map<String, dynamic> json) => Collector(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
    };
}

class User {
    int? userId;
    String? username;
    String? email;
    String? phoneNumber;
    String? firstName;
    String? lastName;

    User({
        this.userId,
        this.username,
        this.email,
        this.phoneNumber,
        this.firstName,
        this.lastName,
    });

    User copyWith({
        int? userId,
        String? username,
        String? email,
        String? phoneNumber,
        String? firstName,
        String? lastName,
    }) => 
        User(
            userId: userId ?? this.userId,
            username: username ?? this.username,
            email: email ?? this.email,
            phoneNumber: phoneNumber ?? this.phoneNumber,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
        );

    factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["userId"],
        username: json["username"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        firstName: json["firstName"],
        lastName: json["lastName"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "username": username,
        "email": email,
        "phoneNumber": phoneNumber,
        "firstName": firstName,
        "lastName": lastName,
    };
}

class Resident {
    User? user;
    Apartment? apartment;

    Resident({
        this.user,
        this.apartment,
    });

    Resident copyWith({
        User? user,
        Apartment? apartment,
    }) => 
        Resident(
            user: user ?? this.user,
            apartment: apartment ?? this.apartment,
        );

    factory Resident.fromJson(Map<String, dynamic> json) => Resident(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        apartment: json["apartment"] == null ? null : Apartment.fromJson(json["apartment"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "apartment": apartment?.toJson(),
    };
}

class Apartment {
    String? apartmentNumber;
    int? floor;
    String? residentCode;
    String? phoneNumber;

    Apartment({
        this.apartmentNumber,
        this.floor,
        this.residentCode,
        this.phoneNumber,
    });

    Apartment copyWith({
        String? apartmentNumber,
        int? floor,
        String? residentCode,
        String? phoneNumber,
    }) => 
        Apartment(
            apartmentNumber: apartmentNumber ?? this.apartmentNumber,
            floor: floor ?? this.floor,
            residentCode: residentCode ?? this.residentCode,
            phoneNumber: phoneNumber ?? this.phoneNumber,
        );

    factory Apartment.fromJson(Map<String, dynamic> json) => Apartment(
        apartmentNumber: json["apartmentNumber"],
        floor: json["floor"],
        residentCode: json["residentCode"],
        phoneNumber: json["phoneNumber"],
    );

    Map<String, dynamic> toJson() => {
        "apartmentNumber": apartmentNumber,
        "floor": floor,
        "residentCode": residentCode,
        "phoneNumber": phoneNumber,
    };
}
