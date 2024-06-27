import 'dart:convert';

class ResultResponse {
  List<Datum>? data;
  int? maxPage;

  ResultResponse({
    this.data,
    this.maxPage,
  });

  factory ResultResponse.fromJson(String str) =>
      ResultResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResultResponse.fromMap(Map<String, dynamic> json) => ResultResponse(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
        maxPage: json["maxPage"],
      );

  Map<String, dynamic> toMap() => {
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "maxPage": maxPage,
      };
}

class Datum {
  String? id;
  String? userId;
  String? details;
  DateTime? createdAt;
  int? questionsCount;
  int? questionsQty;
  String? level;

  Datum({
    this.id,
    this.userId,
    this.details,
    this.createdAt,
    this.questionsCount,
    this.questionsQty,
    this.level,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["userId"],
        details: json["details"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        questionsCount: json["questionsCount"],
        questionsQty: json["questionsQty"],
        level: json['level'],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "userId": userId,
        "details": details,
        "createdAt":
            "${createdAt!.year.toString().padLeft(4, '0')}-${createdAt!.month.toString().padLeft(2, '0')}-${createdAt!.day.toString().padLeft(2, '0')}",
        "questionsCount": questionsCount,
        "questionsQty": questionsQty,
      };
}
