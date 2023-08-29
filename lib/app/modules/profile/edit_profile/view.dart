import 'package:elearning/app/core/values/colors.dart';
import 'package:elearning/app/modules/profile/edit_profile/components/form_editprofile.dart';
import 'package:elearning/app/modules/profile/edit_profile/components/header_editprofile.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: Column(
        children: [
          HeaderEditProfile(),
          FormEditProfile(),
        ],
      ),
    );
  }
}