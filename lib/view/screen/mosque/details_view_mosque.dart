// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../controller/mosque/details_view.dart';
// import '../../../core/constant/color.dart';
// import '../../../data/model/mosque_model.dart';

// class DetailMosque extends StatelessWidget {
//   const DetailMosque({super.key});

//   @override
//   Widget build(BuildContext context) {
//     DetailsMosqueControllerImp controller =
//         Get.put(DetailsMosqueControllerImp());

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("تفاصيل المسجد"),
//         backgroundColor: AppColor.bluish,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             controller.mosque!.image_path != null
//                 ? Image.network(controller.mosque!.image_path!)
//                 : const Icon(Icons.image_not_supported,
//                     size: 100, color: Colors.grey),
//             const SizedBox(height: 20),
//             Text("الاسم: ${controller.mosque!.name}", style: _labelStyle()),
//             Text("العنوان: ${controller.mosque!.address}",
//                 style: _labelStyle()),
//             Text("المنطقة: ${controller.mosque!.area}", style: _labelStyle()),
//             Text("الحالة الفنية: ${controller.mosque!.technicalStatus}",
//                 style: _labelStyle()),
//             Text("الفئة: ${controller.mosque!.category}", style: _labelStyle()),
//             Text(
//                 "يحوي قسم نسائي: ${controller.mosque!.hasFemaleSection == true ? 'نعم' : 'لا'}",
//                 style: _labelStyle()),
//             Text("تفاصيل إضافية:\n${controller.mosque!.details}",
//                 style: _labelStyle()),
//             const SizedBox(height: 30),
//             ElevatedButton(
//               onPressed: () async {
//                 print("📨 الضغط على زر 'مزيد من المعلومات'");

//                 await controller.fetchManagers();

//                 print(
//                     "📊 عدد العناصر في controller.managers: ${controller.managers.length}");

//                 showDialog(
//                   context: context,
//                   barrierColor: Colors.black.withOpacity(0.3),
//                   builder: (BuildContext context) {
//                     return Dialog(
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20)),
//                       backgroundColor: Colors.white,
//                       child: Container(
//                         padding: const EdgeInsets.all(20),
//                         constraints:
//                             BoxConstraints(maxHeight: 300, minHeight: 100),
//                         child: controller.managers.isNotEmpty
//                             ? ListView.separated(
//                                 shrinkWrap: true,
//                                 itemCount: controller.managers.length,
//                                 separatorBuilder: (_, __) => Divider(),
//                                 itemBuilder: (context, index) {
//                                   final staff = controller.managers[index];
//                                   return ListTile(
//                                     title: Text("الاسم: ${staff.full_name}"),
//                                     subtitle: Text("الدور: ${staff.role}"),
//                                   );
//                                 },
//                               )
//                             : const Center(
//                                 child: Text("لا يوجد بيانات للقائمين حالياً")),
//                       ),
//                     );
//                   },
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: AppColor.TitleBoarding,
//               ),
//               child: const Text("مزيد من المعلومات"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   TextStyle _labelStyle() {
//     return const TextStyle(
//       fontSize: 18,
//       fontWeight: FontWeight.w500,
//       height: 1.8,
//     );
//   }
// }

import 'package:organization_mosque_web/view/screen/mosque/ShiftDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/mosque/details_view.dart';
import '../../../core/constant/color.dart';

class DetailMosque extends StatelessWidget {
  DetailMosque({Key? key}) : super(key: key);

  final DetailsMosqueControllerImp controller =
      Get.put(DetailsMosqueControllerImp());

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double sectionWidth = screenWidth * 0.42;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/login.png",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity),
          Positioned.fill(
            child: Container(color: AppColor.Begie.withOpacity(0.2)),
          ),
          Column(
            children: [
              const SizedBox(height: 30),
              const Center(
                child: Text(
                  "تفاصيل المسجد",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColor.bluish,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              GetBuilder<DetailsMosqueControllerImp>(
                builder: (_) {
                  final mosque = controller.mosque;
                  final managers = controller.managers;

                  if (mosque == null) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Center(
                    child: Container(
                        width: screenWidth * 0.7,
                        height: 500,
                        padding: const EdgeInsets.all(20),
                        decoration: _containerDecoration(),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.center, // لتوسيط عمودي
                                crossAxisAlignment:
                                    CrossAxisAlignment.center, // لتوسيط أفقي
                                children: [
                                  _buildMosqueImage(mosque.image_path),
                                  const SizedBox(height: 20),
                                  _centeredText("الاسم: ${mosque.name}"),
                                  _centeredText("العنوان: ${mosque.address}"),
                                  _centeredText("المنطقة: ${mosque.area}"),
                                  _centeredText(
                                      "الحالة الفنية: ${mosque.technicalStatus}"),
                                  _centeredText("الفئة: ${mosque.category}"),
                                  _centeredText(
                                      "يحوي قسم نسائي: ${mosque.hasFemaleSection == true ? 'نعم' : 'لا'}"),

                                  const SizedBox(height: 20),

                                  // ElevatedButton(
                                  //   onPressed: () async {
                                  //     await controller.fetchManagers();
                                  //     Get.defaultDialog(
                                  //       title: "القائمين على المسجد",
                                  //       titleStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                  //       content: SizedBox(
                                  //         width: Get.width * 0.8,
                                  //         height: Get.height * 0.5,
                                  //         child: GetBuilder<DetailsMosqueControllerImp>(
                                  //           builder: (controller) {
                                  //             if (controller.managers.isEmpty) {
                                  //               return const Center(child: Text("لا يوجد قائمين مسجلين"));
                                  //             }
                                  //             return ListView.builder(
                                  //               itemCount: controller.managers.length,
                                  //               itemBuilder: (context, index) {
                                  //                 final staff = controller.managers[index];
                                  //                 return Card(
                                  //                   margin: const EdgeInsets.symmetric(vertical: 5),
                                  //                   child: ListTile(
                                  //                     leading: const Icon(Icons.person, color: Colors.blue),
                                  //                     title: Text(staff.full_name ?? "غير معروف"),
                                  //                     subtitle: Text(staff.role ?? "بدون دور"),
                                  //                   ),
                                  //                 );
                                  //               },
                                  //             );
                                  //           },
                                  //         ),
                                  //       ),
                                  //       textCancel: "إغلاق",
                                  //       cancelTextColor: Colors.red,
                                  //     );
                                  //   },
                                  //   style: ElevatedButton.styleFrom(backgroundColor: AppColor.bluish),
                                  //   child: const Text("القائمين على المسجد"),
                                  // ),
                      ],
                              ),
                            ),
                            // Expanded(
                            //   child: Center(
                            //     child: Column(
                            //       mainAxisSize: MainAxisSize.min,
                            //       children: [
                            //         ...controller.shifts.map((shift) {
                            //           return Padding(
                            //             padding: const EdgeInsets.symmetric(
                            //                 vertical: 6.0),
                            //             child: ElevatedButton(
                            //               onPressed: () {
                            //                 Get.to(() => ShiftDetailPage(
                            //                     shiftData: shift));
                            //               },
                            //               style: ElevatedButton.styleFrom(
                            //                 backgroundColor: AppColor.bluish,
                            //                 padding: const EdgeInsets.symmetric(
                            //                     vertical: 14, horizontal: 20),
                            //                 shape: RoundedRectangleBorder(
                            //                   borderRadius:
                            //                       BorderRadius.circular(8),
                            //                 ),
                            //                 minimumSize: const Size(
                            //                     230, 50), // حجم موحّد لكل زر
                            //               ),
                            //               child: Row(
                            //                 mainAxisAlignment:
                            //                     MainAxisAlignment.spaceBetween,
                            //                 children: [
                            //                   Container(
                            //                     margin:
                            //                         const EdgeInsets.symmetric(
                            //                             horizontal: 20,
                            //                             vertical: 8),
                            //                     padding:
                            //                         const EdgeInsets.all(12),
                            //                     decoration: BoxDecoration(
                            //                       color: AppColor.bluish,
                            //                       borderRadius:
                            //                           BorderRadius.circular(12),
                            //                       boxShadow: [
                            //                         BoxShadow(
                            //                           color: Colors.black
                            //                               .withOpacity(0.1),
                            //                           blurRadius: 6,
                            //                           offset:
                            //                               const Offset(0, 3),
                            //                         ),
                            //                       ],
                            //                     ),
                            //                     child: Column(
                            //                       crossAxisAlignment:
                            //                           CrossAxisAlignment.start,
                            //                       children: [
                            //                         Text(
                            //                           shift.name,
                            //                           style: const TextStyle(
                            //                             color: AppColor.Begie,
                            //                             fontSize: 18,
                            //                             fontWeight:
                            //                                 FontWeight.bold,
                            //                           ),
                            //                         ),
                            //                         const SizedBox(height: 6),
                            //                         Row(
                            //                           children: [
                            //                             const Icon(
                            //                                 Icons.access_time,
                            //                                 size: 18,
                            //                                 color:
                            //                                     AppColor.Begie),
                            //                             const SizedBox(
                            //                                 width: 6),
                            //                             Text(
                            //                               "${shift.from} - ${shift.to}",
                            //                               style:
                            //                                   const TextStyle(
                            //                                 color:
                            //                                     AppColor.Begie,
                            //                                 fontSize: 16,
                            //                               ),
                            //                             ),
                            //                           ],
                            //                         ),
                            //
                            //                       ],
                            //                     ),
                            //
                            //                   ),
                            //                   const Icon(
                            //                     Icons
                            //                         .arrow_forward_ios, // رمز السهم <
                            //                     color: AppColor.Begie,
                            //                     size: 18,
                            //                   ),
                            //                 ],
                            //               ),
                            //             ),
                            //           );
                            //         }).toList(),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                          ],
                        )),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _centeredText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  BoxDecoration _containerDecoration() {
    return BoxDecoration(
      color: AppColor.Begie.withOpacity(0.7),
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 20,
          offset: const Offset(0, 4),
        ),
      ],
      border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1),
    );
  }

  Widget _buildMosqueImage(String? imagePath) {
    if (imagePath == null || imagePath.isEmpty) {
      return const Icon(Icons.image_not_supported,
          size: 100, color: Colors.grey);
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        imagePath,
        height: 180,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.broken_image, size: 100, color: Colors.grey),
      ),
    );
  }
}
