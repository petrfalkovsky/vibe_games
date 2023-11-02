import 'package:flutter/material.dart';
import 'package:vibe_games/core/global_instans.dart/app_globals.dart';
import 'package:vibe_games/ui/shared/shared_exports.dart';

class SpeedDigitsTable extends StatelessWidget {
  const SpeedDigitsTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        child: SizedBox(
          height: sdpPX(context, 300),
          width: sdpPX(context, 300),
          child: Stack(children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.transparent,
                      AppColors.background[1] ?? Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: sdpPX(context, 96),
                left: sdpPX(context, 32),
                child: Text('0',
                    style: TextStyle(
                      color: AppColors.text[1]?.withOpacity(0.3),
                      fontSize: sdpPX(context, 17),
                      fontWeight: FontWeight.normal,
                      fontFamily: AppStyles.ttNorms,
                    ))),
            Positioned(
                bottom: sdpPX(context, 144),
                left: sdpPX(context, 21),
                child: Text('20',
                    style: TextStyle(
                      color: AppColors.text[1]?.withOpacity(0.3),
                      fontSize: sdpPX(context, 17),
                      fontWeight: FontWeight.normal,
                      fontFamily: AppStyles.ttNorms,
                    ))),
            Positioned(
                bottom: sdpPX(context, 188),
                left: sdpPX(context, 29),
                child: Text('40',
                    style: TextStyle(
                      color: AppColors.text[1]?.withOpacity(0.3),
                      fontSize: sdpPX(context, 17),
                      fontWeight: FontWeight.normal,
                      fontFamily: AppStyles.ttNorms,
                    ))),
            Positioned(
                bottom: sdpPX(context, 228),
                left: sdpPX(context, 53),
                child: Text('60',
                    style: TextStyle(
                      color: AppColors.text[1]?.withOpacity(0.3),
                      fontSize: sdpPX(context, 17),
                      fontWeight: FontWeight.normal,
                      fontFamily: AppStyles.ttNorms,
                    ))),
            Positioned(
                bottom: sdpPX(context, 257.5),
                left: sdpPX(context, 91),
                child: Text('80',
                    style: TextStyle(
                      color: AppColors.text[1]?.withOpacity(0.3),
                      fontSize: sdpPX(context, 17),
                      fontWeight: FontWeight.normal,
                      fontFamily: AppStyles.ttNorms,
                    ))),
            Positioned(
                bottom: sdpPX(context, 267.5),
                left: sdpPX(context, 137),
                child: Text('100',
                    style: TextStyle(
                      color: AppColors.text[1]?.withOpacity(0.3),
                      fontSize: sdpPX(context, 17),
                      fontWeight: FontWeight.normal,
                      fontFamily: AppStyles.ttNorms,
                    ))),
            Positioned(
                bottom: sdpPX(context, 257.5),
                right: sdpPX(context, 89),
                child: Text('120',
                    style: TextStyle(
                      color: AppColors.text[1]?.withOpacity(0.3),
                      fontSize: sdpPX(context, 17),
                      fontWeight: FontWeight.normal,
                      fontFamily: AppStyles.ttNorms,
                    ))),
            Positioned(
                bottom: sdpPX(context, 228),
                right: sdpPX(context, 51),
                child: Text('140',
                    style: TextStyle(
                      color: AppColors.text[1]?.withOpacity(0.3),
                      fontSize: sdpPX(context, 17),
                      fontWeight: FontWeight.normal,
                      fontFamily: AppStyles.ttNorms,
                    ))),
            Positioned(
                bottom: sdpPX(context, 188),
                right: sdpPX(context, 28),
                child: Text('160',
                    style: TextStyle(
                      color: AppColors.text[1]?.withOpacity(0.3),
                      fontSize: sdpPX(context, 17),
                      fontWeight: FontWeight.normal,
                      fontFamily: AppStyles.ttNorms,
                    ))),
            Positioned(
                bottom: sdpPX(context, 144),
                right: sdpPX(context, 20),
                child: Text('180',
                    style: TextStyle(
                      color: AppColors.text[1]?.withOpacity(0.3),
                      fontSize: sdpPX(context, 17),
                      fontWeight: FontWeight.normal,
                      fontFamily: AppStyles.ttNorms,
                    ))),
            Positioned(
                bottom: sdpPX(context, 96),
                right: sdpPX(context, 25),
                child: Text('200',
                    style: TextStyle(
                      color: AppColors.text[1]?.withOpacity(0.3),
                      fontSize: sdpPX(context, 17),
                      fontWeight: FontWeight.normal,
                      fontFamily: AppStyles.ttNorms,
                    ))),
          ]),
        ),
      ),
    );
  }
}


//// !! решение не подходит - не адаптивно =(
// class SpeedDigitsTable extends StatelessWidget {
//   const SpeedDigitsTable({super.key});

//   @override
//   Widget build(BuildContext context) {
//     List<Widget> children = [];

//     /// радиус циферблата
//     double radius = 100;

//     /// влево вправо горизонтально
//     double centerX = radius + 20;

//     /// вверх/вниз вертикально
//     double centerY = radius + 14;

//     for (int i = 200; i >= 0; i -= 20) {
//       /// angle = -1.06 (расстоянием между первой и последней цифрой можно упралвять)
//       /// ((190 - i) по часовой стрелке можно повернуть
//       /// i) / 195); увеличить/уменьшить расстоние между цифрами
//       double angle = -1.18 * pi * ((178 - i) / 185);
//       double x = centerX + radius * cos(angle);
//       double y = centerY + radius * sin(angle);
//       children.add(
//         Positioned(
//           left: x,
//           top: y,
//           child: Text(
//             '$i',
//             style: TextStyle(
//               // color: AppColors.text[1]?.withOpacity(0.3),

//               color: AppColors.text[1],
//               fontSize: sdpPX(context, 17),
//               fontWeight: FontWeight.normal,
//               fontFamily: AppStyles.ttNorms,
//             ),
//           ),
//         ),
//       );
//     }

//     return Positioned.fill(
//       left: sdpPX(context, 780),
//       child: Stack(
//         children: children,
//       ),
//     );
//   }
// }
