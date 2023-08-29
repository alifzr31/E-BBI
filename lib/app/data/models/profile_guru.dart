// To parse this JSON data, do
//
//     final profileGuru = profileGuruFromJson(jsonString);

import 'dart:convert';

ProfileGuru profileGuruFromJson(String str) =>
    ProfileGuru.fromJson(json.decode(str));

String profileGuruToJson(ProfileGuru data) => json.encode(data.toJson());

class ProfileGuru {
  int? id;
  String? nip;
  String? nama;
  String? alamat;
  String? noTelp;
  String? jk;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;

  ProfileGuru({
    this.id,
    this.nip,
    this.nama,
    this.alamat,
    this.noTelp,
    this.jk,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory ProfileGuru.fromJson(Map<String, dynamic> json) => ProfileGuru(
        id: json["id"],
        nip: json["nip"],
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
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nip": nip,
        "nama": nama,
        "alamat": alamat,
        "no_telp": noTelp,
        "jk": jk,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user": user?.toJson(),
      };
}

class User {
  int? id;
  dynamic siswaId;
  int? guruId;
  String? username;
  String? role;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.id,
    this.siswaId,
    this.guruId,
    this.username,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        siswaId: json["siswa_id"],
        guruId: json["guru_id"],
        username: json["username"],
        role: json["role"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "siswa_id": siswaId,
        "guru_id": guruId,
        "username": username,
        "role": role,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
