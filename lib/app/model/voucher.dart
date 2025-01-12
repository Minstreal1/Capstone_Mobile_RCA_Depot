// To parse this JSON data, do
//
//     final voucher = voucherFromJson(jsonString);

import 'dart:convert';

Voucher voucherFromJson(String str) => Voucher.fromJson(json.decode(str));

String voucherToJson(Voucher data) => json.encode(data.toJson());

class Voucher {
    DateTime? createdAt;
    DateTime? updatedAt;
    int? voucherId;
    String? name;
    String? description;
    String? voucherCode;
    double? pointToRedeem;

    Voucher({
        this.createdAt,
        this.updatedAt,
        this.voucherId,
        this.name,
        this.description,
        this.voucherCode,
        this.pointToRedeem,
    });

    Voucher copyWith({
        DateTime? createdAt,
        DateTime? updatedAt,
        int? voucherId,
        String? name,
        String? description,
        String? voucherCode,
        double? pointToRedeem,
    }) => 
        Voucher(
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            voucherId: voucherId ?? this.voucherId,
            name: name ?? this.name,
            description: description ?? this.description,
            voucherCode: voucherCode ?? this.voucherCode,
            pointToRedeem: pointToRedeem ?? this.pointToRedeem,
        );

    factory Voucher.fromJson(Map<String, dynamic> json) => Voucher(
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        voucherId: json["voucherId"],
        name: json["name"],
        description: json["description"],
        voucherCode: json["voucherCode"],
        pointToRedeem: json["pointToRedeem"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "voucherId": voucherId,
        "name": name,
        "description": description,
        "voucherCode": voucherCode,
        "pointToRedeem": pointToRedeem,
    };
}
