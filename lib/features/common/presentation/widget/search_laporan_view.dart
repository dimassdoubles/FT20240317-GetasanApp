import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';
import 'package:getasan_app/features/common/constant/style/app_size.dart';
import 'package:getasan_app/features/common/constant/style/app_texts.dart';
import 'package:getasan_app/features/common/presentation/widget/app_back_button.dart';
import 'package:getasan_app/features/common/presentation/widget/button/primary_button.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';
import 'package:getasan_app/features/common/presentation/widget/input/dropdown_input.dart';

class SearchLaporanView extends StatefulWidget {
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
  State<SearchLaporanView> createState() => _SearchLaporanViewState();
}

class _SearchLaporanViewState extends State<SearchLaporanView> {
  List<int> generateYear(int from) {
    final currentYear = DateTime.now().year;
    final List<int> years = [];

    for (int year = currentYear; year >= from; year--) {
      years.add(year);
    }

    return years;
  }

  int bulan = 0;
  int tahun = 0;

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
                          tag: 'iconCard:${widget.icon}',
                          child: Image.asset(
                            widget.icon,
                            height: 52.w,
                          ),
                        ),
                      ),
                      Gaps.v24,
                      Hero(
                        tag: 'titleCard:${widget.title}',
                        child: DefaultTextStyle(
                          style: AppTexts.extraBold.copyWith(
                            fontSize: 35,
                            color: AppColors.primary,
                          ),
                          child: Text(
                            widget.title,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      DropdownInput<int>(
                        hint: 'Tahun',
                        items: [
                          ...generateYear(2020).map(
                            (year) => DropdownMenuItem<int>(
                              value: year,
                              child: Text('$year'),
                            ),
                          ),
                        ],
                        onChanged: (selected) => setState(() {
                          if (selected != null) {
                            tahun = selected;
                          }
                        }),
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
                        onChanged: (selected) => setState(() {
                          if (selected != null) {
                            bulan = selected;
                          }
                        }),
                      ),
                    ],
                  ),
                  PrimaryButton(
                    label: 'Cari',
                    onTap: () {
                      widget.onSearch?.call(bulan, tahun);
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FloatingActionButton(
                      onPressed: () {
                        widget.onAdd?.call();
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
