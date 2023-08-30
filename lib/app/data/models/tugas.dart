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
  String? judul;
  String? subjudul;
  String? deskripsi;
  DateTime? startDate;
  DateTime? endDate;
  String? fileTugas;
  DateTime? createdAt;
  DateTime? updatedAt;

  Tugas({
    this.id,
    this.guruMatpelId,
    this.judul,
    this.subjudul,
    this.deskripsi,
    this.startDate,
    this.endDate,
    this.fileTugas,
    this.createdAt,
    this.updatedAt,
  });

  factory Tugas.fromJson(Map<String, dynamic> json) => Tugas(
        id: json["id"],
        guruMatpelId: json["guru_matpel_id"],
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
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "guru_matpel_id": guruMatpelId,
        "judul": judul,
        "subjudul": subjudul,
        "deskripsi": deskripsi,
        "start_date": startDate?.toIso8601String(),
        "end_date": endDate?.toIso8601String(),
        "file_tugas": fileTugas,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
