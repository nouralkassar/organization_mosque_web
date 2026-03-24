import 'package:organization_mosque_web/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/mosque/viewcontroller.dart';
import '../../../core/constant/color.dart';
import 'dart:convert';
import 'dart:typed_data';

class AllMosque extends StatelessWidget {
  const AllMosque({super.key});

  @override
  Widget build(BuildContext context) {
    ViewAllMosqueControllerImp controller =
        Get.put(ViewAllMosqueControllerImp());

    return GetBuilder<ViewAllMosqueControllerImp>(
      builder: (controller) => Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // AppBar-like Title (بدل appBar)
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      alignment: Alignment.center,
                      child: Text(
                        "عرض المساجد",
                        style: TextStyle(
                            color: AppColor.bluish,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListView.builder(
                      itemCount: controller.data.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Card(
                          color: AppColor.Begie,

                          //  color: const Color.fromARGB(255, 218, 173, 105),
                          child: Row(
                            children: [
                             // Expanded(
                               // flex: 2,
                               // child: controller.data[index].image_path != null
                               //     ? Image.network(
                             //           controller.data[index].image_path!)
                           //         : const Icon(Icons.image_not_supported),
                         //     ),
                              Expanded(
                                flex: 2,
                                child: ListTile(
                                  title: Text(
                                    controller.data[index].name!,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle:
                                      Text(controller.data[index].address!),
                                  onTap: () {
                                    controller
                                        .goToDetails(controller.data[index]);
                                  },
                                  trailing: SizedBox(
                                    width: 80,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.edit,
                                              color: AppColor.bluish),
                                          onPressed: () {
                                            controller.goPageEdit(
                                                controller.data[index]);
                                          },
                                        ),
                                        IconButton(
                                            icon: Icon(Icons.delete,
                                                color: AppColor.bluish),
                                            onPressed: () {
                                              Get.defaultDialog(
                                                title: "تحذير",
                                                titleStyle: TextStyle(
                                                  color: AppColor.bluish,
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                middleText:
                                                    "هل أنت متأكد أنك تريد حذف هذا المسجد؟",
                                                middleTextStyle: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black,
                                                ),
                                                backgroundColor: AppColor
                                                    .Begie, // ✅ لون الخلفية الكامل للدايلوج
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical:
                                                            25), // ✅ زيادة حجم المحتوى
                                                textConfirm: "نعم، احذف",
                                                textCancel: "إلغاء",
                                                confirmTextColor: Colors.white,
                                                cancelTextColor: Colors.black,
                                                buttonColor: AppColor.bluish,
                                                radius: 15,
                                                onCancel: () {
                                                  // عند الإلغاء
                                                },
                                                onConfirm: () {
                                                  controller.deleteMosque(
                                                      controller
                                                          .data[index].id!);
                                                  Get.back();
                                                },
                                              );
                                            }),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          // FloatingActionButton-like button (بدل floatingActionButton)
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              onPressed: () {
                Get.toNamed(AppRoute.AddMosque);
              },
              child: const Icon(
                Icons.add,
                color: AppColor.Begie,
              ),
              backgroundColor: AppColor.bluish,
            ),
          ),
        ],
      ),
    );
  }
}

class Base64ImageWidget extends StatelessWidget {
  final String base64String;

  const Base64ImageWidget({super.key, required this.base64String});

  @override
  Widget build(BuildContext context) {
    try {
      Uint8List bytes = base64Decode(base64String);
      return Image.memory(
        bytes,
        errorBuilder: (context, error, stackTrace) {
          return const Text('Invalid image data');
        },
      );
    } catch (e) {
      return const Text('Failed to decode base64');
    }
  }
}
