import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';
import 'package:getasan_app/features/common/constant/style/app_texts.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';

class LaporanTile extends ConsumerStatefulWidget {
  final String title;
  final String date;
  final String no;
  final Widget? child;
  final bool isExpanded;
  const LaporanTile({
    super.key,
    required this.title,
    required this.date,
    required this.no,
    this.child,
    this.isExpanded = false,
  });

  @override
  ConsumerState<LaporanTile> createState() => _LaporanTileState();
}

class _LaporanTileState extends ConsumerState<LaporanTile> {
  late bool isExpanded = widget.isExpanded;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: AppTexts.interItalic.copyWith(
        color: AppColors.primary300,
        fontSize: 11.sp,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.w),
          border: Border.all(color: AppColors.primary),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.no),
            Gaps.h8,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title),
                  Text(widget.date),
                  if (isExpanded) Gaps.v16,
                  if (isExpanded) widget.child ?? const SizedBox.shrink(),
                ],
              ),
            ),
            Gaps.h8,
            IconButton(
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              padding: EdgeInsets.zero,
              icon: Icon(
                isExpanded
                    ? Icons.keyboard_arrow_up_rounded
                    : Icons.keyboard_arrow_down_rounded,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
