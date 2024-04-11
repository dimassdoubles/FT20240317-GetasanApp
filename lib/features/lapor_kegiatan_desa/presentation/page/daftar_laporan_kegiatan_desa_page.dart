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
import 'package:getasan_app/features/lapor_kegiatan_desa/presentation/controller/laporan_kegiatan_controller.dart';
import 'package:getasan_app/features/lapor_kegiatan_desa/presentation/widget/detail_laporan_kegiatan_desa_list_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DaftarLaporanKegiatanDesaPage extends HookConsumerWidget {
  const DaftarLaporanKegiatanDesaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(laporanKegiatanControllerProvider);
    final selectedTahun = ref.watch(controller.tahunProvider);
    final selectedBulan = ref.watch(controller.bulanProvider);

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
              'Data Kegiatan Desa',
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
                    hint: selectedTahun.toString(),
                    readOnly: true,
                  ),
                ),
                Gaps.h8,
                Expanded(
                  child: TextInput(
                    hint: DateTimeHelper.months[selectedBulan - 1],
                    readOnly: true,
                  ),
                ),
              ],
            ),
            Gaps.v12,
            Expanded(
              child: ref.watch(controller.daftarLaporanProvider) != null
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
                        itemCount:
                            ref.watch(controller.daftarLaporanProvider)!.length,
                        itemBuilder: (context, index) {
                          final laporan = ref
                              .watch(controller.daftarLaporanProvider)![index];

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: LaporanTile(
                              title: laporan.namaKegiatan,
                              date: DateTimeHelper.displayDate(laporan.date),
                              no: "${(index + 1).toString().padLeft(2, "0")}.",
                              child: DetailLaporanKegiatanDesaListItem(
                                penanggungJawab:
                                    laporan.penanggungJawabKegiatan,
                                waktu: DateTimeHelper.displayDate(laporan.date),
                                hasilKegiatan: laporan.hasilKegiatan,
                                kendala: laporan.kendala,
                                photoUrl: laporan.imageUrl,
                              ),
                            ),
                          );
                        },
                      ),
                      // child: const SingleChildScrollView(
                      //   child: Column(
                      //     mainAxisSize: MainAxisSize.max,
                      //     children: [
                      //       LaporanTile(
                      //         no: '1.',
                      //         title: 'Mengecat Masjid',
                      //         date: '9/3/2024',
                      //         child: DetailLaporanKegiatanDesaListItem(
                      //           penanggungJawab: 'Irfan Maulana',
                      //           waktu: '12:34',
                      //           hasilKegiatan: 'Masjid jadi lebih cantik',
                      //           kendala: 'Cat lama terlalu tebal',
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
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
