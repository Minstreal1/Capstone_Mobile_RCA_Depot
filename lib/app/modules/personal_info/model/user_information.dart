// To parse this JSON data, do
//
//     final userInformation = userInformationFromJson(jsonString);

import 'dart:convert';

UserInformation userInformationFromJson(String str) => UserInformation.fromJson(json.decode(str));

String userInformationToJson(UserInformation data) => json.encode(data.toJson());

class UserInformation {
    int? userId;
    String? username;
    String? email;
    bool? emailConfirmed;
    String? phoneNumber;
    String? firstName;
    String? lastName;
    String? address;
    bool? isActive;
    String? role;

    UserInformation({
        this.userId,
        this.username,
        this.email,
        this.emailConfirmed,
        this.phoneNumber,
        this.firstName,
        this.lastName,
        this.address,
        this.isActive,
        this.role,
    });

    UserInformation copyWith({
        int? userId,
        String? username,
        String? email,
        bool? emailConfirmed,
        String? phoneNumber,
        String? firstName,
        String? lastName,
        String? address,
        bool? isActive,
        String? role,
    }) => 
        UserInformation(
            userId: userId ?? this.userId,
            username: username ?? this.username,
            email: email ?? this.email,
            emailConfirmed: emailConfirmed ?? this.emailConfirmed,
            phoneNumber: phoneNumber ?? this.phoneNumber,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            address: address ?? this.address,
            isActive: isActive ?? this.isActive,
            role: role ?? this.role,
        );

    factory UserInformation.fromJson(Map<String, dynamic> json) => UserInformation(
        userId: json["userId"],
        username: json["username"],
        email: json["email"],
        emailConfirmed: json["emailConfirmed"],
        phoneNumber: json["phoneNumber"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        address: json["address"],
        isActive: json["isActive"],
        role: json["role"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "username": username,
        "email": email,
        "emailConfirmed": emailConfirmed,
        "phoneNumber": phoneNumber,
        "firstName": firstName,
        "lastName": lastName,
        "address": address,
        "isActive": isActive,
        "role": role,
    };
}
