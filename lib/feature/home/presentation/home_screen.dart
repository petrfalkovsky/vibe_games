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
        identify: "map-key",
        keyTarget: mapKey,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return CoachmarkDesc(
                textWidget: RichText(
                  text: const TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: "Миникарта",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text:
                            " помогает \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nориентироваться в пространстве. ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF9876C1),
                        ),
                      ),
                      TextSpan(
                        text: "Нажатие откроет меню паузы.",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                onNext: () {
                  controller.next();
                },
                onSkip: () {
                  controller.skip();
                },
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
              return CoachmarkDesc(
                textWidget: CustomTextWidget(
                  text:
                      "Миникарта помогает ориентироваться в пространстве. Нажатие откроет меню паузы.",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold, // Сделать текст жирным
                    color: Colors.red, // Изменить цвет текста
                  ),
                ),
                onNext: () {
                  controller.next();
                },
                onSkip: () {
                  controller.skip();
                },
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
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return CoachmarkDesc(
                textWidget: CustomTextWidget(
                  text:
                      "Миникарта помогает ориентироваться в пространстве. Нажатие откроет меню паузы.",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold, // Сделать текст жирным
                    color: Colors.red, // Изменить цвет текста
                  ),
                ),
                onNext: () {
                  controller.next();
                },
                onSkip: () {
                  controller.skip();
                },
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
              return CoachmarkDesc(
                textWidget: CustomTextWidget(
                  text:
                      "Миникарта помогает ориентироваться в пространстве. Нажатие откроет меню паузы.",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold, // Сделать текст жирным
                    color: Colors.red, // Изменить цвет текста
                  ),
                ),
                onNext: () {
                  controller.next();
                },
                onSkip: () {
                  controller.skip();
                },
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
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return CoachmarkDesc(
                textWidget: CustomTextWidget(
                  text:
                      "Миникарта помогает ориентироваться в пространстве. Нажатие откроет меню паузы.",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold, // Сделать текст жирным
                    color: Colors.red, // Изменить цвет текста
                  ),
                ),
                next: "Finish",
                onNext: () {
                  /// save state
                  /// local storage
                  controller.next();
                  debugPrint("Save to Local Strage");
                },
                onSkip: () {
                  controller.skip();
                },
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
  });

  final Widget textWidget;
  final String skip;
  final String next;
  final void Function()? onSkip;
  final void Function()? onNext;

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
            colors: [Colors.white, Color(0xFF482575)],
          ),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.white,
            width: 2.0,
          ),
        ),
        child: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: widget.textWidget,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: widget.onSkip,
                    child: Text(widget.skip),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: widget.onNext,
                    child: Text(widget.next),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
