import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/common/constant/style/app_size.dart';
import 'package:getasan_app/features/common/presentation/widget/app_back_button.dart';
import 'package:getasan_app/features/common/presentation/widget/button/primary_button.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';
import 'package:getasan_app/features/common/presentation/widget/getasan_app_bar.dart';
import 'package:getasan_app/features/common/presentation/widget/input/image_input.dart';
import 'package:getasan_app/features/common/presentation/widget/input/text_input.dart';

class InputLaporCamatPage extends StatelessWidget {
  const InputLaporCamatPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    const ImageInput(),
                    SizedBox(
                      height: 56.h,
                    ),
                    PrimaryButton(
                      label: 'Kirim',
                      onTap: () {},
                    ),
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
