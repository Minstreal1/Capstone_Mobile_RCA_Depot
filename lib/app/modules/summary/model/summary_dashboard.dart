// To parse this JSON data, do
//
//     final summaryDashBoard = summaryDashBoardFromJson(jsonString);

import 'dart:convert';

SummaryDashBoard summaryDashBoardFromJson(String str) => SummaryDashBoard.fromJson(json.decode(str));

String summaryDashBoardToJson(SummaryDashBoard data) => json.encode(data.toJson());

class SummaryDashBoard {
    List<DataAnalyze>? dataAnalyze;
    int? ranking;

    SummaryDashBoard({
        this.dataAnalyze,
        this.ranking,
    });

    SummaryDashBoard copyWith({
        List<DataAnalyze>? dataAnalyze,
        int? ranking,
    }) => 
        SummaryDashBoard(
            dataAnalyze: dataAnalyze ?? this.dataAnalyze,
            ranking: ranking ?? this.ranking,
        );

    factory SummaryDashBoard.fromJson(Map<String, dynamic> json) => SummaryDashBoard(
        dataAnalyze: json["dataAnalyze"] == null ? [] : List<DataAnalyze>.from(json["dataAnalyze"]!.map((x) => DataAnalyze.fromJson(x))),
        ranking: json["ranking"],
    );

    Map<String, dynamic> toJson() => {
        "dataAnalyze": dataAnalyze == null ? [] : List<dynamic>.from(dataAnalyze!.map((x) => x.toJson())),
        "ranking": ranking,
    };
}

class DataAnalyze {
    double? totalWeight;
    String? materialTypeName;

    DataAnalyze({
        this.totalWeight,
        this.materialTypeName,
    });

    DataAnalyze copyWith({
        double? totalWeight,
        String? materialTypeName,
    }) => 
        DataAnalyze(
            totalWeight: totalWeight ?? this.totalWeight,
            materialTypeName: materialTypeName ?? this.materialTypeName,
        );

    factory DataAnalyze.fromJson(Map<String, dynamic> json) => DataAnalyze(
        totalWeight: json["totalWeight"].toDouble(),
        materialTypeName: json["materialTypeName"],
    );

    Map<String, dynamic> toJson() => {
        "totalWeight": totalWeight,
        "materialTypeName": materialTypeName,
    };
}
