import 'dart:convert';

class StudentResponse {
  List<Datum>? data;
  int? maxPage;

  StudentResponse({
    this.data,
    this.maxPage,
  });

  factory StudentResponse.fromJson(String str) =>
      StudentResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StudentResponse.fromMap(Map<String, dynamic> json) => StudentResponse(
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
  String? name;
  String? lastname;
  String? email;
  bool? isActive;

  Datum({
    this.id,
    this.name,
    this.lastname,
    this.email,
    this.isActive,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        isActive: json["isActive"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "lastname": lastname,
        "email": email,
        "isActive": isActive,
      };
}
