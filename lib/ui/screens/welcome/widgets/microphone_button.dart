import 'package:flutter/material.dart';
import 'package:vibe_games/ui/shared/all_shared.dart';
import 'package:vibe_games/ui/shared/constants/app_colors.dart';

class MicrophoneButton extends StatefulWidget {
  const MicrophoneButton({super.key});

  @override
  State<MicrophoneButton> createState() => _MicrophoneButtonState();
}

class _MicrophoneButtonState extends State<MicrophoneButton> {
  int buttonState = 0; // 0 - не нажата, 1 - первое нажатие, 2 - второе нажатие

  @override
  Widget build(BuildContext context) {
    late BoxDecoration buttonDecoration;

    if (buttonState == 0) {
      buttonDecoration = BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            AppColors.accent[1]?.withOpacity(0.6) ?? Colors.transparent,
            AppColors.accent[1]?.withOpacity(0.3) ?? Colors.transparent,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        border: Border.all(
          color: AppColors.accent[5] ?? Colors.transparent,
          width: 2.0,
        ),
      );
    } else if (buttonState == 1) {
      buttonDecoration = BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            AppColors.accent[6]?.withOpacity(0.6) ?? Colors.transparent,
            AppColors.accent[6]?.withOpacity(0.3) ?? Colors.transparent,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        border: Border.all(
          color: AppColors.accent,
          width: 2.0,
        ),
      );
    } else if (buttonState == 2) {
      buttonDecoration = BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            const Color(0xFF482575).withOpacity(0.5),
            const Color(0xFF482575).withOpacity(0.1)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        border: Border.all(
          color: AppColors.accent[5] ?? Colors.transparent,
          width: 2.0,
        ),
      );
    }

    return GestureDetector(
      onTap: toggleMicrophone,
      child: Container(
        width: 105,
        height: 105,
        decoration: buttonDecoration,
        child: Center(
          child: (buttonState == 2)
              ? AppIcons.svgWidget(AppIcons.micOff, height: 50)
              : AppIcons.svgWidget(AppIcons.mic, height: 44),
        ),
      ),
    );
  }

  void toggleMicrophone() {
    setState(() {
      if (buttonState == 2) {
        buttonState = 0;
      } else {
        buttonState++;
      }
    });
  }
}
