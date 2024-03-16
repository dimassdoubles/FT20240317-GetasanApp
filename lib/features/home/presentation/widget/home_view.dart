import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';
import 'package:getasan_app/features/common/constant/style/app_texts.dart';
import 'package:getasan_app/features/common/presentation/widget/app_card.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';
import 'package:getasan_app/features/lapor_camat/presentation/page/lapor_camat_page.dart';
import 'package:getasan_app/features/lapor_kegiatan_desa/presentation/page/lapor_kegiatan_desa_page.dart';
import 'package:getasan_app/features/lapor_kelahiran/presentation/page/lapor_kelahiran_page.dart';
import 'package:getasan_app/features/lapor_kematian/presentation/page/lapor_kematian_page.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                AppCard(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LaporCamatPage(),
                      ),
                    );
                  },
                  title: 'Lapor Camat',
                  icon: 'assets/icons/ic_lapor_camat.png',
                ),
                Gaps.v16,
                AppCard(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LaporKegiatanDesaPage(),
                      ),
                    );
                  },
                  title: 'Laporan Kegiatan Desa',
                  icon: 'assets/icons/ic_laporan_kegiatan_desa.png',
                ),
                Gaps.v16,
                AppCard(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LaporKelahiranPage(),
                      ),
                    );
                  },
                  title: 'Laporan Kelahiran',
                  icon: 'assets/icons/ic_laporan_kelahiran.png',
                ),
                Gaps.v16,
                AppCard(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LaporKematianPage(),
                      ),
                    );
                  },
                  title: 'Laporan Kematian',
                  icon: 'assets/icons/ic_laporan_kematian.png',
                ),
                Gaps.v16,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
