// To parse this JSON data, do
//
//     final accountSession = accountSessionFromJson(jsonString);

import 'dart:convert';

AccountSession accountSessionFromJson(String str) => AccountSession.fromJson(json.decode(str));

String accountSessionToJson(AccountSession data) => json.encode(data.toJson());

class AccountSession {
    String? firstName;
    String? lastName;
    String? role;
    int? id;
    String? email;
    String? username;
    String? sub;

    AccountSession({
        this.firstName,
        this.lastName,
        this.role,
        this.id,
        this.email,
        this.username,
        this.sub,
    });

    AccountSession copyWith({
        String? firstName,
        String? lastName,
        String? role,
        int? id,
        String? email,
        String? username,
        String? sub,
    }) => 
        AccountSession(
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            role: role ?? this.role,
            id: id ?? this.id,
            email: email ?? this.email,
            username: username ?? this.username,
            sub: sub ?? this.sub,
        );

    factory AccountSession.fromJson(Map<String, dynamic> json) => AccountSession(
        firstName: json["firstName"],
        lastName: json["lastName"],
        role: json["role"],
        id: json["id"],
        email: json["email"],
        username: json["username"],
        sub: json["sub"],
    );

    Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "role": role,
        "id": id,
        "email": email,
        "username": username,
        "sub": sub,
    };
}
