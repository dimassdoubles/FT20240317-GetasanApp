import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getasan_app/features/lapor_camat/data/datasource/remote/lapor_camat_firebase_datasource.dart';

final laporCamatRemoteDatasourceProvider = Provider<LaporCamatRemoteDatasource>(
  (ref) => LaporCamatFirebaseDatasource(),
);

abstract class LaporCamatRemoteDatasource {
  Future<void> createLaporan(String pesan, File? image);
}
