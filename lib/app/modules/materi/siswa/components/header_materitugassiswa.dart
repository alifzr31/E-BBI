import 'package:elearning/app/components/base_button.dart';
import 'package:elearning/app/components/base_formfield.dart';
import 'package:elearning/app/components/base_headerpage.dart';
import 'package:elearning/app/components/base_text.dart';
import 'package:elearning/app/core/values/colors.dart';
import 'package:elearning/app/modules/materi/controller.dart';
import 'package:elearning/app/modules/meeting/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class HeaderMateriTugasSiswa extends StatefulWidget {
  const HeaderMateriTugasSiswa({super.key});

  @override
  State<HeaderMateriTugasSiswa> createState() => _HeaderMateriTugasSiswaState();
}

class _HeaderMateriTugasSiswaState extends State<HeaderMateriTugasSiswa> {
  final controller = Get.find<MateriController>();

  @override
  void initState() {
    controller.fetchOneLicon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BaseHeaderActionPage(
        title: controller.namaMatpel.value,
        subtitle: controller.kelas.value,
        actionWidget: controller.licon.value?.status == 'aktif'
            ? IconButton(
                onPressed: () {
                  if (controller.licon.value?.status == 'aktif' ||
                      controller.licon.value?.endDate == null) {
                    final meetingController = Get.put(MeetingController());
                    final judul =
                        controller.licon.value?.judul?.replaceAll(' ', '');
                    controller.idLicon.value =
                        controller.licon.value?.id.toString() ?? '';
                    meetingController.roomName.value = judul ?? '';
                    meetingController.joinMeeting(context);
                  } else {
                    Get.bottomSheet(
                      backgroundColor: Colors.white,
                      Container(
                        height: 200,
                        width: Get.width,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Column(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  BaseText(
                                    text: 'Buat Room\nLive Conference',
                                    textAlign: TextAlign.center,
                                    size: 18,
                                    bold: FontWeight.w600,
                                  ),
                                  const SizedBox(height: 10),
                                  BaseFormField(
                                    label: 'Judul Live Conference',
                                    controller:
                                        controller.judulLiconController.value,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: Get.width,
                              child: BaseButton(
                                bgColor: baseColor,
                                fgColor: Colors.white,
                                label: 'Mulai Live Conference',
                                onPressed: () {
                                  controller.storeLicon(context);
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                },
                color: Colors.white,
                tooltip: 'Bergabung live conference',
                icon: const Icon(HeroIcons.video_camera),
              )
            : Container(),
      ),
    );
  }
}
