import 'package:elearning/app/modules/dashboard/components/body_page.dart';
import 'package:elearning/app/modules/dashboard/components/bottom_navbar.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyPage(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
