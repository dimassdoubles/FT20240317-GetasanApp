import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/common/constant/style/app_size.dart';
import 'package:getasan_app/features/common/presentation/widget/app_back_button.dart';
import 'package:getasan_app/features/common/presentation/widget/button/primary_button.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';
import 'package:getasan_app/features/common/presentation/widget/getasan_app_bar.dart';
import 'package:getasan_app/features/common/presentation/widget/input/image_input.dart';
import 'package:getasan_app/features/common/presentation/widget/input/text_input.dart';
import 'package:getasan_app/features/lapor_camat/presentation/controller/input_laporan_camat_controller.dart';

class InputLaporCamatPage extends ConsumerWidget {
  const InputLaporCamatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(inputLaporanCamatControllerProvider);

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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const TextInput(
                      hint: 'Isi pesan di kolom ini...',
                      minLines: 5,
                    ),
                    Gaps.v24,
                    if (ref.watch(controller.selectedImageProvider) != null)
                      _FileImae(
                        file: ref.watch(controller.selectedImageProvider)!,
                        onDelete: controller.deleteImage,
                      ),
                    if (ref.watch(controller.selectedImageProvider) == null)
                      ImageInput(
                        onImagePicked: controller.onSelectedImage,
                      ),
                    SizedBox(
                      height: 56.h,
                    ),
                    PrimaryButton(
                      label: 'Kirim',
                      onTap: () {},
                    ),
                    Gaps.v36,
                  ],
                ),
              ),
            ),
          ],
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
