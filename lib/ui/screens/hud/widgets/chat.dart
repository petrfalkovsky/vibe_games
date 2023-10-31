import 'package:flutter/material.dart';
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/shared/shared_exports.dart';

class Chat extends StatefulWidget {
  Chat({Key? key});

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final ScrollController _scrollController = ScrollController();
  bool isChatTapped = false;

  final List<Color> textColors = [
    AppColors.accent,
    AppColors.accent[1] ?? Colors.transparent,
    AppColors.accent[2] ?? Colors.transparent,
    AppColors.accent[3] ?? Colors.transparent,
    AppColors.accent[4] ?? Colors.transparent,
    AppColors.accent[5] ?? Colors.transparent,
    AppColors.accent[6] ?? Colors.transparent,
  ];

  void toggleChatState() {
    setState(() {
      isChatTapped = !isChatTapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: sdpPX(context, 400),
          right: sdpPX(context, 450),
          top: sdpPX(context, 20)),
      child: Column(
        children: [
          GestureDetector(
            onTap: toggleChatState,
            child: RawScrollbar(
              padding: EdgeInsets.only(
                  right: sdpPX(context, 0),
                  top: sdpPX(context, 16),
                  bottom: sdpPX(context, 16)),
              controller: _scrollController,
              thumbVisibility: isChatTapped ? false : true,
              trackVisibility: isChatTapped ? false : true,
              thickness: sdpPX(context, 16),
              radius: Radius.circular(sdpPX(context, 30)),
              trackRadius: Radius.circular(sdpPX(context, 30)),
              trackColor: AppColors.background[8],
              thumbColor: AppColors.background,
              child: Padding(
                padding: EdgeInsets.only(
                    right: sdpPX(context, 32),
                    top: sdpPX(context, 0),
                    bottom: sdpPX(context, 0)),
                child: Container(
                  decoration: BoxDecoration(
                    color: isChatTapped
                        ? Colors.transparent
                        : AppColors.background[8],
                    borderRadius: BorderRadius.circular(sdpPX(context, 30)),
                  ),
                  height: sdpPX(context, 350),
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      int colorIndex = index % textColors.length;

                      return ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context)
                            .copyWith(scrollbars: false),
                        child: ListTile(
                          title: RichText(
                            text: TextSpan(
                              text: '[Розыгрыш] ',
                              style: TextStyle(
                                color: textColors[colorIndex],
                                fontSize: sdpPX(context, 25),
                                fontWeight: FontWeight.w500,
                                fontFamily: AppStyles.ttNorms,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      'Получай за каждый отыгранный час билет участника и получи шанс выиграть крутые призы!',
                                  style: TextStyle(
                                    color: AppColors
                                        .accent, // Style for the remaining text
                                    fontSize: sdpPX(context, 25),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: AppStyles.ttNorms,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
