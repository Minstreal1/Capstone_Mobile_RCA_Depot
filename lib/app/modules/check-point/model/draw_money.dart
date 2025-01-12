// To parse this JSON data, do
//
//     final drawMoney = drawMoneyFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DrawMoneyPayload drawMoneyFromJson(String str) => DrawMoneyPayload.fromJson(json.decode(str));

String drawMoneyToJson(DrawMoneyPayload data) => json.encode(data.toJson());

class DrawMoneyPayload {
    double numberPoint;
    String bankName;
    String bankAccountName;
    String bankAccountNumber;

    DrawMoneyPayload({
        required this.numberPoint,
        required this.bankName,
        required this.bankAccountName,
        required this.bankAccountNumber,
    });

    DrawMoneyPayload copyWith({
        double? numberPoint,
        String? bankName,
        String? bankAccountName,
        String? bankAccountNumber,
    }) => 
        DrawMoneyPayload(
            numberPoint: numberPoint ?? this.numberPoint,
            bankName: bankName ?? this.bankName,
            bankAccountName: bankAccountName ?? this.bankAccountName,
            bankAccountNumber: bankAccountNumber ?? this.bankAccountNumber,
        );

    factory DrawMoneyPayload.fromJson(Map<String, dynamic> json) => DrawMoneyPayload(
        numberPoint: json["numberPoint"],
        bankName: json["bankName"],
        bankAccountName: json["bankAccountName"],
        bankAccountNumber: json["bankAccountNumber"],
    );

    Map<String, dynamic> toJson() => {
        "numberPoint": numberPoint,
        "bankName": bankName,
        "bankAccountName": bankAccountName,
        "bankAccountNumber": bankAccountNumber,
    };
}
