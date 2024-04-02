import "package:cloud_firestore/cloud_firestore.dart";

class LaporanKegiatanDesa {
  final String id;
  final String desaId;
  final DateTime date;
  final String namaKegiatan;
  final String penanggungJawabKegiatan;
  final String hasilKegiatan;
  final String kendala;
  final String imageUrl;

  LaporanKegiatanDesa({
    required this.id,
    required this.desaId,
    required this.namaKegiatan,
    required this.penanggungJawabKegiatan,
    required this.hasilKegiatan,
    required this.kendala,
    required this.date,
    required this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "villageId": desaId,
      "namaKegiatan": namaKegiatan,
      "penanggungJawabKegiatan": penanggungJawabKegiatan,
      "kendala": kendala,
      "hasilKegiatan": hasilKegiatan,
      "date": Timestamp.fromDate(date),
      "imageUrl": imageUrl,
    };
  }

  factory LaporanKegiatanDesa.fromJson(Map<String, dynamic> json) {
    print("$json");

    return LaporanKegiatanDesa(
      id: json["id"],
      desaId: json["villageId"],
      namaKegiatan: json["namaKegiatan"],
      penanggungJawabKegiatan: json["penanggungJawabKegiatan"],
      hasilKegiatan: json["kendala"],
      kendala: json["hasilKegiatan"],
      date: json["date"].toDate(),
      imageUrl: json["imageUrl"],
    );
  }
}
