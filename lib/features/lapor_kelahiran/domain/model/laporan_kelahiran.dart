import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getasan_app/features/common/helper/json_helper.dart';

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
      id: JsonHelper.safeParse(json, "id"),
      desaId: JsonHelper.safeParse(json, "villageId"),
      noKk: JsonHelper.safeParse(json, "noKk"),
      namaBayi: JsonHelper.safeParse(json, "namaBayi"),
      anakKe: JsonHelper.safeParse(json, "anakKe"),
      jenisKelamin: JsonHelper.safeParse(json, "jenisKelamin"),
      jamKelahiran: JsonHelper.safeParse(json, "jamKelahiran"),
      menitKelahiran: JsonHelper.safeParse(json, "menitKelahiran"),
      tempatLahir: JsonHelper.safeParse(json, "tempatLahir"),
      tanggalLahir: JsonHelper.safeParse(json, "tanggalLahir").toDate(),
      namaAyah: JsonHelper.safeParse(json, "namaAyah"),
      pekerjaanAyah: JsonHelper.safeParse(json, "pekerjaanAyah"),
      alamatRumahAyah: JsonHelper.safeParse(json, "alamatRumahAyah"),
      nikAyah: JsonHelper.safeParse(json, "nikAyah"),
      noHpAyah: JsonHelper.safeParse(json, "noHpAyah"),
      emailAyah: JsonHelper.safeParse(json, "emailAyah"),
      namaIbu: JsonHelper.safeParse(json, "namaIbu"),
      pekerjaanIbu: JsonHelper.safeParse(json, "pekerjaanIbu"),
      alamatRumahIbu: JsonHelper.safeParse(json, "alamatRumahIbu"),
      nikIbu: JsonHelper.safeParse(json, "nikIbu"),
      noHpIbu: JsonHelper.safeParse(json, "noHpIbu"),
      emailIbu: JsonHelper.safeParse(json, "emailIbu"),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      "noHpIbu": noHpIbu,
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
