import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcons {
  static const _basePathIcons = 'assets/icons';
  static const _basePathImg = 'assets/images';
  static const AssetImage background =
      AssetImage('$_basePathImg/splash_screen_bg.png');
  static const AssetImage appBarBackground =
      AssetImage('$_basePathImg/appbar_frame.png');

  /// использовать свг иконки
  /// AppIcons.svgWidget(AppIcons.map, width: 26),
  /// новые
  static const micOff = '$_basePathIcons/mic_off.svg';
  static const mic = '$_basePathIcons/mic.svg';
  static const star = '$_basePathIcons/star.svg';
  static const statusBarFrame = '$_basePathIcons/status_bar_frame.svg';
  static const heart = '$_basePathIcons/heart.svg';
  static const cup = '$_basePathIcons/cup.svg';
  static const o2 = '$_basePathIcons/o_2.svg';
  static const sheeld = '$_basePathIcons/sheeld.svg';
  static const rub = '$_basePathIcons/rub.svg';
  static const leftPartOfStatusbar =
      '$_basePathIcons/left_part_of_statusbar_container.svg';
  static const rightPartOfStatusbar =
      '$_basePathIcons/right_part_of_statusbar_container.svg';
  static const leftPartProgressBar =
      '$_basePathIcons/left_part_progress_bar.svg';
  static const rightPartProgressBar =
      '$_basePathIcons/right_part_progress_bar.svg';
  static const pad = '$_basePathIcons/pad.svg';
  static const parashute = '$_basePathIcons/parashute.svg';
  static const matreshka = '$_basePathIcons/matreshka.svg';
  static const stop = '$_basePathIcons/stop.svg';
  static const cross = '$_basePathIcons/cross.svg';
  static const trash = '$_basePathIcons/trash.svg';
  static const point = '$_basePathIcons/point.svg';
  static const car = '$_basePathIcons/car.svg';
  static const cart = '$_basePathIcons/cart.svg';
  static const radial = '$_basePathIcons/radial.svg';
  static const crown = '$_basePathIcons/crown.svg';
  static const avatar = '$_basePathIcons/avatar.svg';
  static const notiClose = '$_basePathIcons/noti_close.svg';
  static const notiTimer = '$_basePathIcons/noti_timer.svg';
  static const event = '$_basePathIcons/event.svg';
  static const notiCase = '$_basePathIcons/noti_case.svg';
  static const discount = '$_basePathIcons/discount.svg';
  static const giftBox = '$_basePathIcons/gift_box.svg';
  static const locate = '$_basePathIcons/locate.svg';
  static const locateNinja = '$_basePathIcons/locate_ninja.svg';
  static const callAnswer = '$_basePathIcons/call_answer.svg';
  static const callSkip = '$_basePathIcons/call_skip.svg';
  static const notiClick = '$_basePathIcons/noti_click.svg';
  static const notiRing = '$_basePathIcons/noti_ring.svg';
  static const chatClose = '$_basePathIcons/chat_close.svg';
  static const chatOk = '$_basePathIcons/chat_ok.svg';
  static const chat = '$_basePathIcons/chat.svg';
  static const batary = '$_basePathIcons/batary.svg';
  static const breakHeartProcent = '$_basePathIcons/break_heart_procent.svg';
  static const check = '$_basePathIcons/check.svg';
  static const lights = '$_basePathIcons/lights.svg';
  static const key = '$_basePathIcons/key.svg';
  static const attantionSign = '$_basePathIcons/attantion_sign.svg';
  static const gasStation = '$_basePathIcons/gas_station.svg';
  static const turnSignalLeft = '$_basePathIcons/turn_signal_left.svg';
  static const turnSignalRight = '$_basePathIcons/turn_signal_right.svg';

  /// старых нет, удалил вроде все

  /// использовать пнг изображения
  /// Image.asset(AppIcons.monoJogger),
  // новые
  static const backStatusBar = '$_basePathImg/back_status_bar.png';
  static const callAvatarHolder = '$_basePathImg/call_avatar_holder.png';
  static const callAvatar = '$_basePathImg/call_avatar.png';
  static const turnSignalRightPNG = '$_basePathImg/turn_signal_right.png';
  static const turnSignalLeftPNG = '$_basePathImg/turn_signal_left.png';

  // старые
  static const speedArrow = '$_basePathImg/speed_arrow.png';

  static Widget svgWidget(String path,
      {double? width, double? height, Color? color}) {
    return SvgPicture.asset(
      path,
      width: width,
      height: height,
      color: color,
    );
  }
}
