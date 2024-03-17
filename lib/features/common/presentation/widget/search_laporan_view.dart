import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';
import 'package:getasan_app/features/common/constant/style/app_size.dart';
import 'package:getasan_app/features/common/constant/style/app_texts.dart';
import 'package:getasan_app/features/common/presentation/widget/app_back_button.dart';
import 'package:getasan_app/features/common/presentation/widget/button/primary_button.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';
import 'package:getasan_app/features/common/presentation/widget/input/dropdown_input.dart';

class SearchLaporanView extends StatelessWidget {
  final String icon;
  final String title;
  final Function(int bulan, int tahun)? onSearch;
  final VoidCallback? onAdd;
  const SearchLaporanView({
    super.key,
    required this.icon,
    required this.title,
    this.onSearch,
    this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.pagePadding,
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
                        child: Hero(
                          tag: 'iconCard:$icon',
                          child: Image.asset(
                            icon,
                            height: 52.w,
                          ),
                        ),
                      ),
                      Gaps.v24,
                      Hero(
                        tag: 'titleCard:$title',
                        child: DefaultTextStyle(
                          style: AppTexts.extraBold.copyWith(
                            fontSize: 35,
                            color: AppColors.primary,
                          ),
                          child: Text(
                            title,
                          ),
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
                    onTap: () {
                      onSearch?.call(1, 1);
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FloatingActionButton(
                      onPressed: () {
                        onAdd?.call();
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
