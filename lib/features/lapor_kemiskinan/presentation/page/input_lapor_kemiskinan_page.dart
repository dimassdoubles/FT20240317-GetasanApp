import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';
import 'package:getasan_app/features/common/constant/style/app_size.dart';
import 'package:getasan_app/features/common/constant/style/app_texts.dart';
import 'package:getasan_app/features/common/presentation/widget/app_back_button.dart';
import 'package:getasan_app/features/common/presentation/widget/button/primary_button.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';
import 'package:getasan_app/features/common/presentation/widget/getasan_app_bar.dart';
import 'package:getasan_app/features/common/presentation/widget/input/image_input.dart';
import 'package:getasan_app/features/common/presentation/widget/input/text_input.dart';
import 'package:getasan_app/features/lapor_kemiskinan/presentation/controller/input_laporan_kemiskinan_controller.dart';

class InputLaporKemiskinanPage extends ConsumerWidget {
  const InputLaporKemiskinanPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(inputLaporanKemiskinanControllerProvider);

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: const GetasanAppBar(
        isCenterLogo: true,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.pagePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBackButton(context),
              Gaps.v36,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextInput(
                        controller: controller.namaKepalaKeluargaCtrl,
                        hint: "Nama Kepala Keluarga",
                      ),
                      Gaps.v8,
                      TextInput(
                        controller: controller.nokkCtrl,
                        hint: "No Kartu Keluarga",
                      ),
                      Gaps.v8,
                      TextInput(
                        controller: controller.pekerjaanCtrl,
                        hint: "Pekerjaan",
                      ),
                      Gaps.v8,
                      TextInput(
                        controller: controller.pendapatanCtrl,
                        hint: "Pendapatan",
                        keyboardType: TextInputType.number,
                      ),
                      Gaps.v8,
                      TextInput(
                        controller: controller.alamatCtrl,
                        hint: "Alamat",
                      ),
                      Gaps.v8,
                      TextInput(
                        controller: controller.titikKoordinatCtrl,
                        hint: "Titik Koordinat",
                      ),
                      Gaps.v24,
                      Text(
                        'Foto Rumah Tampak Depan',
                        style: AppTexts.regular.copyWith(
                          color: AppColors.primary300,
                        ),
                      ),
                      Gaps.v8,
                      if (ref.watch(controller.selectedGambarDepanProvider) !=
                          null)
                        _FileImae(
                          file: ref
                              .watch(controller.selectedGambarDepanProvider)!,
                          onDelete: controller.deleteGambarDepan,
                        ),
                      if (ref.watch(controller.selectedGambarDepanProvider) ==
                          null)
                        ImageInput(
                          onImagePicked: controller.onSelectedGambarDepan,
                        ),
                      Gaps.v24,
                      Text(
                        'Foto Rumah Tampak Belakang',
                        style: AppTexts.regular.copyWith(
                          color: AppColors.primary300,
                        ),
                      ),
                      Gaps.v8,
                      if (ref.watch(
                              controller.selectedGambarBelakangProvider) !=
                          null)
                        _FileImae(
                          file: ref.watch(
                              controller.selectedGambarBelakangProvider)!,
                          onDelete: controller.deleteGambarBelakang,
                        ),
                      if (ref.watch(
                              controller.selectedGambarBelakangProvider) ==
                          null)
                        ImageInput(
                          onImagePicked: controller.onSelectedGambarBelakang,
                        ),
                      SizedBox(
                        height: 56.h,
                      ),
                      PrimaryButton(
                        label: 'Kirim',
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            final isSuccess = await controller.createLaporan();
                            if (isSuccess) {
                              // ignore: use_build_context_synchronously
                              Navigator.pop(context);
                            }
                          }
                        },
                      ),
                      Gaps.v36,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FileImae extends StatelessWidget {
  final XFile file;
  final void Function() onDelete;
  const _FileImae({
    required this.file,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.file(
          File(file.path),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.all(4.w),
            child: IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(0.7),
              ),
              onPressed: onDelete,
              icon: const Icon(Icons.clear_rounded),
            ),
          ),
        ),
      ],
    );
  }
}
