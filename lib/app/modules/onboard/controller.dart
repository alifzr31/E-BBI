import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardcontroller extends GetxController {
  final pageController = PageController(initialPage: 0).obs;
  final currentPage = 0.obs;

  final images = [
    'assets/images/onboard1.svg',
    'assets/images/onboard2.svg',
    'assets/images/onboard3.svg',
  ].obs;

  final titles = [
    'Selamat Datang di\nAplikasi E-BBI',
    'Selamat Datang di\nAplikasi E-BBI',
    'Selamat Datang di\nAplikasi E-BBI',
  ].obs;

  final subtitles = [
    'Selamat datang dan selamat bergabung dengan kami.',
    'Selamat datang dan selamat bergabung dengan kami.',
    'Selamat datang dan selamat bergabung dengan kami.',
  ].obs;

  void nextPage() {
    pageController.value.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
    );
  }
}
