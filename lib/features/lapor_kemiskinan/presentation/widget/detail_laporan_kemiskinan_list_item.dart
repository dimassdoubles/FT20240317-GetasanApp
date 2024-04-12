import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';
import 'package:getasan_app/features/common/presentation/page/network_gallery_page.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';

class DetailLaporanKemiskinanListItem extends StatelessWidget {
  final String noKk;
  final String pekerjaan;
  final int pendapatan;
  final String alamat;
  final String titikKoordinat;
  final String gambarDepanUrl;
  final String gambarBelakangurl;
  const DetailLaporanKemiskinanListItem({
    super.key,
    required this.noKk,
    required this.pekerjaan,
    required this.pendapatan,
    required this.alamat,
    required this.titikKoordinat,
    required this.gambarDepanUrl,
    required this.gambarBelakangurl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('No Kartu Keluarga'),
        Gaps.v4,
        Text(noKk),
        const Text('Pekerjaan'),
        Gaps.v4,
        Text(pekerjaan),
        const Text('Pendapatan'),
        Gaps.v4,
        Text(pendapatan.toString()),
        const Text('Alamat'),
        Gaps.v4,
        Text(alamat),
        const Text('Titik Koordinat'),
        Gaps.v4,
        Text(alamat),
        Gaps.v16,
        const Text('Foto'),
        Gaps.v8,
        Wrap(
          spacing: 8.w,
          runSpacing: 8.w,
          children: [
            gambarDepanUrl.isEmpty
                ? Center(
                    child: Icon(
                      Icons.image,
                      color: AppColors.primary300,
                      size: 150.w,
                    ),
                  )
                : Center(
                    child: InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NetworkGalleryPage(
                            listUrl: [
                              gambarDepanUrl,
                            ],
                          ),
                        ),
                      ),
                      child: Image.network(
                        gambarDepanUrl,
                        width: 150.w,
                      ),
                    ),
                  ),
            gambarBelakangurl.isEmpty
                ? Center(
                    child: Icon(
                      Icons.image,
                      color: AppColors.primary300,
                      size: 150.w,
                    ),
                  )
                : Center(
                    child: InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NetworkGalleryPage(
                            listUrl: [
                              gambarBelakangurl,
                            ],
                          ),
                        ),
                      ),
                      child: Image.network(
                        gambarBelakangurl,
                        width: 150.w,
                      ),
                    ),
                  ),
          ],
        ),
        Gaps.v16,
      ],
    );
  }
}
