// To parse this JSON data, do
//
//     final paymentDetail = paymentDetailFromJson(jsonString);

import 'dart:convert';

PaymentDetail paymentDetailFromJson(String str) => PaymentDetail.fromJson(json.decode(str));

String paymentDetailToJson(PaymentDetail data) => json.encode(data.toJson());

class PaymentDetail {
    Payment? payment;
    List<PaymentDetailElement>? paymentDetails;

    PaymentDetail({
        this.payment,
        this.paymentDetails,
    });

    PaymentDetail copyWith({
        Payment? payment,
        List<PaymentDetailElement>? paymentDetails,
    }) => 
        PaymentDetail(
            payment: payment ?? this.payment,
            paymentDetails: paymentDetails ?? this.paymentDetails,
        );

    factory PaymentDetail.fromJson(Map<String, dynamic> json) => PaymentDetail(
        payment: json["payment"] == null ? null : Payment.fromJson(json["payment"]),
        paymentDetails: json["paymentDetails"] == null ? [] : List<PaymentDetailElement>.from(json["paymentDetails"]!.map((x) => PaymentDetailElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "payment": payment?.toJson(),
        "paymentDetails": paymentDetails == null ? [] : List<dynamic>.from(paymentDetails!.map((x) => x.toJson())),
    };
}

class Payment {
    double? amountPoint;
    int? status;

    Payment({
        this.amountPoint,
        this.status,
    });

    Payment copyWith({
        double? amountPoint,
        int? status,
    }) => 
        Payment(
            amountPoint: amountPoint ?? this.amountPoint,
            status: status ?? this.status,
        );

    factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        amountPoint: json["amountPoint"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "amountPoint": amountPoint,
        "status": status,
    };
}

class PaymentDetailElement {
    Material? material;
    double? quantity;

    PaymentDetailElement({
        this.material,
        this.quantity,
    });

    PaymentDetailElement copyWith({
        Material? material,
        double? quantity,
    }) => 
        PaymentDetailElement(
            material: material ?? this.material,
            quantity: quantity ?? this.quantity,
        );

    factory PaymentDetailElement.fromJson(Map<String, dynamic> json) => PaymentDetailElement(
        material: json["material"] == null ? null : Material.fromJson(json["material"]),
        quantity: json["quantity"],
    );

    Map<String, dynamic> toJson() => {
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
