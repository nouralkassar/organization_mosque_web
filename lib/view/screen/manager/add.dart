import 'package:organization_mosque_web/controller/auth/add_manamger_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/manager/add.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/valid_input.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextformauth.dart';

class AddManagerToMosque extends StatelessWidget {
  const AddManagerToMosque({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddManagerControllerImp());

    return Scaffold(
      body: GetBuilder<AddManagerControllerImp>(
        builder: (controller) => handlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Stack(
            children: [
              // ✅ خلفية الشاشة
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

              // ✅ المحتوى الرئيسي
              Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Form(
                      key: controller.formstate,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColor.Begie.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Add Manager",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                    color: AppColor.bluish,
                                  ),
                            ),
                            const SizedBox(height: 20),

                            // ✅ الحقول موزعة على عمودين
                            Row(
                              children: [
                                // ✅ العمود الأول
                                Expanded(
                                  child: Column(
                                    children: [
                                      CustomTextFormAuth(
                                        hindtext: "13".tr,
                                        labeltext: "12".tr,
                                        iconData: Icons.person,
                                        mycontroller: controller.full_name,
                                        valid: (val) =>
                                            validInput(val!, 3, 100, "name"),
                                        isNumber: false,
                                      ),
                                      const SizedBox(height: 10),
                                      CustomTextFormAuth(
                                        hindtext: "role",
                                        labeltext: "role",
                                        iconData: Icons.supervisor_account,
                                        mycontroller: controller.role,
                                        valid: (val) =>
                                            validInput(val!, 3, 100, "name"),
                                        isNumber: false,
                                      ),
                                      const SizedBox(height: 10),
                                      CustomTextFormAuth(
                                        hindtext: "mother_name",
                                        labeltext: "mother_name",
                                        iconData: Icons.person,
                                        mycontroller: controller.mother_name,
                                        valid: (val) =>
                                            validInput(val!, 2, 100, "name"),
                                        isNumber: false,
                                      ),
                                      const SizedBox(height: 10),
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
                                        readOnly: true,
                                        onTap: () async {
                                          DateTime? pickedDate =
                                              await showDatePicker(
                                            context: context,
                                            initialDate: DateTime(2000),
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime.now(),
                                          );
                                          if (pickedDate != null) {
                                            controller.birth_date.text =
                                                "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
                                          }
                                        },
                                        obscureText: false,
                                      ),
                                      const SizedBox(height: 10),
                                      CustomTextFormAuth(
                                        hindtext: "national_id",
                                        labeltext: "national_id",
                                        iconData: Icons.badge,
                                        mycontroller: controller.national_id,
                                        valid: (val) =>
                                            validInput(val!, 6, 90, "number"),
                                        isNumber: true,
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(width: 10),

                                // ✅ العمود الثاني
                                Expanded(
                                  child: Column(
                                    children: [
                                      CustomTextFormAuth(
                                        hindtext: "address",
                                        labeltext: "address",
                                        iconData: Icons.location_on,
                                        mycontroller: controller.address,
                                        valid: (val) =>
                                            validInput(val!, 2, 13, "name"),
                                        isNumber: false,
                                      ),
                                      const SizedBox(height: 10),

                                      CustomTextFormAuth(
                                        hindtext: "previous_job",
                                        labeltext: "previous_job",
                                        iconData: Icons.work,
                                        mycontroller: controller.previous_job,
                                        valid: (val) =>
                                            validInput(val!, 2, 13, "name"),
                                        isNumber: false,
                                      ),
                                      const SizedBox(height: 10),

                                      CustomTextFormAuth(
                                        hindtext: "education_level",
                                        labeltext: "education_level",
                                        iconData: Icons.menu_book,
                                        mycontroller:
                                            controller.education_level,
                                        valid: (val) =>
                                            validInput(val!, 2, 13, "name"),
                                        isNumber: false,
                                      ),
                                      const SizedBox(height: 10),

                                      CustomTextFormAuth(
                                        hindtext: "phone",
                                        labeltext: "phone",
                                        iconData: Icons.phone_android,
                                        mycontroller: controller.phone,
                                        valid: (val) =>
                                            validInput(val!, 6, 13, "number"),
                                        isNumber: true,
                                      ),
                                      const SizedBox(height: 10),

                                      // ✅ قائمة اختيار المسجد
                                      DropdownButtonFormField<String>(
                                        value: controller.selectedMosqueId,
                                        decoration: InputDecoration(
                                          labelText: 'اختر المسجد',
                                          isDense: true,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            vertical: 10,
                                            horizontal: 10,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                        items:
                                            controller.mosqueList.map((mosque) {
                                          return DropdownMenuItem<String>(
                                            value: mosque.id.toString(),
                                            child: Text(
                                                mosque.name ?? 'مسجد بدون اسم'),
                                          );
                                        }).toList(),
                                        onChanged: (val) {
                                          controller.selectedMosqueId = val;
                                          controller.update();
                                        },
                                        validator: (val) {
                                          if (val == null) {
                                            return 'الرجاء اختيار مسجد';
                                          }
                                          return null;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 25),

                            // ✅ زر الإرسال
                            CustomButtonAuth(
                              text: "اضافة مدير",
                              onPressed: () {
                                controller.AddManager();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
