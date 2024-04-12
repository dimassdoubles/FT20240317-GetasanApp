import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/common/constant/style/app_size.dart';
import 'package:getasan_app/features/common/presentation/page/file_gallery_page.dart';
import 'package:getasan_app/features/common/presentation/widget/app_back_button.dart';
import 'package:getasan_app/features/common/presentation/widget/button/primary_button.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';
import 'package:getasan_app/features/common/presentation/widget/getasan_app_bar.dart';
import 'package:getasan_app/features/common/presentation/widget/input/date_input.dart';
import 'package:getasan_app/features/common/presentation/widget/input/image_input.dart';
import 'package:getasan_app/features/common/presentation/widget/input/text_input.dart';
import 'package:getasan_app/features/lapor_kegiatan_desa/presentation/controller/laporan_kegiatan_controller.dart';
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

    final controller = ref.read(laporanKegiatanControllerProvider);

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
                          hint: "(tanggal kegiatan)",
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
                          onTap: () async {
                            if (useFormKey.value.currentState!.validate()) {
                              final gambar = useGambar.value != null
                                  ? File(useGambar.value!.path)
                                  : null;

                              final isSuccess = await controller.createLaporan(
                                namaKegiatan: useNamaKegiatanCtrl.text,
                                penanggungJawab: usePenganggungJawabCtrl.text,
                                tanggalKegiatan: useDate.value,
                                hasilKegiatan: useHasilKegiatanCtrl.text,
                                kendala: useKendalaCtrl.text,
                                image: gambar,
                              );

                              if (isSuccess) {
                                useNamaKegiatanCtrl.text = "";
                                usePenganggungJawabCtrl.text = "";
                                useHasilKegiatanCtrl.text = "";
                                useKendalaCtrl.text = "";
                                useGambar.value = null;
                                useDate.value = DateTime.now();
                              }
                            }
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
        InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FileGallerypage(
                listFile: [
                  File(file.path),
                ],
              ),
            ),
          ),
          child: Image.file(
            File(file.path),
          ),
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
