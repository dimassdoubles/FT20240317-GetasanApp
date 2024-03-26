import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:getasan_app/features/common/helper/state_dialog_helper.dart';
import 'package:image_picker/image_picker.dart';

class ImageHelper {
  ImageHelper._();

  /// ext -> ekstensi file ex: '.png, .jpg'
  static (String name, String ext) getExtension(XFile file) {
    final lastIndex = file.path.lastIndexOf(RegExp(r'.png|.jp|.PNG|.JP'));
    return (
      file.path.substring(0, lastIndex),
      file.path.substring(lastIndex),
    );
  }

  /// default compress sampai 1 MB
  /// 1 MB = 1 000 000 Bytes
  static Future<XFile> compressImage(
    XFile file, {
    int toBytes = 1000000,
  }) async {
    try {
      if (await file.length() <= toBytes) {
        return file;
      }

      final filePath = File(file.path).absolute.path;
      final (fileName, ext) = getExtension(file);
      final outPath = '${fileName}_out$ext';

      late CompressFormat format;

      switch (ext.toLowerCase()) {
        case '.heic':
          format = CompressFormat.heic;
          break;
        case '.png':
          format = CompressFormat.png;
          break;
        case '.jpg':
          format = CompressFormat.jpeg;
          break;
        default:
          format = CompressFormat.jpeg;
      }

      final result = await FlutterImageCompress.compressAndGetFile(
        filePath,
        outPath,
        quality: 50,
        minHeight: 720,
        minWidth: 1280,
        format: format,
      );

      if (result != null) {
        return compressImage(result, toBytes: toBytes);
      }
      return file;
    } catch (e) {
      return file;
    }
  }

  static void pickImage({
    void Function(XFile imagePicked)? onImagePicked,
    bool fromCamera = true,
  }) async {
    try {
      XFile? result;

      StateDialogHelper.showLoading();
      final ImagePicker picker = ImagePicker();
      result = await picker.pickImage(
        source: fromCamera ? ImageSource.camera : ImageSource.gallery,
      );
      StateDialogHelper.dismiss();

      if (result != null) {
        result = await compressImage(result);
        StateDialogHelper.dismiss();
        onImagePicked?.call(result);
      }
    } catch (e) {
      StateDialogHelper.dismiss();
      StateDialogHelper.showError(
        'Gagal',
        fromCamera
            ? 'Terjadi kesalahan saat mengambil gambar: ${e.toString()}'
            : 'Terjadi kesalahan saat pilih gambar: ${e.toString()}',
      );
    }
  }
}
