import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/screens/welcome/welcome_exports.dart';
import 'package:vibe_games/ui/shared/all_shared.dart';
import 'package:vibe_games/ui/shared/constants/app_colors.dart';

class UpperStatusBar extends StatefulWidget {
  const UpperStatusBar({super.key});

  @override
  State<UpperStatusBar> createState() => _UpperStatusBarState();
}

class _UpperStatusBarState extends State<UpperStatusBar> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Positioned(
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Visibility(
                  visible: Get.find<WelcomeController>().isVisibleStar.value,
                  child: Transform.translate(
                    offset: Offset(sdpPX(context, 24), 0),
                    child: Row(
                      children: [
                        Transform.translate(
                          offset: const Offset(8, 0),
                          child: AppIcons.svgWidget(
                              AppIcons.leftPartOfStatusbar,
                              height: sdpPX(context, 58),
                              color: AppColors.background[2]),
                        ),
                        Stack(
                          children: [
                            Container(
                              color: AppColors.background[2],
                              child: SizedBox(
                                height: sdpPX(context, 58),
                                child: Row(
                                  children: [
                                    AppIcons.svgWidget(
                                      AppIcons.star,
                                      height: sdpPX(context, 36),
                                    ),
                                    sdpPX(context, 30).w,
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: sdpPX(context, 22),
                                  left: sdpPX(context, 13)),
                              child: Text(
                                '5',
                                style: TextStyle(
                                  color: AppColors.text,
                                  fontSize: sdpPX(context, 16),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(1, 0),
                  child: AppIcons.svgWidget(
                    AppIcons.leftPartOfStatusbar,
                    height: sdpPX(context, 58),
                  ),
                ),
                GestureDetector(
                  onTap: Get.find<WelcomeController>().toggleAreaVisibility,
                  child: Container(
                    color: AppColors.accent[1],
                    child: Stack(
                      children: [
                        SizedBox(
                          height: sdpPX(context, 58),
                          child: Row(
                            children: [
                              sdpPX(context, 4).w,
                              AppIcons.svgWidget(
                                AppIcons.rub,
                                height: sdpPX(context, 20),
                                color: AppColors.accent.withOpacity(0.3),
                              ),
                              sdpPX(context, 8).w,
                              BalanceStatusBar(
                                text: '1234567891',
                                fontSize: sdpPX(context, 27.5),
                              ),
                              sdpPX(context, 4).w,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(-1, 0),
                  child: AppIcons.svgWidget(
                    AppIcons.rightPartOfStatusbar,
                    height: sdpPX(context, 58),
                    color: AppColors.accent[1],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BalanceStatusBar extends StatelessWidget {
  final String text;
  final double fontSize;

  const BalanceStatusBar({
    Key? key,
    required this.text,
    required this.fontSize,
  }) : super(key: key);

  double calculateFontSize() {
    if (text.length > 25) {
      return 12.0;
    } else if (text.length > 21) {
      return 16.0;
    } else if (text.length > 18) {
      return 20.0;
    } else {
      return 26.0;
    }
  }

  String formatText() {
    if (text.length > 25) {
      return '${text.substring(0, 23)}..';
    } else {
      return text;
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedText = formatText();

    return Text(
      formattedText,
      style: TextStyle(
        color: AppColors.text[1],
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
      ),
    );
  }
}
