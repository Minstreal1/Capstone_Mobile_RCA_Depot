// To parse this JSON data, do
//
//     final paymentDetail = paymentDetailFromJson(jsonString);

import 'dart:convert';

PaymentDetail paymentDetailFromJson(String str) => PaymentDetail.fromJson(json.decode(str));

String paymentDetailToJson(PaymentDetail data) => json.encode(data.toJson());

class PaymentDetail {
    List<CdPaymentDetail>? cdPaymentDetail;
    CollectorDepotPayment? collectorDepotPayment;

    PaymentDetail({
        this.cdPaymentDetail,
        this.collectorDepotPayment,
    });

    PaymentDetail copyWith({
        List<CdPaymentDetail>? cdPaymentDetail,
        CollectorDepotPayment? collectorDepotPayment,
    }) => 
        PaymentDetail(
            cdPaymentDetail: cdPaymentDetail ?? this.cdPaymentDetail,
            collectorDepotPayment: collectorDepotPayment ?? this.collectorDepotPayment,
        );

    factory PaymentDetail.fromJson(Map<String, dynamic> json) => PaymentDetail(
        cdPaymentDetail: json["cdPaymentDetail"] == null ? [] : List<CdPaymentDetail>.from(json["cdPaymentDetail"]!.map((x) => CdPaymentDetail.fromJson(x))),
        collectorDepotPayment: json["collectorDepotPayment"] == null ? null : CollectorDepotPayment.fromJson(json["collectorDepotPayment"]),
    );

    Map<String, dynamic> toJson() => {
        "cdPaymentDetail": cdPaymentDetail == null ? [] : List<dynamic>.from(cdPaymentDetail!.map((x) => x.toJson())),
        "collectorDepotPayment": collectorDepotPayment?.toJson(),
    };
}

class CdPaymentDetail {
    int? id;
    int? cdPaymentId;
    Material? material;
    double? quantity;

    CdPaymentDetail({
        this.id,
        this.cdPaymentId,
        this.material,
        this.quantity,
    });

    CdPaymentDetail copyWith({
        int? id,
        int? cdPaymentId,
        Material? material,
        double? quantity,
    }) => 
        CdPaymentDetail(
            id: id ?? this.id,
            cdPaymentId: cdPaymentId ?? this.cdPaymentId,
            material: material ?? this.material,
            quantity: quantity ?? this.quantity,
        );

    factory CdPaymentDetail.fromJson(Map<String, dynamic> json) => CdPaymentDetail(
        id: json["id"],
        cdPaymentId: json["cdPaymentId"],
        material: json["material"] == null ? null : Material.fromJson(json["material"]),
        quantity: json["quantity"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "cdPaymentId": cdPaymentId,
        "material": material?.toJson(),
        "quantity": quantity,
    };
}

class Material {
    int? id;
    String? name;
    String? description;
    double? price;

    Material({
        this.id,
        this.name,
        this.description,
        this.price,
    });

    Material copyWith({
        int? id,
        String? name,
        String? description,
        double? price,
    }) => 
        Material(
            id: id ?? this.id,
            name: name ?? this.name,
            description: description ?? this.description,
            price: price ?? this.price,
        );

    factory Material.fromJson(Map<String, dynamic> json) => Material(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
    };
}

class CollectorDepotPayment {
    DateTime? createdAt;
    DateTime? updatedAt;
    int? cdPaymentId;
    double? amount;
    String? status;
    String? materialType;
    Collector? collector;
    RecyclingDepot? recyclingDepot;

    CollectorDepotPayment({
        this.createdAt,
        this.updatedAt,
        this.cdPaymentId,
        this.amount,
        this.status,
        this.materialType,
        this.collector,
        this.recyclingDepot,
    });

    CollectorDepotPayment copyWith({
        DateTime? createdAt,
        DateTime? updatedAt,
        int? cdPaymentId,
        double? amount,
        String? status,
        String? materialType,
        Collector? collector,
        RecyclingDepot? recyclingDepot,
    }) => 
        CollectorDepotPayment(
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            cdPaymentId: cdPaymentId ?? this.cdPaymentId,
            amount: amount ?? this.amount,
            status: status ?? this.status,
            materialType: materialType ?? this.materialType,
            collector: collector ?? this.collector,
            recyclingDepot: recyclingDepot ?? this.recyclingDepot,
        );

    factory CollectorDepotPayment.fromJson(Map<String, dynamic> json) => CollectorDepotPayment(
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        cdPaymentId: json["cdPaymentId"],
        amount: json["amount"]?.toDouble(),
        status: json["status"],
        materialType: json["materialType"],
        collector: json["collector"] == null ? null : Collector.fromJson(json["collector"]),
        recyclingDepot: json["recyclingDepot"] == null ? null : RecyclingDepot.fromJson(json["recyclingDepot"]),
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "cdPaymentId": cdPaymentId,
        "amount": amount,
        "status": status,
        "materialType": materialType,
        "collector": collector?.toJson(),
        "recyclingDepot": recyclingDepot?.toJson(),
    };
}

class Collector {
    DateTime? createdAt;
    DateTime? updatedAt;
    int? collectorId;
    double? numberPoint;
    bool? isWorking;
    User? user;

    Collector({
        this.createdAt,
        this.updatedAt,
        this.collectorId,
        this.numberPoint,
        this.isWorking,
        this.user,
    });

    Collector copyWith({
        DateTime? createdAt,
        DateTime? updatedAt,
        int? collectorId,
        double? numberPoint,
        bool? isWorking,
        User? user,
    }) => 
        Collector(
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            collectorId: collectorId ?? this.collectorId,
            numberPoint: numberPoint ?? this.numberPoint,
            isWorking: isWorking ?? this.isWorking,
            user: user ?? this.user,
        );

    factory Collector.fromJson(Map<String, dynamic> json) => Collector(
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        collectorId: json["collectorId"],
        numberPoint: json["numberPoint"]?.toDouble(),
        isWorking: json["isWorking"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "collectorId": collectorId,
        "numberPoint": numberPoint,
        "isWorking": isWorking,
        "user": user?.toJson(),
    };
}

class User {
    DateTime? createdAt;
    DateTime? updatedAt;
    int? userId;
    String? username;
    String? password;
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
        this.password,
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
        String? password,
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
            password: password ?? this.password,
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
        password: json["password"],
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
        "password": password,
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

class RecyclingDepot {
    DateTime? createdAt;
    DateTime? updatedAt;
    int? id;
    String? depotName;
    String? location;
    double? latitude;
    double? longitude;
    bool? isWorking;
    double? balance;
    User? user;

    RecyclingDepot({
        this.createdAt,
        this.updatedAt,
        this.id,
        this.depotName,
        this.location,
        this.latitude,
        this.longitude,
        this.isWorking,
        this.balance,
        this.user,
    });

    RecyclingDepot copyWith({
        DateTime? createdAt,
        DateTime? updatedAt,
        int? id,
        String? depotName,
        String? location,
        double? latitude,
        double? longitude,
        bool? isWorking,
        double? balance,
        User? user,
    }) => 
        RecyclingDepot(
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            id: id ?? this.id,
            depotName: depotName ?? this.depotName,
            location: location ?? this.location,
            latitude: latitude ?? this.latitude,
            longitude: longitude ?? this.longitude,
            isWorking: isWorking ?? this.isWorking,
            balance: balance ?? this.balance,
            user: user ?? this.user,
        );

    factory RecyclingDepot.fromJson(Map<String, dynamic> json) => RecyclingDepot(
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        id: json["id"],
        depotName: json["depotName"],
        location: json["location"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        isWorking: json["isWorking"],
        balance: json["balance"]?.toDouble(),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "id": id,
        "depotName": depotName,
        "location": location,
        "latitude": latitude,
        "longitude": longitude,
        "isWorking": isWorking,
        "balance": balance,
        "user": user?.toJson(),
    };
}
