// To parse this JSON data, do
//
//     final myVoucher = myVoucherFromJson(jsonString);

import 'dart:convert';

import '/app/model/voucher.dart';

MyVoucher myVoucherFromJson(String str) => MyVoucher.fromJson(json.decode(str));

String myVoucherToJson(MyVoucher data) => json.encode(data.toJson());

class MyVoucher {
    DateTime? createdAt;
    DateTime? updatedAt;
    int? userVoucherId;
    User? user;
    Voucher? voucher;
    bool? used;

    MyVoucher({
        this.createdAt,
        this.updatedAt,
        this.userVoucherId,
        this.user,
        this.voucher,
        this.used,
    });

    MyVoucher copyWith({
        DateTime? createdAt,
        DateTime? updatedAt,
        int? userVoucherId,
        User? user,
        Voucher? voucher,
        bool? used,
    }) => 
        MyVoucher(
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            userVoucherId: userVoucherId ?? this.userVoucherId,
            user: user ?? this.user,
            voucher: voucher ?? this.voucher,
            used: used ?? this.used,
        );

    factory MyVoucher.fromJson(Map<String, dynamic> json) => MyVoucher(
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        userVoucherId: json["userVoucherId"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        voucher: json["voucher"] == null ? null : Voucher.fromJson(json["voucher"]),
        used: json["used"],
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "userVoucherId": userVoucherId,
        "user": user?.toJson(),
        "voucher": voucher?.toJson(),
        "used": used,
    };
}

class User {
    DateTime? createdAt;
    DateTime? updatedAt;
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
    bool? enabled;
    List<Authority>? authorities;
    bool? accountNonExpired;
    bool? accountNonLocked;
    bool? credentialsNonExpired;

    User({
        this.createdAt,
        this.updatedAt,
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
        this.enabled,
        this.authorities,
        this.accountNonExpired,
        this.accountNonLocked,
        this.credentialsNonExpired,
    });

    User copyWith({
        DateTime? createdAt,
        DateTime? updatedAt,
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
        bool? enabled,
        List<Authority>? authorities,
        bool? accountNonExpired,
        bool? accountNonLocked,
        bool? credentialsNonExpired,
    }) => 
        User(
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
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
            enabled: enabled ?? this.enabled,
            authorities: authorities ?? this.authorities,
            accountNonExpired: accountNonExpired ?? this.accountNonExpired,
            accountNonLocked: accountNonLocked ?? this.accountNonLocked,
            credentialsNonExpired: credentialsNonExpired ?? this.credentialsNonExpired,
        );

    factory User.fromJson(Map<String, dynamic> json) => User(
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
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
        enabled: json["enabled"],
        authorities: json["authorities"] == null ? [] : List<Authority>.from(json["authorities"]!.map((x) => Authority.fromJson(x))),
        accountNonExpired: json["accountNonExpired"],
        accountNonLocked: json["accountNonLocked"],
        credentialsNonExpired: json["credentialsNonExpired"],
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
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
        "enabled": enabled,
        "authorities": authorities == null ? [] : List<dynamic>.from(authorities!.map((x) => x.toJson())),
        "accountNonExpired": accountNonExpired,
        "accountNonLocked": accountNonLocked,
        "credentialsNonExpired": credentialsNonExpired,
    };
}

class Authority {
    String? authority;

    Authority({
        this.authority,
    });

    Authority copyWith({
        String? authority,
    }) => 
        Authority(
            authority: authority ?? this.authority,
        );

    factory Authority.fromJson(Map<String, dynamic> json) => Authority(
        authority: json["authority"],
    );

    Map<String, dynamic> toJson() => {
        "authority": authority,
    };
}


