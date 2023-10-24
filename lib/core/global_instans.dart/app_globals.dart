library my_app.globals;

import 'package:dio/dio.dart';
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

// метод для обработки ошибок
// общий метод данных и обработки ошибок
Future<T?> getDataAndHandleError<T>(Future<T> Function() getData) async {
  try {
    return await getData();
  } catch (e) {
    handleApiError(e);
    return null;
  }
}

void handleApiError(dynamic e) {
  if (e is DioException) {
    debugPrint('DioException: ${e.message}');
    if (e.response != null) {
      debugPrint('Response data: ${e.response!.data}');
    }
  } else {
    debugPrint('Error fetching data: $e');
  }
}
