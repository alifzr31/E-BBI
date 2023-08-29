// To parse this JSON data, do
//
//     final matpelGuru = matpelGuruFromJson(jsonString);

import 'dart:convert';

MatpelGuru matpelGuruFromJson(String str) =>
    MatpelGuru.fromJson(json.decode(str));

String matpelGuruToJson(MatpelGuru data) => json.encode(data.toJson());

List<MatpelGuru> listMatpelGuruFromJson(String str) =>
    List<MatpelGuru>.from(json.decode(str).map((x) => MatpelGuru.fromJson(x)));

String listMatpelGuruToJson(List<MatpelGuru> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MatpelGuru {
  int? id;
  int? kelasId;
  int? guruId;
  int? matpelId;
  DateTime? createdAt;
  DateTime? updatedAt;
  MatpelClass? matpel;
  Kelas? kelas;

  MatpelGuru({
    this.id,
    this.kelasId,
    this.guruId,
    this.matpelId,
    this.createdAt,
    this.updatedAt,
    this.matpel,
    this.kelas,
  });

  factory MatpelGuru.fromJson(Map<String, dynamic> json) => MatpelGuru(
        id: json["id"],
        kelasId: json["kelas_id"],
        guruId: json["guru_id"],
        matpelId: json["matpel_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        matpel: json["matpel"] == null ? null : MatpelClass.fromJson(json["matpel"]),
        kelas: json["kelas"] == null ? null : Kelas.fromJson(json["kelas"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kelas_id": kelasId,
        "guru_id": guruId,
        "matpel_id": matpelId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "matpel": matpel?.toJson(),
        "kelas": kelas?.toJson(),
      };
}

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

class MatpelClass {
  int? id;
  String? namaMatpel;
  String? semester;
  DateTime? createdAt;
  DateTime? updatedAt;

  MatpelClass({
    this.id,
    this.namaMatpel,
    this.semester,
    this.createdAt,
    this.updatedAt,
  });

  factory MatpelClass.fromJson(Map<String, dynamic> json) => MatpelClass(
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
