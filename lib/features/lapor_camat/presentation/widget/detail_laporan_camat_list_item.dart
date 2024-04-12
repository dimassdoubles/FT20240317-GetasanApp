import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';
import 'package:getasan_app/features/common/presentation/page/network_gallery_page.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';

class DetailLaporanCamtListItem extends StatelessWidget {
  final String pesan;
  final String? photoUrl;
  const DetailLaporanCamtListItem({
    super.key,
    required this.pesan,
    this.photoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Isi Aduan'),
        Gaps.v4,
        Text(pesan),
        Gaps.v16,
        const Text('Foto'),
        Gaps.v8,
        photoUrl == null
            ? Center(
                child: Icon(
                  Icons.image,
                  color: AppColors.primary300,
                  size: 150.w,
                ),
              )
            : Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NetworkGalleryPage(
                          listUrl: [
                            photoUrl!,
                          ],
                        ),
                      ),
                    );
                  },
                  child: Image.network(
                    photoUrl!,
                    width: 150.w,
                  ),
                ),
              ),
        Gaps.v16,
      ],
    );
  }
}
