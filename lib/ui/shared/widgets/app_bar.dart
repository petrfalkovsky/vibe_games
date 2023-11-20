import 'package:flutter/material.dart';
import 'package:vibe_games/ui/shared/constants/app_colors.dart';
import 'package:vibe_games/ui/shared/constants/app_text_style.dart';

PreferredSizeWidget getStatAppBar(
  BuildContext context, {
  Color? color,
  String? text,
  Widget? title,
  bool isLeading = false,
  String? buttonText,
  List<Widget>? actions,
  double? elevation,
  String? router,
  dynamic resultBack,
  Function()? funcBack,
  int? currentNavIndex,
  bool rChange = false,
}) {
  return AppBar(
    leadingWidth: 42,
    elevation: elevation ?? .5,
    title: rChange
        ? title
        : Text(
            text ?? '',
            style: AppTextStyles.h1SemiBold,
          ),
    backgroundColor: color ?? const OtherColors().white,
    leading: Container(),
  );
}
