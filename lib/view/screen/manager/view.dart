import 'package:organization_mosque_web/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/manager/view.dart';
import '../../../controller/mosque/viewcontroller.dart';
import '../../../core/constant/color.dart';

class AllManager extends StatelessWidget {
  const AllManager({super.key});

  @override
  Widget build(BuildContext context) {
    ViewAllManagerControllerImp controller =
        Get.put(ViewAllManagerControllerImp());
    return GetBuilder<ViewAllManagerControllerImp>(
      builder: (controller) => Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // بدل الـ appBar عنوان ظاهر في الأعلى
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      alignment: Alignment.center,
                      child: Text(
                        "عرض المدراء",
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

                          // color: const Color.fromARGB(255, 218, 173, 105),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: ListTile(
                                  title: Text(
                                    controller.data[index].full_name!,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle:
                                      Text(controller.data[index].address!),
                                  trailing: SizedBox(
                                    width: 80,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.edit,
                                              color: AppColor.bluish),
                                          onPressed: () {
                                            controller.goPageEditManager(
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
                                                    "هل أنت متأكد أنك تريد حذف هذا المشرف؟",
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
                                                  controller.deleteManager(
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
                )
              ],
            ),
          ),

          // زر الإضافة مع زر عائم بدل floatingActionButton
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              onPressed: () {
                Get.toNamed(AppRoute.AddMAnager);
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
