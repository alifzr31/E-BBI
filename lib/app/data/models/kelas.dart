import 'dart:convert';

Kelas kelasFromJson(String str) => Kelas.fromJson(json.decode(str));

String kelasToJson(Kelas data) => json.encode(data.toJson());

class Kelas {
  int? id;
  int? klsAngka;
  String? klsHuruf;
  DateTime? createdAt;
  DateTime? updatedAt;

  Kelas({
    this.id,
    this.klsAngka,
    this.klsHuruf,
    this.createdAt,
    this.updatedAt,
  });

  factory Kelas.fromJson(Map<String, dynamic> json) => Kelas(
        id: json["id"],
        klsAngka: json["kls_angka"],
        klsHuruf: json["kls_huruf"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kls_angka": klsAngka,
        "kls_huruf": klsHuruf,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
