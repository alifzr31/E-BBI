import 'package:elearning/app/core/values/colors.dart';
import 'package:elearning/app/modules/profile/change_password/components/form_changepassword.dart';
import 'package:elearning/app/modules/profile/change_password/components/header_changepassword.dart';
import 'package:flutter/material.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: Column(
        children: [
          HeaderChangePassword(),
          FormChangePassword(),
        ],
      ),
    );
  }
}
