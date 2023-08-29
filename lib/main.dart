import 'package:elearning/app/core/values/colors.dart';
import 'package:elearning/app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E-BBI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: baseColor,
          primary: baseColor,
        ),
        fontFamily: 'Nunito',
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      enableLog: true,
      smartManagement: SmartManagement.full,
      getPages: AppPages.pages,
      initialRoute: '/',
      defaultTransition: Transition.cupertino,
    );
  }
}
