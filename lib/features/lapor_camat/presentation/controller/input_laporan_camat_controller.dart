import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final inputLaporanCamatControllerProvider = Provider(
  (ref) => InputLaporanCamatController(ref),
);

class InputLaporanCamatController {
  final Ref _ref;

  InputLaporanCamatController(this._ref);

  final selectedImageProvider = StateProvider<XFile?>((ref) => null);

  void onSelectedImage(XFile? image) {
    _ref.read(selectedImageProvider.notifier).state = image;
  }

  void deleteImage() {
    _ref.read(selectedImageProvider.notifier).state = null;
  }
}
