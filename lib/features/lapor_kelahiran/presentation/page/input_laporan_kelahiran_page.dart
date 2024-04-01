import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';
import 'package:getasan_app/features/common/constant/style/app_size.dart';
import 'package:getasan_app/features/common/constant/style/app_texts.dart';
import 'package:getasan_app/features/common/presentation/widget/app_back_button.dart';
import 'package:getasan_app/features/common/presentation/widget/button/primary_button.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';
import 'package:getasan_app/features/common/presentation/widget/getasan_app_bar.dart';
import 'package:getasan_app/features/common/presentation/widget/input/date_input.dart';
import 'package:getasan_app/features/common/presentation/widget/input/dropdown_input.dart';
import 'package:getasan_app/features/common/presentation/widget/input/input_jam.dart';
import 'package:getasan_app/features/common/presentation/widget/input/text_input.dart';
import 'package:getasan_app/features/lapor_kelahiran/presentation/page/input_data_ayah_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InputLaporanKelahiranPage extends HookConsumerWidget {
  const InputLaporanKelahiranPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useFormKey = useState(GlobalKey<FormState>());

    final useNoKkCtrl = useTextEditingController();
    final useNamaBayiCtrl = useTextEditingController();
    final useAnakKeCtrl = useTextEditingController();
    final useTempatLahirCtrl = useTextEditingController();

    final useJenisKelamin = useState<String?>(null);
    final useDate = useState(DateTime.now());
    final useTime = useState(TimeOfDay.now());

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
                        'Data Bayi',
                        style: AppTexts.extraBold.copyWith(
                          fontSize: 19,
                          color: AppColors.primary,
                        ),
                      ),
                      Gaps.v16,
                      TextInput(
                        controller: useNoKkCtrl,
                        hint: 'No Kartu Keluarga',
                      ),
                      Gaps.v16,
                      TextInput(
                        controller: useNamaBayiCtrl,
                        hint: 'Nama Bayi',
                      ),
                      Gaps.v16,
                      TextInput(
                        controller: useAnakKeCtrl,
                        hint: 'Anak ke...',
                      ),
                      Gaps.v16,
                      DropdownInput<String>(
                        hint: 'Jenis Kelamin',
                        items: const [
                          DropdownMenuItem(
                            value: 'L',
                            child: Text('Laki-laki'),
                          ),
                          DropdownMenuItem(
                            value: 'P',
                            child: Text('Perempuan'),
                          ),
                        ],
                        onChanged: (selected) {
                          useJenisKelamin.value = selected;
                        },
                      ),
                      Gaps.v16,
                      InputJam(
                        hint: "Jam Kelahiran",
                        onTimeSelected: (timeSelected) {
                          useTime.value = timeSelected;
                        },
                      ),
                      Gaps.v16,
                      TextInput(
                        controller: useTempatLahirCtrl,
                        hint: 'Tempat Lahir',
                      ),
                      Gaps.v16,
                      DateInput(
                        hint: '(tgl lahir)',
                        onDateSelected: (dateSelected) {
                          useDate.value = dateSelected;
                        },
                      ),
                      Gaps.v36,
                      PrimaryButton(
                        label: 'Berikutnya',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const InputDataAyahPage(),
                            ),
                          );
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
