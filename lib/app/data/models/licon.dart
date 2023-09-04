// To parse this JSON data, do
//
//     final licon = liconFromJson(jsonString);

import 'dart:convert';

Licon liconFromJson(String str) => Licon.fromJson(json.decode(str));

String liconToJson(Licon data) => json.encode(data.toJson());

class Licon {
  int? id;
  int? guruMatpelId;
  String? judul;
  DateTime? startDate;
  dynamic endDate;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Licon({
    this.id,
    this.guruMatpelId,
    this.judul,
    this.startDate,
    this.endDate,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Licon.fromJson(Map<String, dynamic> json) => Licon(
        id: json["id"],
        guruMatpelId: json["guru_matpel_id"],
        judul: json["judul"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate: json["end_date"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "guru_matpel_id": guruMatpelId,
        "judul": judul,
        "start_date": startDate?.toIso8601String(),
        "end_date": endDate,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
