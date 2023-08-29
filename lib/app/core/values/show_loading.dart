import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void showLoading(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.3),
    context: context,
    builder: (context) {
      return Center(
        child: Lottie.asset(
          'assets/lotties/loading3.json',
          width: 200,
          frameRate: FrameRate(240),
        ),
      );
    },
  );
}