import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';
import 'package:getasan_app/features/common/constant/style/app_size.dart';
import 'package:getasan_app/features/common/constant/style/app_texts.dart';
import 'package:getasan_app/features/common/presentation/widget/app_back_button.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';
import 'package:getasan_app/features/common/presentation/widget/getasan_app_bar.dart';
import 'package:getasan_app/features/common/presentation/widget/input/text_input.dart';
import 'package:getasan_app/features/common/presentation/widget/laporan_tile.dart';
import 'package:getasan_app/features/lapor_camat/presentation/widget/detail_laporan_camat_list_item.dart';

class DaftarLaporanCamatPage extends ConsumerWidget {
  const DaftarLaporanCamatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const GetasanAppBar(
        isCenterLogo: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.pagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBackButton(context),
            Gaps.v36,
            Text(
              'Data Lapor Camat',
              style: AppTexts.extraBold.copyWith(
                fontSize: 19,
                color: AppColors.primary,
              ),
            ),
            Gaps.v24,
            Row(
              children: [
                const Expanded(
                  child: TextInput(
                    hint: '2024',
                    readOnly: true,
                  ),
                ),
                Gaps.h8,
                const Expanded(
                  child: TextInput(
                    hint: 'Maret',
                    readOnly: true,
                  ),
                ),
              ],
            ),
            Gaps.v12,
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8.w),
                width: 1.sw,
                height: 1.sh,
                decoration: BoxDecoration(
                  color: AppColors.neutral100,
                  borderRadius: BorderRadius.circular(10.w),
                  border: Border.all(color: AppColors.primary),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const LaporanTile(
                        no: '1.',
                        title: 'Cat Masjid Luntur',
                        date: '1/3/2024',
                        child: DetailLaporanCamtListItem(
                          pesan: 'Ini adalah pesan laporan camat',
                        ),
                      ),
                      Gaps.v8,
                      const LaporanTile(
                        no: '2.',
                        title: 'Jalan Rusak',
                        date: '16/3/2024',
                        child: DetailLaporanCamtListItem(
                          pesan:
                              'Ini adalah pesan panjang yang dikirimakan oleh user dari menu lapor camat',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Gaps.v36,
          ],
        ),
      ),
    );
  }
}
