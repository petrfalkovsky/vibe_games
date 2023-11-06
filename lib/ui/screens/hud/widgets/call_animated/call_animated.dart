import 'package:flutter/material.dart';
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/shared/shared_exports.dart';

class CallAnimated extends StatefulWidget {
  final BuildContext context;
  const CallAnimated({Key? key, required this.context}) : super(key: key);

  @override
  State<CallAnimated> createState() => _CallAnimatedState();
}

class _CallAnimatedState extends State<CallAnimated>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> _width;
  late Animation<double> _height;
  late Animation<double> _opacity;
  late Animation<double> _opacityText;
  late Animation<double> _opacitySkipButton;
  late Animation<double> _opacityIosIcon;
  late Animation<double> _opacityAnswer;
  late Animation<EdgeInsets> _padding;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _width = Tween<double>(
      begin: 544,
      end: 544,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.33, curve: Curves.ease),
      ),
    );

    _height = Tween<double>(
      begin: 124,
      end: 124,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.33, 0.66, curve: Curves.ease),
      ),
    );

    _opacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.66, 1.0, curve: Curves.ease),
      ),
    );

    _opacityText = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 1.0, curve: Curves.ease),
      ),
    );

    _opacitySkipButton = Tween<double>(
      begin: 0.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 1.0, curve: Curves.ease),
      ),
    );

    _opacityIosIcon = Tween<double>(
      begin: 0.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 1.0, curve: Curves.ease),
      ),
    );

    _opacityAnswer = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 1.0, curve: Curves.ease),
      ),
    );

    _padding = EdgeInsetsTween(
      begin: EdgeInsets.only(
        left: sdpPX(widget.context, 12),
        right: sdpPX(widget.context, 20),
        top: sdpPX(widget.context, 12),
        bottom: sdpPX(widget.context, 12),
      ),
      end: EdgeInsets.only(
        left: sdpPX(widget.context, 12),
        right: sdpPX(widget.context, 20),
        top: sdpPX(widget.context, 12),
        bottom: sdpPX(widget.context, 12),
      ),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.250, 0.375, curve: Curves.ease),
      ),
    );

    _width.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  void _changeContainerSize(
    double width,
    double height,
    double opacity,
    double opacityText,
    double opacitySkipButton,
    double opacityIosIcon,
    double opacityAnswer,
    EdgeInsets padding,
  ) {
    if (controller.isAnimating) {
      controller.stop();
    }
    setState(() {
      _width = Tween<double>(
        begin: _width.value,
        end: width,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.0, 0.125, curve: Curves.ease),
        ),
      );

      _height = Tween<double>(
        begin: _height.value,
        end: height,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.125, 0.250, curve: Curves.ease),
        ),
      );

      _opacity = Tween<double>(
        begin: _opacity.value,
        end: opacity,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.66, 1.0, curve: Curves.ease),
        ),
      );

      _opacityText = Tween<double>(
        begin: _opacityText.value,
        end: opacityText,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.0, 1.0, curve: Curves.ease),
        ),
      );

      _opacitySkipButton = Tween<double>(
        begin: _opacitySkipButton.value,
        end: opacitySkipButton,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.0, 1.0, curve: Curves.ease),
        ),
      );

      _opacityIosIcon = Tween<double>(
        begin: _opacityIosIcon.value,
        end: opacityIosIcon,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.0, 1.0, curve: Curves.ease),
        ),
      );

      _opacityAnswer = Tween<double>(
        begin: _opacityAnswer.value,
        end: opacityAnswer,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.0, 1.0, curve: Curves.ease),
        ),
      );

      _padding = EdgeInsetsTween(
        begin: EdgeInsets.only(
            left: sdpPX(context, 12), right: sdpPX(context, 12)),
        end: EdgeInsets.only(
            left: sdpPX(context, 12), right: sdpPX(context, 20)),
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(
            0.250,
            0.375,
            curve: Curves.ease,
          ),
        ),
      );
    });
    controller.reset();
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: sdpPX(context, 12)),
      child: Transform.translate(
        offset: Offset(sdpPX(context, -33), 0),
        child: Container(
          alignment: Alignment.centerLeft,
          child: Opacity(
            opacity: _opacity.value,
            child: Container(
              width: sdpPX(context, _width.value),
              height: sdpPX(context, _height.value),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.accent[7] ?? Colors.transparent,
                    AppColors.accent[8]?.withOpacity(0.9) ?? Colors.transparent,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(sdpPX(context, 100)),
              ),
              child: Stack(
                children: [
                  Padding(
                    // здесь не нужно использовать sdp
                    padding: _padding.value,
                    child: Stack(
                      children: [
                        // текст внутри (имя, фамилия)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Opacity(
                            opacity: _opacityText.value,
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: sdpPX(context, 126)),
                              child: SizedBox(
                                width: sdpPX(context, 180),
                                child: Text.rich(
                                  TextSpan(
                                    text: 'Михал Палыч\n',
                                    style: TextStyle(
                                      color: AppColors.accent,
                                      fontSize: sdpPX(context, 25),
                                      fontWeight: FontWeight.w500,
                                      fontFamily: AppStyles.ttNorms,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Терентьев',
                                        style: TextStyle(
                                          color: AppColors.accent,
                                          fontSize: sdpPX(context, 25),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: AppStyles.ttNorms,
                                        ),
                                      ),
                                    ],
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // кнопка положить трубку
                        Align(
                          alignment: Alignment.centerRight,
                          child: Opacity(
                            opacity: _opacitySkipButton.value,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                /// положить трубку и счетчик времени
                                ButtonAnimator(
                                  child: Container(
                                    width: sdpPX(context, 84),
                                    height: sdpPX(context, 84),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.background[9] ??
                                          Colors.transparent,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AppIcons.svgWidget(
                                          AppIcons.callSkip,
                                          width: sdpPX(context, 35.5),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: sdpPX(context, 13)),
                                          child: Text(
                                            '01:34',
                                            style: TextStyle(
                                              color: AppColors.accent,
                                              fontSize: sdpPX(context, 20),
                                              fontWeight: FontWeight.w500,
                                              fontFamily: AppStyles.ttNorms,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // блок ответить на звонок
                  Align(
                    alignment: Alignment.centerRight,
                    child: Opacity(
                      opacity: _opacityAnswer.value,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          /// положить трубку
                          ButtonAnimator(
                            child: GestureDetector(
                              // бросить трубку все исчезает
                              // todo в сайдбар добавить
                              onTap: () => _changeContainerSize(
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                EdgeInsets.only(
                                  left: sdpPX(widget.context, 12),
                                  right: sdpPX(widget.context, 20),
                                  top: sdpPX(widget.context, 12),
                                  bottom: sdpPX(widget.context, 12),
                                ),
                              ),
                              child: Container(
                                width: sdpPX(context, 84),
                                height: sdpPX(context, 84),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.background[9] ??
                                      Colors.transparent,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AppIcons.svgWidget(
                                      AppIcons.callSkip,
                                      width: sdpPX(context, 44.5),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          // кнопка ответить на звонок
                          ButtonAnimator(
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: sdpPX(context, 12),
                                right: sdpPX(context, 20),
                              ),
                              child: ButtonAnimator(
                                child: Container(
                                  width: sdpPX(context, 84),
                                  height: sdpPX(context, 84),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.background[10] ??
                                        Colors.transparent,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        // в третье состояние переводим (среднее)
                                        onTap: () => _changeContainerSize(
                                          440,
                                          124,
                                          1,
                                          1,
                                          1,
                                          0,
                                          0,
                                          EdgeInsets.only(
                                            left: sdpPX(widget.context, 12),
                                            right: sdpPX(widget.context, 20),
                                            top: sdpPX(widget.context, 12),
                                            bottom: sdpPX(widget.context, 12),
                                          ),
                                        ),
                                        child: AppIcons.svgWidget(
                                          AppIcons.callAnswer,
                                          width: sdpPX(context, 35.5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // аватар
                  ButtonAnimator(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: sdpPX(context, 12)),
                        child: ClipOval(
                          child: GestureDetector(
                            // переход во третье состояние (компактное)
                            onTap: () => _changeContainerSize(
                              188,
                              140,
                              1,
                              0,
                              0,
                              1,
                              0,
                              const EdgeInsets.all(8),
                            ),
                            child: Image.asset(
                              AppIcons.callAvatar,
                              width: sdpPX(context, 100),
                              height: sdpPX(context, 100),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // фон затемняющий миниатюру
                  Opacity(
                    opacity: _opacityIosIcon.value,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(sdpPX(context, 100)),
                        gradient: LinearGradient(
                          colors: [
                            AppColors.background[2]?.withOpacity(0.6) ??
                                Colors.transparent,
                            AppColors.background[2]?.withOpacity(0.3) ??
                                Colors.transparent,
                          ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        ),
                      ),
                    ),
                  ),

                  // иконка раскрыть
                  Opacity(
                    opacity: _opacityIosIcon.value,
                    child: Padding(
                      // не нужно исползовать sdp
                      padding: _padding.value,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.accent,
                          size: sdpPX(context, 36),
                        ),
                      ),
                    ),
                  ),

                  // таймер разговора
                  Padding(
                    // ну нужно использовть sdp
                    padding: _padding.value,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Opacity(
                        opacity: _opacityIosIcon.value,
                        child: Padding(
                          padding: EdgeInsets.only(left: sdpPX(context, 26)),
                          child: Text(
                            '01:34',
                            style: TextStyle(
                              color: AppColors.accent,
                              fontSize: sdpPX(context, 20),
                              fontWeight: FontWeight.w500,
                              fontFamily: AppStyles.ttNorms,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
