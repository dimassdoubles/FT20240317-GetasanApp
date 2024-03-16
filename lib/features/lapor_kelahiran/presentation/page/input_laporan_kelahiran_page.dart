import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';
import 'package:getasan_app/features/common/constant/style/app_texts.dart';
import 'package:getasan_app/features/common/presentation/widget/app_back_button.dart';
import 'package:getasan_app/features/common/presentation/widget/button/primary_button.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';
import 'package:getasan_app/features/common/presentation/widget/input/date_input.dart';
import 'package:getasan_app/features/common/presentation/widget/input/dropdown_input.dart';
import 'package:getasan_app/features/common/presentation/widget/input/text_input.dart';
import 'package:getasan_app/features/lapor_kelahiran/presentation/page/input_data_ayah_page.dart';

class InputLaporanKelahiranPage extends StatelessWidget {
  const InputLaporanKelahiranPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBackButton(context),
              Gaps.v36,
              Text(
                'Data Bayi',
                style: AppTexts.extraBold.copyWith(
                  fontSize: 19,
                  color: AppColors.primary,
                ),
              ),
              Gaps.v16,
              const TextInput(hint: 'No Kartu Keluarga'),
              Gaps.v16,
              const TextInput(hint: 'Nama Bayi'),
              Gaps.v16,
              const TextInput(hint: 'Anak ke...'),
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
                onChanged: (selected) => debugPrint(
                  selected.toString(),
                ),
              ),
              Gaps.v16,
              const TextInput(hint: 'Jam kelahiran'),
              Gaps.v16,
              const TextInput(hint: 'Tempat Lahir'),
              Gaps.v16,
              const DateInput(
                hint: '(tgl lahir)',
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
            ],
          ),
        ),
      ),
    );
  }
}
