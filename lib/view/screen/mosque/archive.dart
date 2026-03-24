import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartz/dartz.dart';
import 'package:organization_mosque_web/core/class/handling_data_view.dart';
import 'package:organization_mosque_web/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/mosque/archive_delete.dart';
import '../../../core/constant/color.dart';
import '../../../link_api.dart';

class ArchiveDeleteMosque extends StatelessWidget {
  const ArchiveDeleteMosque({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewArchiveMosqueControllerImp());
    return Stack(
      children: [
        Column(
          children: [
            // بديل appBar
            Container(
              color: AppColor.Begie,
              padding: const EdgeInsets.symmetric(vertical: 16),
              alignment: Alignment.center,
              child: Text(
                "Archive Mosque",
                style: TextStyle(
                    color: AppColor.bluish,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GetBuilder<ViewArchiveMosqueControllerImp>(
                  builder: (controller) => handlingDataRequest(
                    statusRequest: controller.statusRequest,
                    widget: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: ListView.builder(
                        itemCount: controller.data.length,
                        itemBuilder: (context, index) {
                          var item = controller.data[index]; // ✅ تعريف item هنا
                          return Card(
                            color: AppColor.Begie,
                            child: Row(
                              children: [
                                // Expanded(
                                //   flex: 2,
                                //   child: item.image_path != null
                                //       ? Image.network(item.image_path!)
                                //       : const Icon(Icons.image_not_supported),
                                // ),
                                Expanded(
                                  flex: 2,
                                  child: ListTile(
                                    title: Text(
                                      item.name!,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(item.address!),
                                  ),
                                ),
                                // IconButton(
                                //   icon: Icon(Icons.restore,
                                //       color: AppColor.bluish, size: 28),
                                //   onPressed: () {
                                //     controller
                                //         .restoreItem(item.id!); // ✅ هنا التعديل
                                //   },
                                // ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
