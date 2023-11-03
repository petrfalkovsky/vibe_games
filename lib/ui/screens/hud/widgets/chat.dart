import 'package:flutter/material.dart';
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/shared/shared_exports.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
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
              trackColor: AppColors.background[8]?.withOpacity(0.3),
              thumbColor: AppColors.background,
              child: Padding(
                padding: EdgeInsets.only(right: sdpPX(context, 32)),
                child: Container(
                  decoration: BoxDecoration(
                    color: isChatTapped
                        ? Colors.transparent
                        : AppColors.background[8]?.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(sdpPX(context, 30)),
                  ),
                  height: sdpPX(context, 316),
                  child: ListView.builder(
                    itemExtent: sdpPX(context, 30),
                    controller: _scrollController,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      int colorIndex = index % textColors.length;
                      String itemText =
                          'Получай за каждый отыгранный час билет участника и получи шанс выиграть крутые призы!';

                      return ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context)
                            .copyWith(scrollbars: false),
                        child: ListTile(
                          dense: true,
                          minVerticalPadding: 0,
                          visualDensity: VisualDensity(
                              horizontal: 0, vertical: sdpPX(context, -2)),
                          title: RichText(
                            text: TextSpan(
                              text: '[Розыгрыш] ',
                              style: TextStyle(
                                color: textColors[colorIndex],
                                fontSize: sdpPX(context, 25),
                                fontWeight: FontWeight.w500,
                                fontFamily: AppStyles.ttNorms,
                                shadows: const [
                                  Shadow(
                                    blurRadius: 2.0,
                                    color: Colors.black,
                                    offset: Offset(-1.0, 0.5),
                                  ),
                                ],
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: itemText,
                                  style: TextStyle(
                                    color: AppColors.accent,
                                    fontSize: sdpPX(context, 25),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: AppStyles.ttNorms,
                                    shadows: const [
                                      Shadow(
                                        blurRadius: 2.0,
                                        color: Colors.black,
                                        offset: Offset(-1.0, 0.5),
                                      ),
                                    ],
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
