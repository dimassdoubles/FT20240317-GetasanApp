import 'package:cloud_firestore/cloud_firestore.dart';

class LaporanKelahiran {
  final String id;
  final String desaId;

  // data anak
  final String noKk;
  final String namaBayi;
  final String anakKe;
  final String jenisKelamin;
  final String jamKelahiran;
  final String tempatLahir;
  final DateTime tanggalLahir;

  // data ayah
  final String namaAyah;
  final String pekerjaanAyah;
  final String alamatRumahAyah;
  final String nikAyah;
  final String noHpAyah;
  final String emailAyah;

  // data ibu
  final String namaIbu;
  final String pekerjaanIbu;
  final String alamatRumahIbu;
  final String nikIbu;
  final String emailIbu;

  LaporanKelahiran({
    required this.id,
    required this.desaId,
    required this.noKk,
    required this.namaBayi,
    required this.anakKe,
    required this.jenisKelamin,
    required this.jamKelahiran,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.namaAyah,
    required this.pekerjaanAyah,
    required this.alamatRumahAyah,
    required this.nikAyah,
    required this.noHpAyah,
    required this.emailAyah,
    required this.namaIbu,
    required this.pekerjaanIbu,
    required this.alamatRumahIbu,
    required this.nikIbu,
    required this.emailIbu,
  });

  factory LaporanKelahiran.fromJson(Map<String, dynamic> json) {
    return LaporanKelahiran(
      id: json["id"],
      desaId: json["desaId"],
      noKk: json["noKk"],
      namaBayi: json["namaBayi"],
      anakKe: json["anakKe"],
      jenisKelamin: json["jenisKelamin"],
      jamKelahiran: json["jamKelahiran"],
      tempatLahir: json["tempatLahir"],
      tanggalLahir: json["tanggalLahir"].toDate(),
      namaAyah: json["namaAyah"],
      pekerjaanAyah: json["pekerjaanAyah"],
      alamatRumahAyah: json["alamatRumahAyah"],
      nikAyah: json["nikAyah"],
      noHpAyah: json["noHpAyah"],
      emailAyah: json["emailAyah"],
      namaIbu: json["namaIbu"],
      pekerjaanIbu: json["pekerjaanIbu"],
      alamatRumahIbu: json["alamatRumahIbu"],
      nikIbu: json["nikIbu"],
      emailIbu: json["emailIbu"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'villageId': desaId,
      "noKk": noKk,
      "namaBayi": namaBayi,
      "anakKe": anakKe,
      "jenisKelamin": jenisKelamin,
      "jamKelahiran": jamKelahiran,
      "tempatLahir": tempatLahir,
      "tanggalLahir": Timestamp.fromDate(tanggalLahir),
      "namaAyah": namaAyah,
      "pekerjaanAyah": pekerjaanAyah,
      "alamatRumahAyah": alamatRumahAyah,
      "nikAyah": nikAyah,
      "noHpAyah": noHpAyah,
      "emailAyah": emailAyah,
      "namaIbu": namaIbu,
      "pekerjaanIbu": pekerjaanIbu,
      "alamatRumahIbu": alamatRumahIbu,
      "nikIbu": nikIbu,
      "emailIbu": emailIbu,
    };
  }
}
