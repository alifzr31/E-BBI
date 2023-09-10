import 'package:elearning/app/modules/auth/binding.dart';
import 'package:elearning/app/modules/auth/view.dart';
import 'package:elearning/app/modules/dashboard/binding.dart';
import 'package:elearning/app/modules/dashboard/view.dart';
import 'package:elearning/app/modules/materi/binding.dart';
import 'package:elearning/app/modules/materi/guru/view.dart';
import 'package:elearning/app/modules/materi/guru/widgets/detail_tugas.dart';
import 'package:elearning/app/modules/materi/guru/widgets/edit_materiguru.dart';
import 'package:elearning/app/modules/materi/guru/widgets/tambah_materiguru.dart';
import 'package:elearning/app/modules/materi/guru/widgets/tambah_tugasguru.dart';
import 'package:elearning/app/modules/materi/siswa/view.dart';
import 'package:elearning/app/modules/materi/siswa/widgets/detail_tugas.dart';
import 'package:elearning/app/modules/meeting/binding.dart';
import 'package:elearning/app/modules/meeting/view.dart';
import 'package:elearning/app/modules/profile/binding.dart';
import 'package:elearning/app/modules/profile/change_password/view.dart';
import 'package:elearning/app/modules/profile/edit_profile/view.dart';
import 'package:elearning/app/modules/onboard/view.dart';
import 'package:elearning/app/modules/splash/view.dart';
import 'package:elearning/app/routes/routes.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: Routes.onboard,
      page: () => const OnBoardPage(),
    ),
    GetPage(
      name: Routes.auth,
      page: () => const AuthPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.editprofile,
      page: () => const EditProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.changepassword,
      page: () => const ChangePasswordPage(),
      binding: ProfileBinding(),
    ),

    // MATERI
    GetPage(
      name: Routes.materiguru,
      page: () => const MateriGuruPage(),
      binding: MateriBinding(),
    ),
    GetPage(
      name: Routes.tambahmateriguru,
      page: () => const TambahMateriGuruPage(),
      binding: MateriBinding(),
    ),
    GetPage(
      name: Routes.tambahtugasguru,
      page: () => const TambahTugasGuruPage(),
      binding: MateriBinding(),
    ),
    GetPage(
      name: Routes.editmateriguru,
      page: () => const EditMateriGuru(),
      binding: MateriBinding(),
    ),
    GetPage(
      name: Routes.detailtugasguru,
      page: () => const DetailTugasGuru(),
      binding: MateriBinding(),
    ),
    GetPage(
      name: Routes.materitugassiswa,
      page: () => const MateriTugasSiswaPage(),
      binding: MateriBinding(),
    ),
    GetPage(
      name: Routes.detailtugassiswa,
      page: () => const DetailTugasSiswa(),
      binding: MateriBinding(),
    ),
    GetPage(
      name: Routes.meeting,
      page: () => const MeetingPage(),
      binding: MeetingBinding(),
    ),
    
  ];
}
