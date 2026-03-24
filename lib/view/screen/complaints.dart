import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/complaints_controller.dart';

import '../../core/class/handling_data_view.dart';
import '../../core/constant/color.dart';

class ComplaintsView extends StatelessWidget {
  const ComplaintsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ComplaintsController());

    const TextStyle headerStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: AppColor.bluish,
    );

    const TextStyle cellStyle = TextStyle(fontSize: 16, color: AppColor.black);

    return Scaffold(
      body: GetBuilder<ComplaintsController>(
        builder: (controller) {
          return handlingDataView(
            statusRequest: controller.statusRequest,
            widget: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/login.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    color: AppColor.Begie.withOpacity(0.2),
                  ),
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.only(
                    top: kToolbarHeight + 30,
                    bottom: 30,
                  ),
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColor.Begie.withOpacity(0.4),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.5),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "عرض الشكاوي السابقة",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppColor.bluish,
                            ),
                          ),
                          const SizedBox(height: 20),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: MediaQuery.of(context).size.width,
                              ),
                              child: IntrinsicWidth(
                                child: DataTable(
                                  columnSpacing: 16,
                                  headingRowColor: MaterialStateProperty.all(
                                    AppColor.Begie,
                                  ),
                                  border: TableBorder.all(
                                    color: Colors.grey.shade300,
                                  ),
                                  columns: const [
                                    DataColumn(
                                        label: Text("نوع الطلب",
                                            style: headerStyle)),
                                    DataColumn(
                                        label:
                                        Text("الوصف", style: headerStyle)),
                                    DataColumn(
                                        label:
                                        Text("العنوان", style: headerStyle)),
                                    DataColumn(
                                        label:
                                        Text("الاسم", style: headerStyle)),
                                    DataColumn(
                                        label: Text("البريد الإلكتروني",
                                            style: headerStyle)),
                                    DataColumn(
                                        label: Text("التاريخ",
                                            style: headerStyle)),
                                    DataColumn(
                                        label:
                                        Text("الحالة", style: headerStyle)),
                                    // DataColumn(
                                    //     label:
                                    //     Text("التقدم", style: headerStyle)),
                                    DataColumn(
                                        label: Text("الإجراء",
                                            style: headerStyle)),
                                  ],
                                  rows: controller.complaints.map((request) {
                                    final user = request['user'];
                                    return DataRow(cells: [
                                      DataCell(Text(request['type'] ?? '',
                                          style: cellStyle)),
                                      DataCell(Text(
                                          request['description'] ?? '',
                                          style: cellStyle)
                                      ),
                                      DataCell(Text(
                                          request['title'] ?? '',
                                          style: cellStyle)
                                      ),
                                      DataCell(Text(user['full_name'] ?? '',
                                          style: cellStyle)),
                                      DataCell(Text(user['email'] ?? '',
                                          style: cellStyle)),
                                      DataCell(
                                        Text(
                                          request['created_at']
                                              .toString()
                                              .split('T')
                                              .first,
                                          style: cellStyle,
                                        ),
                                      ),
                                      DataCell(
                                        DropdownButton<String>(
                                          value: controller.pendingUpdates[
                                          request['id']]?['status'] ??
                                              request['status'],
                                          items: [
                                            'تم الحل',
                                            'مرفوض',
                                            'قيد المعالجة',
                                            'مفتوحة'
                                          ].map((status) {
                                            return DropdownMenuItem(
                                              value: status,
                                              child: Text(status,
                                                  style: cellStyle),
                                            );
                                          }).toList(),
                                          onChanged: (newStatus) {
                                            if (newStatus != null) {
                                              controller.setTemporaryUpdate(
                                                request['id'],
                                                'status',
                                                newStatus,
                                              );
                                            }
                                          },
                                        ),
                                      ),

                                      DataCell(
                                        ElevatedButton.icon(
                                          icon: const Icon(Icons.save),
                                          label: const Text("حفظ"),
                                          onPressed: controller.pendingUpdates
                                              .containsKey(request['id'])
                                              ? () => controller
                                              .saveUpdates(request['id'])
                                              : null,
                                        ),
                                      ),
                                    ]);
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
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
    );
  }
}
