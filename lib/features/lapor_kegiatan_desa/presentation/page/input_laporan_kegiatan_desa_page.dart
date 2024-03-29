import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/common/constant/style/app_size.dart';
import 'package:getasan_app/features/common/presentation/widget/app_back_button.dart';
import 'package:getasan_app/features/common/presentation/widget/button/primary_button.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';
import 'package:getasan_app/features/common/presentation/widget/getasan_app_bar.dart';
import 'package:getasan_app/features/common/presentation/widget/input/date_input.dart';
import 'package:getasan_app/features/common/presentation/widget/input/image_input.dart';
import 'package:getasan_app/features/common/presentation/widget/input/text_input.dart';

class InputLaporanKegiatanDesaPage extends StatelessWidget {
  const InputLaporanKegiatanDesaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GetasanAppBar(
        isCenterLogo: true,
      ),
      body: SafeArea(
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
                      const TextInput(hint: 'Nama Kegiatan'),
                      Gaps.v16,
                      const TextInput(hint: 'Penanggung jawab kegiatan'),
                      Gaps.v16,
                      const DateInput(),
                      Gaps.v16,
                      const TextInput(hint: 'Hasil Kegiatan'),
                      Gaps.v16,
                      const TextInput(hint: 'Kendala'),
                      Gaps.v16,
                      const ImageInput(),
                      SizedBox(height: 42.h),
                      PrimaryButton(
                        label: 'Kirim',
                        onTap: () {},
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
    );
  }
}
