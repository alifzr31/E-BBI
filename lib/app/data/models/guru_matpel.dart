// To parse this JSON data, do
//
//     final guruMatpel = guruMatpelFromJson(jsonString);

import 'dart:convert';

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
  Guru? guru;
  Matpel? matpel;
  Kelas? kelas;
  List<Materi>? materi;
  List<Tugas>? tugas;

  GuruMatpel({
    this.id,
    this.kelasId,
    this.guruId,
    this.matpelId,
    this.createdAt,
    this.updatedAt,
    this.guru,
    this.matpel,
    this.kelas,
    this.materi,
    this.tugas,
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
        guru: json["guru"] == null ? null : Guru.fromJson(json["guru"]),
        matpel: json["matpel"] == null ? null : Matpel.fromJson(json["matpel"]),
        kelas: json["kelas"] == null ? null : Kelas.fromJson(json["kelas"]),
        materi: json["materi"] == null
            ? []
            : List<Materi>.from(json["materi"]!.map((x) => Materi.fromJson(x))),
        tugas: json["tugas"] == null
            ? []
            : List<Tugas>.from(json["tugas"]!.map((x) => Tugas.fromJson(x))),
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
        "kelas": kelas?.toJson(),
        "materi": materi == null
            ? []
            : List<dynamic>.from(materi!.map((x) => x.toJson())),
        "tugas": tugas == null
            ? []
            : List<dynamic>.from(tugas!.map((x) => x.toJson())),
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
  Tugassiswasatuan? tugassiswasatuan;

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
    this.tugassiswasatuan,
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
        tugassiswasatuan: json["tugassiswasatuan"] == null
            ? null
            : Tugassiswasatuan.fromJson(json["tugassiswasatuan"]),
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
        "tugassiswasatuan": tugassiswasatuan?.toJson(),
      };
}

class Tugassiswasatuan {
  int? id;
  int? tugasId;
  int? siswaId;
  String? nilai;
  String? fileTugasSiswa;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Tugassiswasatuan({
    this.id,
    this.tugasId,
    this.siswaId,
    this.nilai,
    this.fileTugasSiswa,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Tugassiswasatuan.fromJson(Map<String, dynamic> json) =>
      Tugassiswasatuan(
        id: json["id"],
        tugasId: json["tugas_id"],
        siswaId: json["siswa_id"],
        nilai: json["nilai"],
        fileTugasSiswa: json["file_tugas_siswa"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
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
      };
}
