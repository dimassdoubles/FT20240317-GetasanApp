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
import 'package:getasan_app/features/lapor_kelahiran/presentation/widget/detail_laporan_kelahiran_list_item.dart';

class DaftarLaporanKelahiranPage extends ConsumerWidget {
  const DaftarLaporanKelahiranPage({super.key});

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
              'Data Lapor Kelahiran',
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
                child: const SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      LaporanTile(
                        no: '1.',
                        title: 'Jeon Wonwoo',
                        date: '8/3/2024',
                        child: DetailLaporanKelahiranListItem(
                          noKK: '9423877981',
                          anakKe: '1',
                          jenisKelamin: 'Laki-laki',
                          jamKelahiran: '02.35 WIB',
                          tempatLahir: 'Rumah sakit',
                          tanggalLahir: '8/3/2024',
                          namaAyah: 'Gibran rakabu',
                          pekerjaanAyah: 'Wakil presiden',
                          alamatRumahAyah: 'Istana negara',
                          nikAyah: '254987179482',
                          noHpAyah: '081276148',
                          emailAyah: 'gibran@gmail.com',
                          namaIbu: 'Dinda Haw',
                          pekerjaanIbu: 'Aktris',
                          alamatRumahIbu: 'Istana negara',
                          nikIbu: '2784987523874',
                          noHpIbu: '082486264',
                          emailIbu: 'dinda@gmail.com',
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
