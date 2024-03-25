import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/auth/presentation/controller/auth_controller.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';
import 'package:getasan_app/features/common/constant/style/app_size.dart';
import 'package:getasan_app/features/common/constant/style/app_texts.dart';
import 'package:getasan_app/features/common/presentation/widget/button/primary_button.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';
import 'package:getasan_app/features/setting/presentation/widgets/setting_header.dart';
import 'package:getasan_app/features/setting/presentation/widgets/setting_tile.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.read(authControllerProvider);
    final currentUser = ref.watch(authController.currentUserProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.chevron_left),
        ),
        title: Text(
          'Pengaturan',
          style: AppTexts.bold.copyWith(fontSize: 24),
        ),
      ),
      body: Column(
        children: [
          const SettingHeader(),
          const Divider(color: AppColors.primary200),
          Gaps.v24,
          SettingTile(
            icon: Icons.email,
            label: currentUser?.email ?? '',
          ),
          Gaps.v24,
          SettingTile(
            icon: Icons.place,
            label: '${currentUser?.desa.name} (asal desa)',
          ),
          Gaps.v24,
          const SettingTile(
            icon: Icons.notifications_rounded,
            label: 'Notifikasi',
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.fromLTRB(
              AppSize.pagePadding,
              16.w,
              AppSize.pagePadding,
              AppSize.pagePadding,
            ),
            child: PrimaryButton(
              label: 'Logout',
              onTap: () {},
              backgroundColor: AppColors.danger,
            ),
          ),
        ],
      ),
    );
  }
}
