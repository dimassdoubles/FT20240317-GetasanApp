import 'package:cloud_firestore/cloud_firestore.dart';

class LaporanCamat {
  final String id;
  final String desaId;
  final DateTime date;
  final String pesan;
  final String imageUrl;

  LaporanCamat({
    required this.id,
    required this.desaId,
    required this.date,
    required this.pesan,
    required this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'villageId': desaId,
      'date': Timestamp.fromDate(date),
      'pesan': pesan,
      'imageUrl': imageUrl,
    };
  }
}
