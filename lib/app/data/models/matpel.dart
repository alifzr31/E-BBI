// To parse this JSON data, do
//
//     final matpel = matpelFromJson(jsonString);

import 'dart:convert';

Matpel matpelFromJson(String str) => Matpel.fromJson(json.decode(str));

String matpelToJson(Matpel data) => json.encode(data.toJson());

List<Matpel> listMatpelFromJson(String str) =>
    List<Matpel>.from(json.decode(str).map((x) => Matpel.fromJson(x)));

String listMatpelToJson(List<Matpel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Matpel {
    int? id;
    int? kelasId;
    int? guruId;
    int? matpelId;
    DateTime? createdAt;
    DateTime? updatedAt;
    MatpelClass? matpel;

    Matpel({
        this.id,
        this.kelasId,
        this.guruId,
        this.matpelId,
        this.createdAt,
        this.updatedAt,
        this.matpel,
    });

    factory Matpel.fromJson(Map<String, dynamic> json) => Matpel(
        id: json["id"],
        kelasId: json["kelas_id"],
        guruId: json["guru_id"],
        matpelId: json["matpel_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        matpel: json["matpel"] == null ? null : MatpelClass.fromJson(json["matpel"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "kelas_id": kelasId,
        "guru_id": guruId,
        "matpel_id": matpelId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "matpel": matpel?.toJson(),
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
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama_matpel": namaMatpel,
        "semester": semester,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
