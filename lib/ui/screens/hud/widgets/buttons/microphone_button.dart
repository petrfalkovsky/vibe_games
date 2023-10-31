import 'package:flutter/material.dart';
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/shared/shared_exports.dart';

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
          width: sdpPX(context, 2),
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
          width: sdpPX(context, 2),
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
          width: sdpPX(context, 2),
        ),
      );
    }

    return ButtonAnimator(
      child: GestureDetector(
        onTap: toggleMicrophone,
        child: Container(
          width: sdpPX(context, 105),
          height: sdpPX(context, 105),
          decoration: buttonDecoration,
          child: Center(
            child: (buttonState == 2)
                ? AppIcons.svgWidget(
                    AppIcons.micOff,
                    height: sdpPX(context, 50),
                  )
                : AppIcons.svgWidget(
                    AppIcons.mic,
                    height: sdpPX(context, 44),
                  ),
          ),
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
