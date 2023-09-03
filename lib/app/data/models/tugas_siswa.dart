import 'dart:convert';

import 'package:elearning/app/data/models/siswa.dart';

TugasSiswa tugasSiswaFromJson(String str) => TugasSiswa.fromJson(json.decode(str));

String tugasSiswaToJson(TugasSiswa data) => json.encode(data.toJson());

List<TugasSiswa> listTugasSiswaFromJson(String str) =>
    List<TugasSiswa>.from(json.decode(str).map((x) => TugasSiswa.fromJson(x)));

String listTugasSiswaToJson(List<TugasSiswa> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TugasSiswa {
    int? id;
    int? tugasId;
    int? siswaId;
    String? nilai;
    String? fileTugasSiswa;
    String? status;
    DateTime? createdAt;
    DateTime? updatedAt;
    Siswa? siswa;

    TugasSiswa({
        this.id,
        this.tugasId,
        this.siswaId,
        this.nilai,
        this.fileTugasSiswa,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.siswa,
    });

    factory TugasSiswa.fromJson(Map<String, dynamic> json) => TugasSiswa(
        id: json["id"],
        tugasId: json["tugas_id"],
        siswaId: json["siswa_id"],
        nilai: json["nilai"],
        fileTugasSiswa: json["file_tugas_siswa"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        siswa: json["siswa"] == null
            ? null
            : Siswa.fromJson(json["siswa"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tugas_id": tugasId,
        "siswa_id": siswaId,
        "nilai": nilai,
        "file_tugas_siswa": fileTugasSiswa,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "siswa": siswa?.toJson(),
    };
}
