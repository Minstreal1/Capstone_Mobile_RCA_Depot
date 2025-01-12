// To parse this JSON data, do
//
//     final historyWithDraw = historyWithDrawFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

HistoryWithDraw historyWithDrawFromJson(String str) => HistoryWithDraw.fromJson(json.decode(str));

String historyWithDrawToJson(HistoryWithDraw data) => json.encode(data.toJson());

class HistoryWithDraw {
    DateTime createdAt;
    int drawMoneyId;
    double numberPoint;
    double amount;
    String status;
    String orderCode;
    String bankName;
    String bankAccountName;
    String bankAccountNumber;

    HistoryWithDraw({
        required this.createdAt,
        required this.drawMoneyId,
        required this.numberPoint,
        required this.amount,
        required this.status,
        required this.orderCode,
        required this.bankName,
        required this.bankAccountName,
        required this.bankAccountNumber,
    });

    HistoryWithDraw copyWith({
        DateTime? createdAt,
        int? drawMoneyId,
        double? numberPoint,
        double? amount,
        String? status,
        String? orderCode,
        String? bankName,
        String? bankAccountName,
        String? bankAccountNumber,
    }) => 
        HistoryWithDraw(
            createdAt: createdAt ?? this.createdAt,
            drawMoneyId: drawMoneyId ?? this.drawMoneyId,
            numberPoint: numberPoint ?? this.numberPoint,
            amount: amount ?? this.amount,
            status: status ?? this.status,
            orderCode: orderCode ?? this.orderCode,
            bankName: bankName ?? this.bankName,
            bankAccountName: bankAccountName ?? this.bankAccountName,
            bankAccountNumber: bankAccountNumber ?? this.bankAccountNumber,
        );

    factory HistoryWithDraw.fromJson(Map<String, dynamic> json) => HistoryWithDraw(
        createdAt: DateTime.parse(json["createdAt"]),
        drawMoneyId: json["drawMoneyId"],
        numberPoint: json["numberPoint"]?.toDouble(),
        amount: json["amount"]?.toDouble(),
        status: json["status"],
        orderCode: json["orderCode"],
        bankName: json["bankName"],
        bankAccountName: json["bankAccountName"],
        bankAccountNumber: json["bankAccountNumber"],
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "drawMoneyId": drawMoneyId,
        "numberPoint": numberPoint,
        "amount": amount,
        "status": status,
        "orderCode": orderCode,
        "bankName": bankName,
        "bankAccountName": bankAccountName,
        "bankAccountNumber": bankAccountNumber,
    };
}
