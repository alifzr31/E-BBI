import 'dart:convert';

Materi materiFromJson(String str) => Materi.fromJson(json.decode(str));

String materiToJson(Materi data) => json.encode(data.toJson());

List<Materi> listMateriFromJson(String str) =>
    List<Materi>.from(json.decode(str).map((x) => Materi.fromJson(x)));

String listMateriToJson(List<Materi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Materi {
  int? id;
  int? guruMatpelId;
  String? judul;
  String? subjudul;
  String? deskripsi;
  String? fileMateri;
  DateTime? createdAt;
  DateTime? updatedAt;

  Materi({
    this.id,
    this.guruMatpelId,
    this.judul,
    this.subjudul,
    this.deskripsi,
    this.fileMateri,
    this.createdAt,
    this.updatedAt,
  });

  factory Materi.fromJson(Map<String, dynamic> json) => Materi(
        id: json["id"],
        guruMatpelId: json["guru_matpel_id"],
        judul: json["judul"],
        subjudul: json["subjudul"],
        deskripsi: json["deskripsi"],
        fileMateri: json["file_materi"],
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
        "file_materi": fileMateri,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
