import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';
import 'package:getasan_app/features/common/constant/style/app_texts.dart';
import 'package:getasan_app/features/common/presentation/widget/app_card.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: Container(
            padding: EdgeInsets.all(16.w),
            width: double.infinity,
            color: AppColors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/logos/logo_outline_text_samping.png',
                  width: 137.w,
                ),
                Image.asset(
                  'assets/icons/ic_hamburger.png',
                  width: 26.w,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: 56.h),
                width: 1.sw,
                height: 1.sh,
                alignment: Alignment.bottomRight,
                child: Image.asset('assets/images/home_bg.png'),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            'Sugeng Rawuh, ',
                            style: AppTexts.medium.copyWith(
                              fontSize: 19,
                              color: AppColors.primary,
                            ),
                          ),
                          Text(
                            'SALMA SHAFIRA',
                            style: AppTexts.extraBold.copyWith(
                              fontSize: 19,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 64.h,
                      ),
                      const AppCard(
                        title: 'Lapor Camat',
                        icon: 'assets/icons/ic_lapor_camat.png',
                      ),
                      Gaps.v16,
                      const AppCard(
                        title: 'Laporan Kegiatan Desa',
                        icon: 'assets/icons/ic_laporan_kegiatan_desa.png',
                      ),
                      Gaps.v16,
                      const AppCard(
                        title: 'Laporan Kelahiran',
                        icon: 'assets/icons/ic_laporan_kelahiran.png',
                      ),
                      Gaps.v16,
                      const AppCard(
                        title: 'Laporan Kematian',
                        icon: 'assets/icons/ic_laporan_kematian.png',
                      ),
                      Gaps.v16,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
