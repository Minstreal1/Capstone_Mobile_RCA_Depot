// To parse this JSON data, do
//
//     final createPaymentPayload = createPaymentPayloadFromJson(jsonString);

import 'dart:convert';

import '../../app/model/material_type.dart';



String createPaymentPayloadToJson(CreatePaymentPayload data) => json.encode(data.toJson());

class CreatePaymentPayload {
    int? collectorId;
    List<MaterialTypeData>? materials;

    CreatePaymentPayload({
        this.collectorId,
        this.materials,
    });

    CreatePaymentPayload copyWith({
        int? scheduleId,
        List<MaterialTypeData>? materials,
    }) => 
        CreatePaymentPayload(
            collectorId: scheduleId ?? this.collectorId,
            materials: materials ?? this.materials,
        );

   

    Map<String, dynamic> toJson() => {
        "collectorId": collectorId,
        "materials": materials == null ? [] : List<dynamic>.from(materials!.map((x) => x.toJsonCreatePayment())),
    };
}
