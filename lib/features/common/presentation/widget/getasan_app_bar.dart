import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';

class GetasanAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isCenterLogo;
  final Widget? action;
  const GetasanAppBar({
    super.key,
    this.isCenterLogo = false,
    this.action,
  });

  static final paddingSize = 16.w;
  static final logoHeight = 36.w;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: paddingSize),
      child: Material(
        color: AppColors.white,
        elevation: 6,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(paddingSize),
            child: Row(
              mainAxisAlignment: action == null
                  ? (isCenterLogo
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.start)
                  : MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/logos/logo_outline_text_samping.png',
                  width: 137.w,
                  height: logoHeight,
                ),
                if (action != null)
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: logoHeight,
                      minHeight: logoHeight,
                    ),
                    child: action,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + 3 * paddingSize + logoHeight);
}
