// To parse this JSON data, do
//
//     final tugas = tugasFromJson(jsonString);

import 'dart:convert';

Tugas tugasFromJson(String str) => Tugas.fromJson(json.decode(str));

String tugasToJson(Tugas data) => json.encode(data.toJson());

List<Tugas> listTugasFromJson(String str) =>
    List<Tugas>.from(json.decode(str).map((x) => Tugas.fromJson(x)));

String listTugasToJson(List<Tugas> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tugas {
  int? id;
  int? guruMatpelId;
  int? siswaId;
  String? judul;
  String? subjudul;
  String? deskripsi;
  DateTime? startDate;
  DateTime? endDate;
  dynamic nilai;
  String? fileTugas;
  String? fileTugasSiswa;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  Siswa? siswa;

  Tugas({
    this.id,
    this.guruMatpelId,
    this.siswaId,
    this.judul,
    this.subjudul,
    this.deskripsi,
    this.startDate,
    this.endDate,
    this.nilai,
    this.fileTugas,
    this.fileTugasSiswa,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.siswa,
  });

  factory Tugas.fromJson(Map<String, dynamic> json) => Tugas(
        id: json["id"],
        guruMatpelId: json["guru_matpel_id"],
        siswaId: json["siswa_id"],
        judul: json["judul"],
        subjudul: json["subjudul"],
        deskripsi: json["deskripsi"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        nilai: json["nilai"],
        fileTugas: json["file_tugas"],
        fileTugasSiswa: json["file_tugas_siswa"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        siswa: json["siswa"] == null ? null : Siswa.fromJson(json["siswa"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "guru_matpel_id": guruMatpelId,
        "siswa_id": siswaId,
        "judul": judul,
        "subjudul": subjudul,
        "deskripsi": deskripsi,
        "start_date": startDate?.toIso8601String(),
        "end_date": endDate?.toIso8601String(),
        "nilai": nilai,
        "file_tugas": fileTugas,
        "file_tugas_siswa": fileTugasSiswa,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "siswa": siswa?.toJson(),
      };
}

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
