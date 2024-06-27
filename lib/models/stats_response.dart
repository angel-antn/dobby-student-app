import 'dart:convert';

class StatsResponse {
  Day? day1;
  Day? day2;
  Day? day3;
  Day? day4;
  Day? day5;
  Day? day6;
  Day? day7;

  StatsResponse({
    this.day1,
    this.day2,
    this.day3,
    this.day4,
    this.day5,
    this.day6,
    this.day7,
  });

  factory StatsResponse.fromJson(String str) =>
      StatsResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StatsResponse.fromMap(Map<String, dynamic> json) => StatsResponse(
        day1: json["day_1"] == null ? null : Day.fromMap(json["day_1"]),
        day2: json["day_2"] == null ? null : Day.fromMap(json["day_2"]),
        day3: json["day_3"] == null ? null : Day.fromMap(json["day_3"]),
        day4: json["day_4"] == null ? null : Day.fromMap(json["day_4"]),
        day5: json["day_5"] == null ? null : Day.fromMap(json["day_5"]),
        day6: json["day_6"] == null ? null : Day.fromMap(json["day_6"]),
        day7: json["day_7"] == null ? null : Day.fromMap(json["day_7"]),
      );

  Map<String, dynamic> toMap() => {
        "day_1": day1?.toMap(),
        "day_2": day2?.toMap(),
        "day_3": day3?.toMap(),
        "day_4": day4?.toMap(),
        "day_5": day5?.toMap(),
        "day_6": day6?.toMap(),
        "day_7": day7?.toMap(),
      };
}

class Day {
  DateTime? day;
  dynamic count;

  Day({
    this.day,
    this.count,
  });

  factory Day.fromJson(String str) => Day.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Day.fromMap(Map<String, dynamic> json) => Day(
        day: json["day"] == null ? null : DateTime.parse(json["day"]),
        count: json["count"],
      );

  Map<String, dynamic> toMap() => {
        "day": day?.toIso8601String(),
        "count": count,
      };
}
