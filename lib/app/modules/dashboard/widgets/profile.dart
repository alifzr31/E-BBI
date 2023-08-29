import 'package:elearning/app/core/values/colors.dart';
import 'package:elearning/app/modules/dashboard/components/profile/header_profile.dart';
import 'package:elearning/app/modules/dashboard/components/profile/profile_body.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: Column(
        children: [
          HeaderProfile(),
          ProfileBody(),
        ],
      ),
    );
  }
}