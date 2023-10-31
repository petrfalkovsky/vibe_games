import 'package:flutter/material.dart';
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/shared/shared_exports.dart';

class ChatButton extends StatefulWidget {
  const ChatButton({Key? key}) : super(key: key);

  @override
  State<ChatButton> createState() => _ChatButtonState();
}

class _ChatButtonState extends State<ChatButton> {
  int buttonState = 0; // 0 - не нажата, 1 - первое нажатие, 2 - второе нажатие

  @override
  Widget build(BuildContext context) {
    late BoxDecoration buttonDecoration;
    Widget? icon;

    if (buttonState == 0) {
      buttonDecoration = BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(sdpPX(context, 20)),
          bottomRight: Radius.circular(sdpPX(context, 20)),
        ),
        color: AppColors.background[1],
        border: Border.all(
          color: Colors.transparent,
          width: sdpPX(context, 0),
        ),
      );
      icon = AppIcons.svgWidget(
        AppIcons.chat,
        height: sdpPX(context, 44),
      );
    } else if (buttonState == 1) {
      buttonDecoration = BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(sdpPX(context, 20)),
          bottomRight: Radius.circular(sdpPX(context, 20)),
        ),
        color: AppColors.background[1],
        border: Border.all(
          color: Colors.transparent,
          width: sdpPX(context, 0),
        ),
      );
      icon = AppIcons.svgWidget(
        AppIcons.chatOk,
        height: sdpPX(context, 44),
      );
    } else if (buttonState == 2) {
      buttonDecoration = BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(sdpPX(context, 20)),
          bottomRight: Radius.circular(sdpPX(context, 20)),
        ),
        color: AppColors.background[1],
        border: Border.all(
          color: Colors.transparent,
          width: sdpPX(context, 0),
        ),
      );
      icon = AppIcons.svgWidget(
        AppIcons.chatClose,
        height: sdpPX(context, 44),
      );
    }

    return ButtonAnimator(
      child: GestureDetector(
        onTap: toggleMicrophone,
        child: Container(
          transform: Matrix4.skewX(-0.2),
          width: sdpPX(context, 82),
          height: sdpPX(context, 82),
          decoration: buttonDecoration,
          child: Center(
            child: Container(
              margin: EdgeInsets.only(right: sdpPX(context, 8)),
              transform: Matrix4.skewX(0.2),
              child: icon,
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

class ChatButtonWrapper extends StatelessWidget {
  const ChatButtonWrapper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sdpPX(context, 600),
      height: sdpPX(context, 600),
      child: Stack(
        children: [
          Positioned(
            top: sdpPX(context, 130),
            child: Container(
              width: sdpPX(context, 310),
              height: sdpPX(context, 310),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.accent[1] ?? Colors.transparent,
                  width: sdpPX(context, 2),
                ),
              ),
            ),
          ),
          Positioned(
            top: sdpPX(context, 354),
            left: sdpPX(context, 210),
            child: const ChatButton(),
          ),
        ],
      ),
    );
  }
}
