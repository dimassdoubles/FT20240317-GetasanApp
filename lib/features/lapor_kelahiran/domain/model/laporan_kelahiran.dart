import 'package:cloud_firestore/cloud_firestore.dart';

class LaporanKelahiran {
  final String id;
  final String desaId;

  // data anak
  final String noKk;
  final String namaBayi;
  final String anakKe;
  final String jenisKelamin;
  final int jamKelahiran;
  final int menitKelahiran;
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
  final String noHpIbu;
  final String emailIbu;

  LaporanKelahiran({
    this.id = "-",
    this.noHpIbu = "-",
    this.desaId = "-",
    this.noKk = "-",
    this.namaBayi = "-",
    this.anakKe = "-",
    this.jenisKelamin = "-",
    this.jamKelahiran = -1,
    this.menitKelahiran = -1,
    this.tempatLahir = "-",
    required this.tanggalLahir,
    this.namaAyah = "-",
    this.pekerjaanAyah = "-",
    this.alamatRumahAyah = "-",
    this.nikAyah = "-",
    this.noHpAyah = "-",
    this.emailAyah = "-",
    this.namaIbu = "-",
    this.pekerjaanIbu = "-",
    this.alamatRumahIbu = "-",
    this.nikIbu = "-",
    this.emailIbu = "-",
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
      menitKelahiran: json["meniKelahiran"],
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
      noHpIbu: json["noHpIbu"],
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
      "menitKelahiran": menitKelahiran,
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

  LaporanKelahiran copyWith({
    String? id,
    String? desaId,
    String? noKk,
    String? namaBayi,
    String? anakKe,
    String? jenisKelamin,
    int? jamKelahiran,
    int? menitKelahiran,
    String? tempatLahir,
    DateTime? tanggalLahir,
    String? namaAyah,
    String? pekerjaanAyah,
    String? alamatRumahAyah,
    String? nikAyah,
    String? noHpAyah,
    String? emailAyah,
    String? namaIbu,
    String? pekerjaanIbu,
    String? alamatRumahIbu,
    String? nikIbu,
    String? noHpIbu,
    String? emailIbu,
  }) {
    return LaporanKelahiran(
      id: id ?? this.id,
      desaId: desaId ?? this.desaId,
      noKk: noKk ?? this.noKk,
      namaBayi: namaBayi ?? this.namaBayi,
      anakKe: anakKe ?? this.anakKe,
      jenisKelamin: jenisKelamin ?? this.jenisKelamin,
      jamKelahiran: jamKelahiran ?? this.jamKelahiran,
      menitKelahiran: menitKelahiran ?? this.menitKelahiran,
      tempatLahir: tempatLahir ?? this.tempatLahir,
      tanggalLahir: tanggalLahir ?? this.tanggalLahir,
      namaAyah: namaAyah ?? this.namaAyah,
      pekerjaanAyah: pekerjaanAyah ?? this.pekerjaanAyah,
      alamatRumahAyah: alamatRumahAyah ?? this.alamatRumahAyah,
      nikAyah: nikAyah ?? this.nikAyah,
      noHpAyah: noHpAyah ?? this.noHpAyah,
      emailAyah: emailAyah ?? this.emailAyah,
      namaIbu: namaIbu ?? this.namaIbu,
      pekerjaanIbu: pekerjaanIbu ?? this.pekerjaanIbu,
      alamatRumahIbu: alamatRumahIbu ?? this.alamatRumahIbu,
      nikIbu: nikIbu ?? this.nikIbu,
      noHpIbu: noHpIbu ?? this.noHpIbu,
      emailIbu: emailIbu ?? this.emailIbu,
    );
  }
}
