// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';
import 'package:getasan_app/features/common/constant/style/app_size.dart';
import 'package:getasan_app/features/common/constant/style/app_texts.dart';
import 'package:getasan_app/features/common/presentation/widget/app_back_button.dart';
import 'package:getasan_app/features/common/presentation/widget/button/primary_button.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';
import 'package:getasan_app/features/common/presentation/widget/getasan_app_bar.dart';
import 'package:getasan_app/features/common/presentation/widget/input/text_input.dart';
import 'package:getasan_app/features/lapor_kelahiran/presentation/controller/laporan_kelahiran_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InputDataIbuPage extends HookConsumerWidget {
  const InputDataIbuPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useFormKey = useState(GlobalKey<FormState>());

    final useNamaCtrl = useTextEditingController();
    final usePekerjaanCtrl = useTextEditingController();
    final useAlamatCtrl = useTextEditingController();
    final useNikCtrl = useTextEditingController();
    final useNoHpCtrl = useTextEditingController();
    final useEmailCtrl = useTextEditingController();

    final controller = ref.read(laporanKelahiranControllerProvider);
    final laporanKelahiran =
        ref.watch(controller.createLaporanKelahiranParamProvider);

    return Scaffold(
      appBar: const GetasanAppBar(
        isCenterLogo: true,
      ),
      body: Form(
        key: useFormKey.value,
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
                      Text(
                        'Data Ibu',
                        style: AppTexts.extraBold.copyWith(
                          fontSize: 19,
                          color: AppColors.primary,
                        ),
                      ),
                      Gaps.v16,
                      TextInput(
                        controller: useNamaCtrl,
                        hint: 'Nama Ibu',
                      ),
                      Gaps.v16,
                      TextInput(
                        controller: usePekerjaanCtrl,
                        hint: 'Pekerjaan',
                      ),
                      Gaps.v16,
                      TextInput(
                        controller: useAlamatCtrl,
                        hint: 'Alamat Rumah',
                      ),
                      Gaps.v16,
                      TextInput(
                        controller: useNikCtrl,
                        hint: 'NIK',
                      ),
                      Gaps.v16,
                      TextInput(
                        controller: useNoHpCtrl,
                        hint: 'No HP',
                      ),
                      Gaps.v16,
                      TextInput(
                        controller: useEmailCtrl,
                        hint: 'Email',
                      ),
                      Gaps.v36,
                      PrimaryButton(
                        label: 'Kirim',
                        onTap: () async {
                          if (useFormKey.value.currentState!.validate()) {
                            controller.setParam(laporanKelahiran.copyWith(
                              namaIbu: useNamaCtrl.text,
                              pekerjaanIbu: usePekerjaanCtrl.text,
                              alamatRumahIbu: useAlamatCtrl.text,
                              nikIbu: useNikCtrl.text,
                              noHpIbu: useNoHpCtrl.text,
                              emailIbu: useEmailCtrl.text,
                            ));

                            final isSuccess = await controller.createLaporan();
                            if (!isSuccess) {
                              return;
                            }
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.pop(context);
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
