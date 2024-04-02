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
import 'package:getasan_app/features/lapor_kematian/presentation/controller/laporan_kematian_controller.dart';
import 'package:getasan_app/features/lapor_kematian/presentation/widget/detail_laporan_kematian_list_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DaftarLaporanKematianPage extends HookConsumerWidget {
  const DaftarLaporanKematianPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(laporanKematianControllerProvider);
    final tahunProvider = ref.read(controller.tahunProvider);
    final bulanProvider = ref.read(controller.bulanProvider);
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
              'Data Lapor Kematian',
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
                    hint: tahunProvider.toString(),
                    readOnly: true,
                  ),
                ),
                Gaps.h8,
                Expanded(
                  child: TextInput(
                    hint: DateTimeHelper.months[bulanProvider],
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

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: LaporanTile(
                              title: laporan.namaLengkap,
                              date: DateTimeHelper.displayDate(
                                  laporan.tanggalMeninggal),
                              no: "${(index + 1).toString().padLeft(2, "0")}.",
                              child: DetailLaporanKematianListItem(
                                nik: laporan.nik,
                                alamatRumah: laporan.alamatRumah,
                                tempatLahir: laporan.tempatLahir,
                                tempatMeninggal: laporan.tempatMeninggal,
                                pasanganDitinggal:
                                    laporan.namaPasanganDitinggal,
                                anakDitinggal: laporan.namaAnakDitinggal,
                                statusKawin: laporan.statusKawin,
                              ),
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
