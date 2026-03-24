import 'package:organization_mosque_web/controller/dashboard/controller.dart';
import 'package:organization_mosque_web/core/class/handling_data_view.dart';
import 'package:organization_mosque_web/core/class/statusrequest.dart';
import 'package:organization_mosque_web/core/constant/color.dart';
import 'package:organization_mosque_web/core/functions/valid_input.dart';
import 'package:organization_mosque_web/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IssueDecisionPage extends StatelessWidget {
  const IssueDecisionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(IssueDecisionController());

    return Scaffold(
        // appBar: AppBar(
        //   title: const Text("إصدار قرار"),
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        // ),
        // extendBodyBehindAppBar: true,
        body: GetBuilder<IssueDecisionController>(
      builder: (controller) => handlingDataView(
        statusRequest: controller.statusRequest,
        widget: Stack(
          children: [
            // خلفية الصورة
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

            // المحتوى الرئيسي
            SingleChildScrollView(
              padding:
                  const EdgeInsets.only(top: kToolbarHeight + 30, bottom: 30),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    // الفورم بحجم أقل
                    Container(
                      width: MediaQuery.of(context).size.width *
                          0.85, // تقليل العرض
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColor.Begie.withOpacity(
                            0.4), // لون الخلفية للصندوق
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.5),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Form(
                        key: controller.formstate,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // العنوان بالنص
                            const Text(
                              "إصدار قرار",
                              style: TextStyle(
                                color: AppColor.bluish,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                // backgroundColor:
                                //     AppColor.Begie,
                              ),
                              textAlign: TextAlign.center,
                            ),

                            const SizedBox(height: 30),
                            SizedBox(
                              width: MediaQuery.of(context).size.width *
                                  0.5, // تحكم بالعرض
                              child: DropdownButtonFormField<String>(
                                value: controller.selectedDecisionType,
                                decoration: InputDecoration(
                                  labelText: "نوع القرار",
                                  labelStyle: const TextStyle(fontSize: 14),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 12),
                                  filled: true,
                                  fillColor: AppColor.Begie,
                                  focusColor: AppColor.Begie,
                                  hoverColor: AppColor.Begie,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: AppColor.bluishGrey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                        color: AppColor.bluish, width: 2),
                                  ),
                                ),
                                style: const TextStyle(fontSize: 14),
                                isExpanded: true,
                                items: controller.decisionTypes
                                    .map((type) => DropdownMenuItem(
                                          value: type,
                                          child: Text(type,
                                              style: const TextStyle(
                                                  fontSize: 14)),
                                        ))
                                    .toList(),
                                onChanged: (val) =>
                                    controller.changeDecisionType(val!),
                              ),
                            ),
                            const SizedBox(height: 50),
                            CustomTextFormAuth(
                              hindtext: "اسم الشخص",
                              labeltext: "اسم الشخص",
                              iconData: Icons.person,
                              mycontroller: controller.fullNameController,
                              valid: (val) => validInput(val!, 2, 50, "name"),
                              isNumber: false,
                            ),
                            const SizedBox(height: 20),
                            CustomTextFormAuth(
                              hindtext: "اسم المسجد",
                              labeltext: "اسم المسجد",
                              iconData: Icons.mosque,
                              mycontroller: controller.mosqueNameController,
                              valid: (val) => validInput(val!, 2, 50, "name"),
                              isNumber: false,
                            ),
                            const SizedBox(height: 20),
                            CustomTextFormAuth(
                              hindtext: "تاريخ القرار",
                              labeltext: "تاريخ القرار",
                              iconData: Icons.calendar_today,
                              mycontroller: controller.dateController,
                              valid: (val) {
                                if (val == null || val.isEmpty) {
                                  return "الرجاء اختيار تاريخ القرار";
                                }
                                return null;
                              },
                              isNumber: false,
                              obscureText: false,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                );
                                if (pickedDate != null) {
                                  String formattedDate =
                                      "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
                                  controller.dateController.text =
                                      formattedDate;
                                }
                              },
                              readOnly: true,
                            ),

                            const SizedBox(height: 30),
                            ElevatedButton.icon(
                              onPressed: () async {
                                await controller.issueDecision();
                                if (controller.statusRequest ==
                                    StatusRequest.success) {
                                  await controller.generatePdf();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.bluish,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              icon: const Icon(
                                Icons.picture_as_pdf,
                                color: AppColor.Begie,
                              ),
                              label: const Text(
                                "إصدار القرار وتوليد ملف",
                                style: TextStyle(color: AppColor.Begie),
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
          ],
        ),
      ),
    ));
  }
}
