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

  GlobalKey profileKey = GlobalKey();
  GlobalKey notificationKey = GlobalKey();
  GlobalKey searchKey = GlobalKey();
  GlobalKey popularKey = GlobalKey();
  GlobalKey specialKey = GlobalKey();

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
      // profile
      TargetFocus(
        identify: "profile-key",
        keyTarget: profileKey,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return CoachmarkDesc(
                text:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu odio sed tortor sagittis eleifend. Proin purus nisi, interdum eget tincidunt nec, gravida ullamcorper tortor.",
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

      // notification
      TargetFocus(
        identify: "notification-key",
        keyTarget: notificationKey,
        color: AppColor.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return CoachmarkDesc(
                text:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu odio sed tortor sagittis eleifend. Proin purus nisi, interdum eget tincidunt nec, gravida ullamcorper tortor.",
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

      // search
      TargetFocus(
        identify: "search-key",
        keyTarget: searchKey,
        color: AppColor.black,
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return CoachmarkDesc(
                text:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu odio sed tortor sagittis eleifend. Proin purus nisi, interdum eget tincidunt nec, gravida ullamcorper tortor.",
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

      // popular
      TargetFocus(
        identify: "popular-key",
        keyTarget: popularKey,
        color: AppColor.black,
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return CoachmarkDesc(
                text:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu odio sed tortor sagittis eleifend. Proin purus nisi, interdum eget tincidunt nec, gravida ullamcorper tortor.",
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

      /// special for you
      TargetFocus(
        identify: "special-key",
        keyTarget: specialKey,
        color: AppColor.black,
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return CoachmarkDesc(
                text:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu odio sed tortor sagittis eleifend. Proin purus nisi, interdum eget tincidunt nec, gravida ullamcorper tortor.",
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

        ////////////////////////////////////////////////////////////////////////////////////
        Positioned(
          top: 20,
          right: 10,
          child: Container(
            key: profileKey,
            height: 176,
            width: 176,
            child: const Center(
                child: Text(
              'Карта',
              style: TextStyle(color: Colors.red),
            )),
          ),
        ),
        ///////////////////////////////////////////////////////////////

        Positioned(
          top: 20,
          right: 100,
          child: Container(
            color: Colors.amber,
            key: notificationKey,
            height: 176,
            width: 176,
            child: const Center(
                child: Text(
              'Башмак',
              style: TextStyle(color: Colors.red),
            )),
          ),
        ),

        /////////////////////////
        Positioned(
          top: 20,
          right: 200,
          child: Container(
            color: Colors.pink,
            key: popularKey,
            height: 176,
            width: 176,
            child: const Center(
                child: Text(
              'Спидометр',
              style: TextStyle(color: Colors.red),
            )),
          ),
        ),
        /////////////////////////
        Positioned(
          top: 20,
          right: 300,
          child: Container(
            color: Colors.black,
            key: searchKey,
            height: 176,
            width: 176,
            child: const Center(
                child: Text(
              'Спидометр',
              style: TextStyle(color: Colors.red),
            )),
          ),
        ),
        Positioned(
          top: 20,
          right: 400,
          child: Container(
            color: Colors.green,
            key: specialKey,
            height: 176,
            width: 176,
            child: const Center(
                child: Text(
              'Спидометр',
              style: TextStyle(color: Colors.red),
            )),
          ),
        ),
      ],
    ));
  }
}

class CoachmarkDesc extends StatefulWidget {
  const CoachmarkDesc({
    super.key,
    required this.text,
    this.skip = "Skip",
    this.next = "Next",
    this.onSkip,
    this.onNext,
  });

  final String text;
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
          color: Colors.purple,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.text,
              style: Theme.of(context).textTheme.bodyMedium,
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
    );
  }
}
