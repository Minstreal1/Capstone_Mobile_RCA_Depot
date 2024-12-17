// To parse this JSON data, do
//
//     final payLoadSignUp = payLoadSignUpFromJson(jsonString);

import 'dart:convert';

PayLoadSignUp payLoadSignUpFromJson(String str) => PayLoadSignUp.fromJson(json.decode(str));

String payLoadSignUpToJson(PayLoadSignUp data) => json.encode(data.toJson());

class PayLoadSignUp {
    String? username;
    String? password;
    String? email;
    String? phoneNumber;
    String? firstName;
    String? lastName;
    String? address;
    String? depotName;
    String? location;
    double? latitude;
    double? longitude;

    PayLoadSignUp({
        this.username,
        this.password,
        this.email,
        this.phoneNumber,
        this.firstName,
        this.lastName,
        this.address,
        this.depotName,
        this.location,
        this.latitude,
        this.longitude,
    });

    PayLoadSignUp copyWith({
        String? username,
        String? password,
        String? email,
        String? phoneNumber,
        String? firstName,
        String? lastName,
        String? address,
        String? depotName,
        String? location,
        double? latitude,
        double? longitude,
    }) => 
        PayLoadSignUp(
            username: username ?? this.username,
            password: password ?? this.password,
            email: email ?? this.email,
            phoneNumber: phoneNumber ?? this.phoneNumber,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            address: address ?? this.address,
            depotName: depotName ?? this.depotName,
            location: location ?? this.location,
            latitude: latitude ?? this.latitude,
            longitude: longitude ?? this.longitude,
        );

    factory PayLoadSignUp.fromJson(Map<String, dynamic> json) => PayLoadSignUp(
        username: json["username"],
        password: json["password"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        address: json["address"],
        depotName: json["depotName"],
        location: json["location"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "email": email,
        "phoneNumber": phoneNumber,
        "firstName": firstName,
        "lastName": lastName,
        "address": address,
        "depotName": depotName,
        "location": location,
        "latitude": latitude,
        "longitude": longitude,
    };
}
