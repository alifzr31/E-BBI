import 'dart:convert';

Matpel matpelFromJson(String str) => Matpel.fromJson(json.decode(str));

String matpelToJson(Matpel data) => json.encode(data.toJson());

class Matpel {
  int? id;
  String? namaMatpel;
  String? semester;
  DateTime? createdAt;
  DateTime? updatedAt;

  Matpel({
    this.id,
    this.namaMatpel,
    this.semester,
    this.createdAt,
    this.updatedAt,
  });

  factory Matpel.fromJson(Map<String, dynamic> json) => Matpel(
        id: json["id"],
        namaMatpel: json["nama_matpel"],
        semester: json["semester"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_matpel": namaMatpel,
        "semester": semester,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
