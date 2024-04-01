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
import 'package:getasan_app/features/lapor_camat/presentation/controller/input_laporan_camat_controller.dart';
import 'package:getasan_app/features/lapor_camat/presentation/widget/detail_laporan_camat_list_item.dart';

class DaftarLaporanCamatPage extends ConsumerWidget {
  const DaftarLaporanCamatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(inputLaporanCamatControllerProvider);

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
                    'Data Lapor Camat',
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
                      child: ref.watch(controller.laporanCamatProvider) != null
                          ? ListView.builder(
                              itemCount: ref
                                  .watch(controller.laporanCamatProvider)!
                                  .length,
                              itemBuilder: (context, index) {
                                final laporan = ref.watch(
                                    controller.laporanCamatProvider)![index];
                                return LaporanTile(
                                  title: laporan.pesan,
                                  date: laporan.date.toString(),
                                  no: "${(index + 1).toString().padLeft(2, "0")}.",
                                  child: DetailLaporanCamtListItem(
                                    pesan: laporan.pesan,
                                    photoUrl: laporan.imageUrl,
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
