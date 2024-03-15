import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';

class AppBottomNavbar extends StatefulWidget {
  const AppBottomNavbar({
    super.key,
  });

  @override
  State<AppBottomNavbar> createState() => _AppBottomNavbarState();
}

class _AppBottomNavbarState extends State<AppBottomNavbar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.secondary,
      onTap: (value) => setState(() {
        currentIndex = value;
      }),
      items: [
        _buildNavBarItem(
          icon: 'assets/icons/ic_home.png',
          height: 29.w,
        ),
        _buildNavBarItem(
          icon: 'assets/icons/ic_nav_camat.png',
          width: 28.w,
        ),
        _buildNavBarItem(
          icon: 'assets/icons/ic_nav_kegiatan.png',
          height: 29.w,
        ),
        _buildNavBarItem(
          icon: 'assets/icons/ic_nav_kelahiran.png',
          width: 35.w,
        ),
        _buildNavBarItem(
          icon: 'assets/icons/ic_nav_kematian.png',
          height: 28.w,
        ),
      ],
    );
  }

  BottomNavigationBarItem _buildNavBarItem({
    required String icon,
    double? height,
    double? width,
  }) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        icon,
        width: width,
        height: height,
      ),
      activeIcon: Image.asset(
        icon,
        width: width,
        height: height,
        color: AppColors.secondary,
      ),
      label: '',
    );
  }
}
