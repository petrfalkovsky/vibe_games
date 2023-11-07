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
      if (isChatTapped) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
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
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: sdpPX(context, 14)),
                    child: ListView.builder(
                      physics: isChatTapped
                          ? const NeverScrollableScrollPhysics()
                          : const AlwaysScrollableScrollPhysics(),
                      controller: _scrollController,
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        int colorIndex = index % textColors.length;
                        String itemText =
                            '[Розыгрыш] Получай за каждый отыгранный час билет участника и получи шанс выиграть крутые призы!';
                        // максимальная длина символов в строке
                        const maxLength = 300;
                        final textChunks = <String>[];

                        for (int i = 0; i < itemText.length; i += maxLength) {
                          textChunks.add(itemText.substring(
                              i,
                              i + maxLength < itemText.length
                                  ? i + maxLength
                                  : itemText.length));
                        }

                        return ScrollConfiguration(
                          behavior: ScrollConfiguration.of(context)
                              .copyWith(scrollbars: false),
                          child: Column(
                            children: textChunks.map((chunk) {
                              return Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  chunk,
                                  style: TextStyle(
                                    color: textColors[colorIndex],
                                    fontSize: sdpPX(context, 25),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: AppStyles.ttNorms,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 2.0,
                                        color: Colors.black,
                                        offset: Offset(sdpPX(context, -1),
                                            sdpPX(context, 0.5)),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      },
                    ),
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
