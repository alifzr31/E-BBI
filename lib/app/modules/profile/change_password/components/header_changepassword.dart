import 'package:elearning/app/components/base_headerpage.dart';
import 'package:flutter/material.dart';

class HeaderChangePassword extends StatelessWidget {
  const HeaderChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseHeaderPage(
      title: 'Ubah Password',
      subtitle: 'Ubah password untuk akses log in akun anda',
    );
  }
}
