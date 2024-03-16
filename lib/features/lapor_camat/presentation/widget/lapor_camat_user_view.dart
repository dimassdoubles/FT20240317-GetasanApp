import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';
import 'package:getasan_app/features/common/constant/style/app_texts.dart';
import 'package:getasan_app/features/common/presentation/widget/app_back_button.dart';
import 'package:getasan_app/features/common/presentation/widget/button/primary_button.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';
import 'package:getasan_app/features/common/presentation/widget/input/dropdown_input.dart';
import 'package:getasan_app/features/lapor_camat/presentation/page/input_lapor_camat_page.dart';

class LaporCamatUserView extends StatelessWidget {
  const LaporCamatUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBackButton(context),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/icons/ic_lapor_camat.png',
                          height: 52.w,
                        ),
                      ),
                      Gaps.v24,
                      Text(
                        'Lapor Camat',
                        style: AppTexts.extraBold.copyWith(
                          fontSize: 35,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      DropdownInput<String>(
                        hint: 'Tahun',
                        items: const [
                          DropdownMenuItem<String>(
                            value: '2020',
                            child: Text('2020'),
                          ),
                          DropdownMenuItem<String>(
                            value: '2021',
                            child: Text('2021'),
                          ),
                          DropdownMenuItem<String>(
                            value: '2022',
                            child: Text('2022'),
                          ),
                          DropdownMenuItem<String>(
                            value: '2023',
                            child: Text('2023'),
                          ),
                          DropdownMenuItem<String>(
                            value: '2024',
                            child: Text('2024'),
                          ),
                        ],
                        onChanged: (selected) => debugPrint(selected),
                      ),
                      Gaps.v24,
                      DropdownInput<int>(
                        hint: 'Bulan',
                        items: const [
                          DropdownMenuItem(
                            value: 1,
                            child: Text('Januari'),
                          ),
                          DropdownMenuItem(
                            value: 2,
                            child: Text('Februari'),
                          ),
                          DropdownMenuItem(
                            value: 3,
                            child: Text('Maret'),
                          ),
                          DropdownMenuItem(
                            value: 4,
                            child: Text('April'),
                          ),
                          DropdownMenuItem(
                            value: 5,
                            child: Text('Mei'),
                          ),
                          DropdownMenuItem(
                            value: 6,
                            child: Text('Juni'),
                          ),
                          DropdownMenuItem(
                            value: 7,
                            child: Text('Juli'),
                          ),
                          DropdownMenuItem(
                            value: 8,
                            child: Text('Agustus'),
                          ),
                          DropdownMenuItem(
                            value: 9,
                            child: Text('September'),
                          ),
                          DropdownMenuItem(
                            value: 10,
                            child: Text('Oktober'),
                          ),
                          DropdownMenuItem(
                            value: 11,
                            child: Text('Novermber'),
                          ),
                          DropdownMenuItem(
                            value: 12,
                            child: Text('Desember'),
                          ),
                        ],
                        onChanged: (selected) => debugPrint(
                          selected.toString(),
                        ),
                      ),
                    ],
                  ),
                  PrimaryButton(
                    label: 'Cari',
                    onTap: () {},
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const InputLaporCamatPage(),
                            ));
                      },
                      shape: const CircleBorder(),
                      elevation: 0,
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.white,
                      child: Icon(
                        Icons.add,
                        size: 42.w,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
