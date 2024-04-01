import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/common/constant/style/app_size.dart';
import 'package:getasan_app/features/common/presentation/widget/app_back_button.dart';
import 'package:getasan_app/features/common/presentation/widget/button/primary_button.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';
import 'package:getasan_app/features/common/presentation/widget/getasan_app_bar.dart';
import 'package:getasan_app/features/common/presentation/widget/input/date_input.dart';
import 'package:getasan_app/features/common/presentation/widget/input/image_input.dart';
import 'package:getasan_app/features/common/presentation/widget/input/text_input.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class InputLaporanKegiatanDesaPage extends HookConsumerWidget {
  const InputLaporanKegiatanDesaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useFormKey = useState(GlobalKey<FormState>());

    final useNamaKegiatanCtrl = useTextEditingController();
    final usePenganggungJawabCtrl = useTextEditingController();
    final useHasilKegiatanCtrl = useTextEditingController();
    final useKendalaCtrl = useTextEditingController();

    final useDate = useState(DateTime.now());
    final useGambar = useState<XFile?>(null);

    return Scaffold(
      appBar: const GetasanAppBar(
        isCenterLogo: true,
      ),
      body: Form(
        key: useFormKey.value,
        child: SafeArea(
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
                      children: [
                        TextInput(
                          controller: useNamaKegiatanCtrl,
                          hint: 'Nama Kegiatan',
                          isRequired: true,
                        ),
                        Gaps.v16,
                        TextInput(
                          controller: usePenganggungJawabCtrl,
                          hint: 'Penanggung jawab kegiatan',
                          isRequired: true,
                        ),
                        Gaps.v16,
                        DateInput(
                          onDateSelected: (dateSelected) {
                            useDate.value = dateSelected;
                          },
                        ),
                        Gaps.v16,
                        TextInput(
                          controller: useHasilKegiatanCtrl,
                          hint: 'Hasil Kegiatan',
                          isRequired: true,
                        ),
                        Gaps.v16,
                        TextInput(
                          controller: useKendalaCtrl,
                          hint: 'Kendala',
                          isRequired: true,
                        ),
                        Gaps.v16,
                        useGambar.value == null
                            ? ImageInput(
                                onImagePicked: (image) {
                                  useGambar.value = image;
                                },
                              )
                            : _FileImae(
                                file: useGambar.value!,
                                onDelete: () {
                                  useGambar.value = null;
                                },
                              ),
                        SizedBox(height: 42.h),
                        PrimaryButton(
                          label: 'Kirim',
                          onTap: () {
                            if (useFormKey.value.currentState!.validate()) {}
                          },
                        ),
                        Gaps.v24,
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
