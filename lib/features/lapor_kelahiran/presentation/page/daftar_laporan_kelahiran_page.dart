import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';
import 'package:getasan_app/features/common/constant/style/app_size.dart';
import 'package:getasan_app/features/common/constant/style/app_texts.dart';
import 'package:getasan_app/features/common/helper/date_time_helper.dart';
import 'package:getasan_app/features/common/presentation/widget/app_back_button.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';
import 'package:getasan_app/features/common/presentation/widget/getasan_app_bar.dart';
import 'package:getasan_app/features/common/presentation/widget/input/text_input.dart';
import 'package:getasan_app/features/common/presentation/widget/laporan_tile.dart';
import 'package:getasan_app/features/lapor_kelahiran/presentation/controller/laporan_kelahiran_controller.dart';
import 'package:getasan_app/features/lapor_kelahiran/presentation/widget/detail_laporan_kelahiran_list_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DaftarLaporanKelahiranPage extends HookConsumerWidget {
  const DaftarLaporanKelahiranPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(laporanKelahiranControllerProvider);
    final selectedYear = ref.watch(controller.tahunProvider);
    final selectedMonth = ref.watch(controller.bulanProvider);

    final daftarLaporanProvider = ref.watch(controller.daftarLaporanProvider);

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
                Expanded(
                  child: TextInput(
                    hint: selectedYear.toString(),
                    readOnly: true,
                  ),
                ),
                Gaps.h8,
                Expanded(
                  child: TextInput(
                    hint: DateTimeHelper.months[selectedMonth],
                    readOnly: true,
                  ),
                ),
              ],
            ),
            Gaps.v12,
            Expanded(
              child: daftarLaporanProvider != null
                  ? Container(
                      padding: EdgeInsets.all(8.w),
                      width: 1.sw,
                      height: 1.sh,
                      decoration: BoxDecoration(
                        color: AppColors.neutral100,
                        borderRadius: BorderRadius.circular(10.w),
                        border: Border.all(color: AppColors.primary),
                      ),
                      child: ListView.builder(
                        itemCount: daftarLaporanProvider.length,
                        itemBuilder: (context, index) {
                          final laporan = daftarLaporanProvider[index];

                          return LaporanTile(
                            title: laporan.namaBayi,
                            date: DateTimeHelper.displayDate(
                                laporan.tanggalLahir),
                            no: "${(index + 1).toString().padLeft(2, "0")}.",
                            child: DetailLaporanKelahiranListItem(
                              noKK: laporan.noKk,
                              anakKe: laporan.anakKe,
                              jenisKelamin: laporan.jenisKelamin,
                              jamKelahiran:
                                  "${laporan.jamKelahiran.toString().padLeft(2, "0")}.${laporan.menitKelahiran.toString().padLeft(2, "0")}",
                              tempatLahir: laporan.tempatLahir,
                              tanggalLahir: DateTimeHelper.displayDate(
                                  laporan.tanggalLahir),
                              namaAyah: laporan.namaAyah,
                              pekerjaanAyah: laporan.pekerjaanAyah,
                              alamatRumahAyah: laporan.alamatRumahAyah,
                              nikAyah: laporan.nikAyah,
                              noHpAyah: laporan.noHpAyah,
                              emailAyah: laporan.emailAyah,
                              namaIbu: laporan.namaIbu,
                              pekerjaanIbu: laporan.pekerjaanIbu,
                              alamatRumahIbu: laporan.alamatRumahIbu,
                              nikIbu: laporan.nikIbu,
                              noHpIbu: laporan.noHpIbu,
                              emailIbu: laporan.emailIbu,
                            ),
                          );
                        },
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
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
