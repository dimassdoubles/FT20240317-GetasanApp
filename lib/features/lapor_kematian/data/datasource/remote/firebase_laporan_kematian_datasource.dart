import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getasan_app/features/auth/domain/repo/auth_repo.dart';
import 'package:getasan_app/features/common/constant/error/app_exception.dart';
import 'package:getasan_app/features/lapor_kematian/data/datasource/remote/laporan_kematian_remote_datasource.dart';
import 'package:getasan_app/features/lapor_kematian/domain/models/laporan_kematian.dart';

class FirebaseLaporanKematianDatasource
    implements LaporanKematianRemoteDatasource {
  final Ref _ref;

  FirebaseLaporanKematianDatasource(this._ref);

  @override
  Future<void> createLaporan({
    required String nik,
    required String namaLengkap,
    required String alamat,
    required String tempatLahir,
    required DateTime tanggalLahir,
    required String tempatMeninggal,
    required DateTime tanggalMeninggal,
    required String namaPasanganDitinggal,
    required String namaAnakDitinggal,
    required String statusKawin,
  }) async {
    try {
      final authProvider = _ref.read(authRepoProvider);
      final (user, error) = await authProvider.isLogin();
      if (error != null) {
        throw AppAuthException("User belum login");
      }

      final desaId = user!.desa.id;

      final firestore = FirebaseFirestore.instance;
      CollectionReference laporanCollection = firestore.collection(
        'kematianReports',
      );

      final id = laporanCollection.doc().id;
      await laporanCollection.doc(id).set(
            LaporanKematian(
              id: id,
              desaId: desaId,
              nik: nik,
              alamatRumah: alamat,
              namaLengkap: namaLengkap,
              tempatLahir: tempatLahir,
              tanggalLahir: tanggalLahir,
              tempatMeninggal: tempatMeninggal,
              tanggalMeninggal: tanggalMeninggal,
              namaPasanganDitinggal: namaPasanganDitinggal,
              namaAnakDitinggal: namaAnakDitinggal,
              statusKawin: statusKawin,
            ).toJson(),
          );
    } catch (e) {
      throw AppException("Gagal membuat laporan kematian: ${e.toString}");
    }
  }

  @override
  Future<List<LaporanKematian>> getLaporan(int year, int month) async {
    try {
      final firestore = FirebaseFirestore.instance;

      final authProvider = _ref.read(authRepoProvider);
      final (user, error) = await authProvider.isLogin();
      if (error != null) {
        throw AppAuthException("User belum login");
      }

      final desaId = user!.desa.id;

      final startTime = DateTime(year, month, 1);
      final endTime =
          DateTime(year, month + 1, 1).subtract(const Duration(days: 1));

      QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
          .collection("kematianReports")
          .where("tanggalMeninggal",
              isGreaterThanOrEqualTo: startTime, isLessThan: endTime)
          .where("villageId", isEqualTo: desaId)
          .get();

      final List<LaporanKematian> daftarLaporan = [];
      for (var document in querySnapshot.docs) {
        daftarLaporan.add(
          LaporanKematian.fromJson(document.data()),
        );
      }

      return daftarLaporan;
    } catch (e) {
      throw AppException("Gagal mendapatkan laporan kematian: ${e.toString()}");
    }
  }
}
