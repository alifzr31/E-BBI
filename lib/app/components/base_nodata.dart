import 'package:elearning/app/components/base_text.dart';
import 'package:elearning/app/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BaseNoData extends StatelessWidget {
  const BaseNoData({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/nodata.svg',
            width: 200,
          ),
          const SizedBox(height: 10),
          BaseText(
            text: label,
            textAlign: TextAlign.center,
            size: 18,
            bold: FontWeight.w600,
          ),
          ElevatedButton.icon(
            style: ButtonStyle(
              backgroundColor: const MaterialStatePropertyAll(baseColor),
              foregroundColor: const MaterialStatePropertyAll(Colors.white),
              overlayColor: MaterialStatePropertyAll(
                Colors.white.withOpacity(0.2),
              ),
            ),
            onPressed: onPressed,
            icon: const Icon(Icons.refresh),
            label: const BaseText(text: 'Refresh Data'),
          ),
        ],
      ),
    );
  }
}
