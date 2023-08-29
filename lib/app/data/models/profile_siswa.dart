// To parse this JSON data, do
//
//     final profileSiswa = profileSiswaFromJson(jsonString);

import 'dart:convert';

ProfileSiswa profileSiswaFromJson(String str) =>
    ProfileSiswa.fromJson(json.decode(str));

String profileSiswaToJson(ProfileSiswa data) => json.encode(data.toJson());

class ProfileSiswa {
  int? id;
  int? kelasId;
  String? nis;
  String? nama;
  String? alamat;
  String? noTelp;
  String? jk;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;
  Kelas? kelas;

  ProfileSiswa({
    this.id,
    this.kelasId,
    this.nis,
    this.nama,
    this.alamat,
    this.noTelp,
    this.jk,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.kelas,
  });

  factory ProfileSiswa.fromJson(Map<String, dynamic> json) => ProfileSiswa(
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
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        kelas: json["kelas"] == null ? null : Kelas.fromJson(json["kelas"]),
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
        "user": user?.toJson(),
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

class User {
  int? id;
  int? siswaId;
  dynamic guruId;
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
