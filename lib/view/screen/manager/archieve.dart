import 'package:organization_mosque_web/core/class/handling_data_view.dart';
import 'package:organization_mosque_web/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/manager/archieve.dart';
import '../../../core/constant/color.dart';

class ArchiveDeleteManager extends StatelessWidget {
  const ArchiveDeleteManager({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewArchiveManagerControllerImp());

    return Stack(
      children: [
        Column(
          children: [
            // Header (بديل AppBar)
            Container(
              color: AppColor.Begie,
              padding: const EdgeInsets.symmetric(vertical: 16),
              alignment: Alignment.center,
              child: Text(
                "Archive Manager",
                style: TextStyle(
                  color: AppColor.bluish,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // Body
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GetBuilder<ViewArchiveManagerControllerImp>(
                  builder: (controller) => handlingDataRequest(
                    statusRequest: controller.statusRequest,
                    widget: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (context, index) {
                        final item = controller.data[index];

                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          color: AppColor.Begie,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                // الاسم والدور
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.full_name ?? "No Name",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        item.role ?? "",
                                        style: const TextStyle(
                                          color: Colors.black54,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // زر الاستعادة
                                IconButton(
                                  icon: Icon(Icons.restore,
                                      color: AppColor.bluish, size: 28),
                                  onPressed: () {
                                    controller.restoreItem(item.id!);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        // زر إضافة (FloatingActionButton)
        // Positioned(
        //   bottom: 16,
        //   right: 16,
        //   child: FloatingActionButton(
        //     backgroundColor: AppColor.bluish,
        //     onPressed: () {
        //       Get.toNamed(AppRoute.Manager); // تأكد من صحة هذا المسار
        //     },
        //     child: const Icon(
        //       Icons.add,
        //       color: AppColor.Begie,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
