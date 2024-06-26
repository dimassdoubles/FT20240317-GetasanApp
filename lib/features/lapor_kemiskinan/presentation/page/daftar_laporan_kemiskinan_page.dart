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
import 'package:getasan_app/features/lapor_kemiskinan/presentation/controller/input_laporan_kemiskinan_controller.dart';
import 'package:getasan_app/features/lapor_kemiskinan/presentation/widget/detail_laporan_kemiskinan_list_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DaftarLaporanKemiskinanPage extends HookConsumerWidget {
  const DaftarLaporanKemiskinanPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(inputLaporanKemiskinanControllerProvider);

    return Scaffold(
      appBar: const GetasanAppBar(
        isCenterLogo: true,
      ),
      body: ref.watch(controller.loadingProvider)
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            )
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.pagePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBackButton(context),
                  Gaps.v36,
                  Text(
                    'Data Lapor Kemiskinan',
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
                          hint: "${ref.watch(controller.tahunProvider)}",
                          readOnly: true,
                        ),
                      ),
                      Gaps.h8,
                      Expanded(
                        child: TextInput(
                          hint: ref.watch(controller.bulanProvider),
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
                      child: ref.watch(controller.laporanKemiskinanProvider) !=
                              null
                          ? ListView.builder(
                              itemCount: ref
                                  .watch(controller.laporanKemiskinanProvider)!
                                  .length,
                              itemBuilder: (context, index) {
                                final laporan = ref.watch(controller
                                    .laporanKemiskinanProvider)![index];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: LaporanTile(
                                    title: laporan.namaKepalaKeluarga,
                                    date: DateTimeHelper.displayDate(
                                        laporan.date),
                                    no: "${(index + 1).toString().padLeft(2, "0")}.",
                                    child: DetailLaporanKemiskinanListItem(
                                      noKk: laporan.noKk,
                                      pekerjaan: laporan.pekerjaan,
                                      pendapatan: laporan.pendapatan,
                                      alamat: laporan.alamat,
                                      titikKoordinat: laporan.titikKoordinat,
                                      gambarDepanUrl: laporan.gambarDepanUrl,
                                      gambarBelakangurl:
                                          laporan.gambarBelakangUrl,
                                    ),
                                  ),
                                );
                              },
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),
                  Gaps.v36,
                ],
              ),
            ),
    );
  }
}
