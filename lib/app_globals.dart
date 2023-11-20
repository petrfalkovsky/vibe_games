library my_app.globals;

import 'package:flutter/material.dart';

// методы для перевода пикселей в dp
double sdp(BuildContext context, double dp) {
  double width = MediaQuery.of(context).size.width;
  return (dp / 300) * width;
}

double sdpPX(BuildContext context, double px) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  if (width < height) {
    return (px * 0.29166 / 300) * width;
  } else {
    return (px * 0.29166 / 300) * height;
  }
}
