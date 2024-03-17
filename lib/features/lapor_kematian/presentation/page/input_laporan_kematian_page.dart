import 'package:flutter/material.dart';
import 'package:getasan_app/features/common/constant/style/app_size.dart';
import 'package:getasan_app/features/common/presentation/widget/app_back_button.dart';
import 'package:getasan_app/features/common/presentation/widget/button/primary_button.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';
import 'package:getasan_app/features/common/presentation/widget/getasan_app_bar.dart';
import 'package:getasan_app/features/common/presentation/widget/input/date_input.dart';
import 'package:getasan_app/features/common/presentation/widget/input/dropdown_input.dart';
import 'package:getasan_app/features/common/presentation/widget/input/text_input.dart';

class InputLaporanKematianPage extends StatelessWidget {
  const InputLaporanKematianPage({super.key});

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
                    const TextInput(hint: 'NIK'),
                    Gaps.v16,
                    const TextInput(hint: 'Nama Lengkap'),
                    Gaps.v16,
                    const TextInput(hint: 'Alamat Rumah'),
                    Gaps.v16,
                    const TextInput(hint: 'Tempat Lahir'),
                    Gaps.v16,
                    const DateInput(hint: '(tgl lahir)'),
                    Gaps.v16,
                    const TextInput(hint: 'Tempat Meninggal'),
                    Gaps.v16,
                    const DateInput(hint: '(tgl meninggal)'),
                    Gaps.v16,
                    const TextInput(hint: 'Nama Suami/Istri Yang Ditinggalkan'),
                    Gaps.v16,
                    const TextInput(hint: 'Nama Anak Yang Ditinggalkan'),
                    Gaps.v16,
                    DropdownInput<String>(
                      hint: 'Status Kawin',
                      items: const [
                        DropdownMenuItem(
                          value: 'Sudah Menikah',
                          child: Text('Sudah Menikah'),
                        ),
                        DropdownMenuItem(
                          value: 'Belum Menikah',
                          child: Text('Belum Menikah'),
                        ),
                        DropdownMenuItem(
                          value: 'Cerai Hidup',
                          child: Text('Cerai Hidup'),
                        ),
                        DropdownMenuItem(
                          value: 'Carai Mati',
                          child: Text('Cerai Mati'),
                        ),
                      ],
                      onChanged: (selected) => debugPrint(
                        selected.toString(),
                      ),
                    ),
                    Gaps.v36,
                    PrimaryButton(
                      label: 'Kirim Formulir',
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
