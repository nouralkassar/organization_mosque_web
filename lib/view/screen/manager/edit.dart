import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/manager/edit.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/valid_input.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextformauth.dart';

class EditManager extends StatelessWidget {
  const EditManager({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditManagerControllerImp());
    final controller = Get.find<EditManagerControllerImp>();

    // قسّم الحقول إلى قائمتين كل واحدة تحتوي 5 حقول
    List<Widget> leftFields = [
      CustomTextFormAuth(
        hindtext: "13".tr,
        labeltext: "12".tr,
        iconData: Icons.person,
        mycontroller: controller.full_name,
        valid: (val) => validInput(val!, 3, 100, "name"),
        isNumber: false,
      ),
      CustomTextFormAuth(
        hindtext: "role",
        labeltext: "role",
        iconData: Icons.supervisor_account,
        mycontroller: controller.role,
        valid: (val) => validInput(val!, 3, 100, "name"),
        isNumber: false,
      ),
      CustomTextFormAuth(
        hindtext: "mother_name",
        labeltext: "mother_name",
        iconData: Icons.person,
        mycontroller: controller.mother_name,
        valid: (val) => validInput(val!, 2, 100, "name"),
        isNumber: false,
      ),
      CustomTextFormAuth(
        hindtext: "Date of Birth",
        labeltext: "Date of Birth",
        iconData: Icons.calendar_today,
        mycontroller: controller.birth_date,
        valid: (val) {
          if (val == null || val.isEmpty) {
            return "Please enter your date of birth";
          }
          return null;
        },
        isNumber: false,
        onTapIcon: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime(2000),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
          if (pickedDate != null) {
            String formattedDate =
                "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
            controller.birth_date.text = formattedDate;
          }
        },
        obscureText: false,
      ),
      CustomTextFormAuth(
        hindtext: "national_id",
        labeltext: "national_id",
        iconData: Icons.badge,
        mycontroller: controller.national_id,
        valid: (val) => validInput(val!, 6, 90, "number"),
        isNumber: true,
      ),
    ];

    List<Widget> rightFields = [
      CustomTextFormAuth(
        hindtext: "adress",
        labeltext: "adress",
        iconData: Icons.location_on,
        mycontroller: controller.address,
        valid: (val) => validInput(val!, 2, 13, "name"),
        isNumber: false,
      ),
      CustomTextFormAuth(
        hindtext: "previous_job",
        labeltext: "previous_job",
        iconData: Icons.work,
        mycontroller: controller.previous_job,
        valid: (val) => validInput(val!, 2, 13, "name"),
        isNumber: true,
      ),
      CustomTextFormAuth(
        hindtext: "education_level",
        labeltext: "education_level",
        iconData: Icons.menu_book,
        mycontroller: controller.education_level,
        valid: (val) => validInput(val!, 2, 13, "name"),
        isNumber: true,
      ),
      CustomTextFormAuth(
        hindtext: "phone",
        labeltext: "phone",
        iconData: Icons.phone_android,
        mycontroller: controller.phone,
        valid: (val) => validInput(val!, 6, 13, "phone"),
        isNumber: true,
      ),
      GetBuilder<EditManagerControllerImp>(
        builder: (controller) {
          if (controller.mosqueList.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          return DropdownButtonFormField<String>(
            value: controller.selectedMosqueId,
            decoration: InputDecoration(
              labelText: "اختر المسجد",
              border: OutlineInputBorder(),
            ),
            items: controller.mosqueList.map((mosque) {
              return DropdownMenuItem(
                value: mosque.id.toString(),
                child: Text(mosque.name ?? 'بدون اسم'),
              );
            }).toList(),
            onChanged: (val) {
              controller.selectedMosqueId = val;
              controller.update(); // ✅ مهم لحتى يحدث القيمة
            },
          );
        },
      )

    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          /// ✅ خلفية تغطي كل الشاشة
          Positioned.fill(
            child: Image.asset(
              "assets/images/login.png",
              fit: BoxFit.cover,
            ),
          ),

          /// ✅ المحتوى مع Scroll داخل Center لتصغيره + maxWidth
          GetBuilder<EditManagerControllerImp>(
            builder: (controller) {
              return handlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Center(
                  child: SingleChildScrollView(
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 850),
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColor.Begie.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Form(
                        key: controller.formstate,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Edit Manager",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                    color: AppColor.bluish,
                                  ),
                            ),
                            const SizedBox(height: 20),

                            /// ✅ الحقول على صفين
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: leftFields
                                        .map((field) => Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 6),
                                              child: field,
                                            ))
                                        .toList(),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    children: rightFields
                                        .map((field) => Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 6),
                                              child: field,
                                            ))
                                        .toList(),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),
                            CustomButtonAuth(
                              text: "تعديل مدير",
                              onPressed: () {
                                controller.editManager();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
