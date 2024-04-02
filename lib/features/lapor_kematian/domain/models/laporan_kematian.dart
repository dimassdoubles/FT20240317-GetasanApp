import "package:cloud_firestore/cloud_firestore.dart";

class LaporanKematian {
  final String id;
  final String desaId;
  final String nik;
  final String alamatRumah;
  final String namaLengkap;
  final String tempatLahir;
  final DateTime tanggalLahir;
  final String tempatMeninggal;
  final DateTime tanggalMeninggal;
  final String namaPasanganDitinggal;
  final String namaAnakDitinggal;
  final String statusKawin;

  LaporanKematian({
    required this.id,
    required this.desaId,
    required this.nik,
    required this.alamatRumah,
    required this.namaLengkap,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.tempatMeninggal,
    required this.tanggalMeninggal,
    required this.namaPasanganDitinggal,
    required this.namaAnakDitinggal,
    required this.statusKawin,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "villageId": desaId,
      "nik": nik,
      "alamatRumah": alamatRumah,
      "namaLengkap": namaLengkap,
      "tempatLahir": tempatLahir,
      "tanggalLahir": Timestamp.fromDate(tanggalLahir),
      "tempatMeninggal": tempatMeninggal,
      "tanggalMeninggal": Timestamp.fromDate(tanggalMeninggal),
      "namaPasanganDitinggal": namaPasanganDitinggal,
      "namaAnakDitinggal": namaAnakDitinggal,
      "statusKawin": statusKawin,
    };
  }

  factory LaporanKematian.fromJson(Map<String, dynamic> json) {
    return LaporanKematian(
      id: json["id"],
      desaId: json["villageId"],
      nik: json["nik"],
      alamatRumah: json["alamatRumah"],
      namaLengkap: json["namaLengkap"],
      tempatLahir: json["tempatLahir"],
      tanggalLahir: json["tanggalLahir"].toDate(),
      tempatMeninggal: json["tempatMeninggal"],
      tanggalMeninggal: json["tanggalMeninggal"].toDate(),
      namaPasanganDitinggal: json["namaPasanganDitinggal"],
      namaAnakDitinggal: json["namaAnakDitinggal"],
      statusKawin: json["statusKawin"],
    );
  }
}
