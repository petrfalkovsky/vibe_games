// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vibe_games/core/route/app_route_name.dart';
import 'package:vibe_games/core/theme/app_color.dart';
import 'package:vibe_games/feature/home/presentation/widget/for_you_destination_widget.dart';
import 'package:vibe_games/feature/home/presentation/widget/popular_destination_widget.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Coachmart properties
  TutorialCoachMark? tutorialCoachMark;
  List<TargetFocus> targets = [];

  GlobalKey mapKey = GlobalKey();
  GlobalKey sneakerKey = GlobalKey();
  GlobalKey speedometerKey = GlobalKey();
  GlobalKey gpsKey = GlobalKey();
  GlobalKey microKey = GlobalKey();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      _showTutorialCoachmark();
    });
    super.initState();
  }

  void _showTutorialCoachmark() {
    initTarget();
    tutorialCoachMark = TutorialCoachMark(
      targets: targets,
      pulseEnable: false,
      colorShadow: AppColor.primaryColor,
      onClickTarget: (target) {
        debugPrint("${target.identify}");
      },
      // hideSkip: true,
      alignSkip: Alignment.topRight,
      onFinish: () {
        debugPrint("Finish");
      },
    )..show(context: context);
  }

  void initTarget() {
    targets = [
      // карта
      TargetFocus(
        color: AppColor.black,
        paddingFocus: 20,
        identify: "map-key",
        keyTarget: mapKey,
        shape: ShapeLightFocus.RRect,
        radius: 30.0,
        contents: [
          TargetContent(
            align: ContentAlign.right,
            builder: (context, controller) {
              return Padding(
                padding: const EdgeInsets.only(top: 200),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 300,
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 18, right: 15, left: 15),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xFF644F80), Color(0xFF482575)],
                        ),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      child: RichText(
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: "Миникарта ",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: "помогает \n",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF9876C1),
                              ),
                            ),
                            TextSpan(
                              text: "ориентироваться в пространстве",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: ".\nНажатие ",
                              style: TextStyle(
                                color: Color(0xFF9876C1),
                              ),
                            ),
                            TextSpan(
                              text: "откроет меню паузы",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),

      // кроссовок
      TargetFocus(
        identify: "sneaker-key",
        keyTarget: sneakerKey,
        color: AppColor.black,
        shape: ShapeLightFocus.Circle,
        contents: [
          TargetContent(
            align: ContentAlign.left,
            builder: (context, controller) {
              return Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 200,
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 18, right: 15, left: 15),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xFF644F80), Color(0xFF482575)],
                        ),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      child: RichText(
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: "Сделай ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF9876C1),
                              ),
                            ),
                            TextSpan(
                              text: "прыжок ",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: "на ",
                              style: TextStyle(
                                color: Color(0xFF9876C1),
                              ),
                            ),
                            TextSpan(
                              text: "двойной тап ",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: "по кнопке",
                              style: TextStyle(
                                color: Color(0xFF9876C1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
      // спидометр
      TargetFocus(
        identify: "speedometer-key",
        keyTarget: speedometerKey,
        color: AppColor.black,
        shape: ShapeLightFocus.Circle,
        contents: [
          TargetContent(
            align: ContentAlign.right,
            builder: (context, controller) {
              return Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 360,
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 18, right: 15, left: 15),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xFF644F80), Color(0xFF482575)],
                        ),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      child: RichText(
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: "Это ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF9876C1),
                              ),
                            ),
                            TextSpan(
                              text: "спидометр",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: ". Он показывает текущую ",
                              style: TextStyle(
                                color: Color(0xFF9876C1),
                              ),
                            ),
                            TextSpan(
                              text: "\nскорость и пробег авто",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: ", а так же индикаторы  ",
                              style: TextStyle(
                                color: Color(0xFF9876C1),
                              ),
                            ),
                            TextSpan(
                              text: "\nповоротников, фар, зажигания и дверей",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
      // gps
      TargetFocus(
        identify: "gps-key",
        keyTarget: gpsKey,
        color: AppColor.black,
        shape: ShapeLightFocus.Circle,
        contents: [
          TargetContent(
            align: ContentAlign.left,
            builder: (context, controller) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 140),
                    child: Container(
                      width: 180,
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 18, right: 15, left: 15),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xFF644F80), Color(0xFF482575)],
                        ),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      child: RichText(
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: "Нажмите сюда",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: ", \nчтобы открыть",
                              style: TextStyle(
                                color: Color(0xFF9876C1),
                              ),
                            ),
                            TextSpan(
                              text: "GPS",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
      // микрофон
      TargetFocus(
        identify: "micro-key",
        keyTarget: microKey,
        color: AppColor.black,
        shape: ShapeLightFocus.Circle,
        contents: [
          TargetContent(
            align: ContentAlign.left,
            builder: (context, controller) {
              return Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 200,
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 18, right: 15, left: 15),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xFF644F80), Color(0xFF482575)],
                        ),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      child: RichText(
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: "Можешь выключить ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF9876C1),
                              ),
                            ),
                            TextSpan(
                              text: "микрофон, ",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: "\nесли хочешь =)",
                              style: TextStyle(
                                color: Color(0xFF9876C1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/get_started.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),

        // карта
        Positioned(
          top: 8,
          left: 30,
          child: Container(
            key: mapKey,
            height: 240,
            width: 240,
            // child: const Center(
            //     child: Text(
            //   'Карта',
            //   style: TextStyle(color: Colors.red),
            // )),
          ),
        ),

        // кроссовок
        Positioned(
          bottom: 60,
          right: 150,
          child: Container(
            key: sneakerKey,
            height: 150,
            width: 150,
            // child: const Center(
            //     child: Text(
            //   'Кроссовок',
            //   style: TextStyle(color: Colors.red),
            // )),
          ),
        ),

        // спидометр
        Positioned(
          top: 246,
          left: 104,
          child: Container(
            key: speedometerKey,
            height: 120,
            width: 120,
            // child: const Center(
            //     child: Text(
            //   'Спидометр',
            //   style: TextStyle(color: Colors.red),
            // )),
          ),
        ),

        // gps
        Positioned(
          top: 250,
          right: 460,
          child: Container(
            key: gpsKey,
            height: 176,
            width: 176,
            // child: const Center(
            //     child: Text(
            //   'GPS',
            //   style: TextStyle(color: Colors.red),
            // )),
          ),
        ),

        // микрофон
        Positioned(
          top: 280,
          right: 255,
          child: Container(
            // color: Colors.green,
            key: microKey,
            height: 120,
            width: 120,
            // child: const Center(
            //     child: Text(
            //   'Микрофон',
            //   style: TextStyle(color: Colors.red),
            // )),
          ),
        ),
      ],
    ));
  }
}

class CustomTextWidget extends StatelessWidget {
  final String text;
  final TextStyle style;

  CustomTextWidget({required this.text, required this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}

class CoachmarkDesc extends StatefulWidget {
  const CoachmarkDesc({
    super.key,
    required this.textWidget,
    this.skip = "Skip",
    this.next = "Next",
    this.onSkip,
    this.onNext,
    this.containerWidth,
  });

  final Widget textWidget;
  final String skip;
  final String next;
  final void Function()? onSkip;
  final void Function()? onNext;
  final double? containerWidth;

  @override
  State<CoachmarkDesc> createState() => _CoachmarkDescState();
}

class _CoachmarkDescState extends State<CoachmarkDesc>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      lowerBound: 0,
      upperBound: 20,
      duration: const Duration(milliseconds: 800),
    )..repeat(min: 0, max: 20, reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, animationController.value),
          child: child,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xFF644F80), Color(0xFF482575)],
          ),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.white,
            width: 2.0,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.textWidget,
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: widget.onSkip,
                  child: Text(
                    widget.skip,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: widget.onNext,
                  child: Text(
                    widget.next,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
