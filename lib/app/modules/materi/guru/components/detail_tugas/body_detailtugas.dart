import 'package:elearning/app/components/base_bodypage.dart';
import 'package:elearning/app/components/base_button.dart';
import 'package:elearning/app/components/base_cardcontent.dart';
import 'package:elearning/app/components/base_formfield.dart';
import 'package:elearning/app/components/base_text.dart';
import 'package:elearning/app/core/values/colors.dart';
import 'package:elearning/app/modules/materi/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';

class BodyDetailTugas extends StatefulWidget {
  const BodyDetailTugas({super.key});

  @override
  State<BodyDetailTugas> createState() => _BodyDetailTugasState();
}

class _BodyDetailTugasState extends State<BodyDetailTugas>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final controller = Get.find<MateriController>();

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    controller.fetchDetailTugasGuru();
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseBodyPage(
      child: Obx(
        () {
          final formatter = DateFormat('dd MMMM yyyy HH:mm');
          final startDate = formatter.format(
              controller.detailTugas.value?.startDate ?? DateTime(0000));
          final endDate = formatter
              .format(controller.detailTugas.value?.endDate ?? DateTime(0000));

          return controller.detailTugasLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    TabBar(
                      labelPadding: const EdgeInsets.all(15),
                      dividerColor: Colors.transparent,
                      indicatorColor: baseColor.withOpacity(0.99),
                      controller: tabController,
                      tabs: const [
                        BaseText(text: 'Detail Tugas'),
                        BaseText(text: 'Yang Mengumpulkan'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: tabController,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: BaseText(
                                    text: '$startDate - $endDate',
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width: Get.width,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: BaseText(
                                            text: controller.detailTugas.value
                                                    ?.fileTugas ??
                                                '',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        // Logo(
                                        //   Logos.microsoft_word,
                                        //   size: 25,
                                        // ),
                                        const Icon(
                                          Iconsax.document_download,
                                          color: baseColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: BaseText(
                                    text: controller
                                            .detailTugas.value?.deskripsi ??
                                        '',
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ListView.builder(
                            padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                            itemCount: controller.tugasSiswa.length,
                            itemBuilder: (context, index) {
                              final tugassiswa = controller.tugasSiswa[index];
                              final date = formatter.format(
                                  tugassiswa.createdAt ?? DateTime(0000));

                              return BaseCardTugasSiswa(
                                author: tugassiswa.siswa?.nama ?? '',
                                date: date,
                                fileName: tugassiswa.fileTugasSiswa ?? '',
                                keterangan: tugassiswa.status == 'ontime'
                                    ? 'Tepat Waktu'
                                    : tugassiswa.status == 'late'
                                        ? 'Terlambat'
                                        : 'Belum Mengumpulkan',
                                nilai: tugassiswa.nilai == null
                                    ? '-'
                                    : tugassiswa.nilai ?? '',
                                keteranganColor: tugassiswa.status == 'ontime'
                                    ? Colors.green
                                    : tugassiswa.status == 'late'
                                        ? Colors.red
                                        : Colors.grey.shade600,
                                onTapFile: () {},
                                button: tugassiswa.nilai == null
                                    ? SizedBox(
                                        height: 30,
                                        width: Get.width,
                                        child: BaseButton(
                                          label: 'Beri Nilai',
                                          bgColor: baseColor,
                                          fgColor: Colors.white,
                                          onPressed: () {
                                            Get.bottomSheet(
                                              backgroundColor: Colors.white,
                                              SizedBox(
                                                height: 230,
                                                width: Get.width,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  child: Column(
                                                    children: [
                                                      BaseText(
                                                        text:
                                                            'Beri Nilai Tugas',
                                                        size: 18,
                                                        bold: FontWeight.bold,
                                                      ),
                                                      BaseText(
                                                        text: tugassiswa
                                                                .siswa?.nama ??
                                                            '',
                                                        bold: FontWeight.w600,
                                                      ),
                                                      Expanded(
                                                        child: Form(
                                                          key: controller.formKeyBeriNilai.value,
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                            children: [
                                                              BaseFormField(
                                                                label: 'Nilai',
                                                                controller: controller.nilaiController.value,
                                                                keyboardType: TextInputType.number,
                                                                inputFormatters: [
                                                                  FilteringTextInputFormatter.digitsOnly,
                                                                  LengthLimitingTextInputFormatter(2),
                                                                ],
                                                                validator: (value) {
                                                                  if (value!.isEmpty) {
                                                                    return 'Masukkan nilai';
                                                                  }
                                                                  
                                                                  return null;
                                                                },
                                                              ),
                                                              const SizedBox(height: 10),
                                                              SizedBox(
                                                                width:
                                                                    Get.width,
                                                                child:
                                                                    BaseButton(
                                                                  bgColor:
                                                                      baseColor,
                                                                  fgColor: Colors
                                                                      .white,
                                                                  label:
                                                                      'Input Nilai',
                                                                  onPressed:
                                                                      () {
                                                                        if (controller.formKeyBeriNilai.value.currentState!.validate()) {
                                                                          controller.storeNilai(tugassiswa.id, context);
                                                                        }
                                                                      },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                    : Container(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
