// To parse this JSON data, do
//
//     final siswa = siswaFromJson(jsonString);

import 'dart:convert';

Siswa siswaFromJson(String str) => Siswa.fromJson(json.decode(str));

String siswaToJson(Siswa data) => json.encode(data.toJson());

List<Siswa> listSiswaFromJson(String str) =>
    List<Siswa>.from(json.decode(str).map((x) => Siswa.fromJson(x)));

String listSiswaToJson(List<Siswa> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Siswa {
  int? id;
  int? kelasId;
  String? nis;
  String? nama;
  String? alamat;
  String? noTelp;
  String? jk;
  DateTime? createdAt;
  DateTime? updatedAt;

  Siswa({
    this.id,
    this.kelasId,
    this.nis,
    this.nama,
    this.alamat,
    this.noTelp,
    this.jk,
    this.createdAt,
    this.updatedAt,
  });

  factory Siswa.fromJson(Map<String, dynamic> json) => Siswa(
        id: json["id"],
        kelasId: json["kelas_id"],
        nis: json["nis"],
        nama: json["nama"],
        alamat: json["alamat"],
        noTelp: json["no_telp"],
        jk: json["jk"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kelas_id": kelasId,
        "nis": nis,
        "nama": nama,
        "alamat": alamat,
        "no_telp": noTelp,
        "jk": jk,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
