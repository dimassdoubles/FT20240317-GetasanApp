import 'package:cloud_firestore/cloud_firestore.dart';

class LaporanKemiskinan {
  final String id;
  final String desaId;
  final DateTime date;
  final String noKk;
  final String namaKepalaKeluarga;
  final String pekerjaan;
  final String alamat;
  final String titikKoordinat;
  final String gambarDepanUrl;
  final String gambarBelakangUrl;

  LaporanKemiskinan({
    required this.id,
    required this.desaId,
    required this.date,
    required this.noKk,
    required this.namaKepalaKeluarga,
    required this.pekerjaan,
    required this.alamat,
    required this.titikKoordinat,
    required this.gambarDepanUrl,
    required this.gambarBelakangUrl,
  });

  factory LaporanKemiskinan.fromJson(Map<String, dynamic> json) {
    return LaporanKemiskinan(
      id: json["id"],
      desaId: json["villageId"],
      date: json["date"].toDate(),
      noKk: json["noKk"],
      namaKepalaKeluarga: json["namaKepalaKeluarga"],
      pekerjaan: json["pekerjaan"],
      alamat: json["alamat"],
      titikKoordinat: json["titikKoordinat"],
      gambarDepanUrl: json["gambarDepanUrl"],
      gambarBelakangUrl: json["gambarBelakangUrl"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'villageId': desaId,
      'date': Timestamp.fromDate(date),
      "noKk": noKk,
      "namaKepalaKeluarga": namaKepalaKeluarga,
      "pekerjaan": pekerjaan,
      "alamat": alamat,
      "titikKoordinat": titikKoordinat,
      "gambarDepanUrl": gambarDepanUrl,
      "gambarBelakangUrl": gambarBelakangUrl,
    };
  }
}
