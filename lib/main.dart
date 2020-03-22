import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_interface_with_animation/app/modules/home/home_page.dart';

void main() => runApp(
      MaterialApp(
        home: HomePage(),
        navigatorKey: Get.key,
        theme: ThemeData(
          bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
    );
