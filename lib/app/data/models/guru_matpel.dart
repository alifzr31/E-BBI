// To parse this JSON data, do
//
//     final guruMatpel = guruMatpelFromJson(jsonString);

import 'dart:convert';

import 'package:elearning/app/data/models/materi.dart';

GuruMatpel guruMatpelFromJson(String str) =>
    GuruMatpel.fromJson(json.decode(str));

String guruMatpelToJson(GuruMatpel data) => json.encode(data.toJson());

List<GuruMatpel> listGuruMatpelFromJson(String str) =>
    List<GuruMatpel>.from(json.decode(str).map((x) => GuruMatpel.fromJson(x)));

String listGuruMatpelToJson(List<GuruMatpel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GuruMatpel {
  int? id;
  int? kelasId;
  int? guruId;
  int? matpelId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Materi? materi;

  GuruMatpel({
    this.id,
    this.kelasId,
    this.guruId,
    this.matpelId,
    this.createdAt,
    this.updatedAt,
    this.materi,
  });

  factory GuruMatpel.fromJson(Map<String, dynamic> json) => GuruMatpel(
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
        materi: json["materi"] == null ? null : Materi.fromJson(json["materi"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kelas_id": kelasId,
        "guru_id": guruId,
        "matpel_id": matpelId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "materi": materi?.toJson(),
      };
}

// import 'dart:convert';

// import 'package:elearning/app/data/models/materi.dart';

// MateriGuru materiGuruFromJson(String str) =>
//     MateriGuru.fromJson(json.decode(str));

// String materiGuruToJson(MateriGuru data) => json.encode(data.toJson());

// class MateriGuru {
//   int? id;
//   int? kelasId;
//   int? guruId;
//   int? matpelId;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   Materi? materi;
//   // Matpel? matpel;
//   // List<Materi>? materi;

//   MateriGuru({
//     this.id,
//     this.kelasId,
//     this.guruId,
//     this.matpelId,
//     this.createdAt,
//     this.updatedAt,
//     // this.matpel,
//     this.materi,
//   });

//   factory MateriGuru.fromJson(Map<String, dynamic> json) => MateriGuru(
//         id: json["id"],
//         kelasId: json["kelas_id"],
//         guruId: json["guru_id"],
//         matpelId: json["matpel_id"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//         materi: json["materi"] == null ? null : Materi.fromJson(json["materi"]),
//         // matpel: json["matpel"] == null ? null : Matpel.fromJson(json["matpel"]),
//         // materi: json["materi"] == null
//         //     ? []
//         //     : List<Materi>.from(json["materi"]!.map((x) => Materi.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "kelas_id": kelasId,
//         "guru_id": guruId,
//         "matpel_id": matpelId,
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//         "materi": materi?.toJson(),
//         // "matpel": matpel?.toJson(),
//         // "materi": materi == null
//         //     ? []
//         //     : List<dynamic>.from(materi!.map((x) => x.toJson())),
//       };
// }
