import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';

class FileGallerypage extends StatelessWidget {
  final List<File> listFile;
  const FileGallerypage({
    super.key,
    required this.listFile,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PhotoViewGallery.builder(
        itemCount: listFile.length,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: FileImage(listFile[index]),
          );
        },
      ),
    );
  }
}
