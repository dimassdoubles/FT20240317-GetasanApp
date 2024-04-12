import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';

class NetworkGalleryPage extends StatelessWidget {
  final List<String> listUrl;
  const NetworkGalleryPage({
    super.key,
    required this.listUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PhotoViewGallery.builder(
        itemCount: listUrl.length,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(listUrl[index]),
          );
        },
      ),
    );
  }
}
