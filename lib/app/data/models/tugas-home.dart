// To parse this JSON data, do
//
//     final tugasHome = tugasHomeFromJson(jsonString);

import 'dart:convert';

TugasHome tugasHomeFromJson(String str) => TugasHome.fromJson(json.decode(str));

String tugasHomeToJson(TugasHome data) => json.encode(data.toJson());

List<TugasHome> listTugasHomeFromJson(String str) =>
    List<TugasHome>.from(json.decode(str).map((x) => TugasHome.fromJson(x)));

String listTugasHomeToJson(List<TugasHome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TugasHome {
  int? id;
  int? guruMatpelId;
  int? kelasId;
  String? judul;
  String? subjudul;
  String? deskripsi;
  DateTime? startDate;
  DateTime? endDate;
  String? fileTugas;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic tugassiswasatuan;
  Gurumatpel? gurumatpel;

  TugasHome({
    this.id,
    this.guruMatpelId,
    this.kelasId,
    this.judul,
    this.subjudul,
    this.deskripsi,
    this.startDate,
    this.endDate,
    this.fileTugas,
    this.createdAt,
    this.updatedAt,
    this.tugassiswasatuan,
    this.gurumatpel,
  });

  factory TugasHome.fromJson(Map<String, dynamic> json) => TugasHome(
        id: json["id"],
        guruMatpelId: json["guru_matpel_id"],
        kelasId: json["kelas_id"],
        judul: json["judul"],
        subjudul: json["subjudul"],
        deskripsi: json["deskripsi"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        fileTugas: json["file_tugas"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        tugassiswasatuan: json["tugassiswasatuan"],
        gurumatpel: json["gurumatpel"] == null
            ? null
            : Gurumatpel.fromJson(json["gurumatpel"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "guru_matpel_id": guruMatpelId,
        "kelas_id": kelasId,
        "judul": judul,
        "subjudul": subjudul,
        "deskripsi": deskripsi,
        "start_date": startDate?.toIso8601String(),
        "end_date": endDate?.toIso8601String(),
        "file_tugas": fileTugas,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "tugassiswasatuan": tugassiswasatuan,
        "gurumatpel": gurumatpel?.toJson(),
      };
}

class Gurumatpel {
  int? id;
  int? kelasId;
  int? guruId;
  int? matpelId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Guru? guru;
  Matpel? matpel;

  Gurumatpel({
    this.id,
    this.kelasId,
    this.guruId,
    this.matpelId,
    this.createdAt,
    this.updatedAt,
    this.guru,
    this.matpel,
  });

  factory Gurumatpel.fromJson(Map<String, dynamic> json) => Gurumatpel(
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
        guru: json["guru"] == null ? null : Guru.fromJson(json["guru"]),
        matpel: json["matpel"] == null ? null : Matpel.fromJson(json["matpel"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kelas_id": kelasId,
        "guru_id": guruId,
        "matpel_id": matpelId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "guru": guru?.toJson(),
        "matpel": matpel?.toJson(),
      };
}

class Guru {
  int? id;
  String? nip;
  String? nama;
  String? alamat;
  String? noTelp;
  String? jk;
  DateTime? createdAt;
  DateTime? updatedAt;

  Guru({
    this.id,
    this.nip,
    this.nama,
    this.alamat,
    this.noTelp,
    this.jk,
    this.createdAt,
    this.updatedAt,
  });

  factory Guru.fromJson(Map<String, dynamic> json) => Guru(
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
      };
}

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
