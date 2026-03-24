import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/functions/valid_input.dart';
import '../../../../core/constant/color.dart';
import '../../controller/duration/edit.dart';
import '../../view/widget/auth/custombuttonauth.dart';
import '../../view/widget/auth/customtextformauth.dart';

class AnimatedEditDurationCard extends StatefulWidget {
  const AnimatedEditDurationCard({super.key});

  @override
  State<AnimatedEditDurationCard> createState() =>
      _AnimatedEditDurationCardState();
}

class _AnimatedEditDurationCardState extends State<AnimatedEditDurationCard> {
  double _widthFactor = 0.1; // أصغر قليلاً
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      if (!mounted) return;
      setState(() {
        _widthFactor = 0.65; // عرض أصغر
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditDurationControllerImp());

    return Center(
      child: AnimatedOpacity(
        opacity: _opacity,
        duration: Duration(milliseconds: 2000),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 2000),
          curve: Curves.easeInOut,
          width: MediaQuery.of(context).size.width * _widthFactor,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppColor.Begie.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Form(
              key: controller.formstate,
              child: Column(
                children: [
                  // Text(
                  //   "اضافة دوام",
                  //   style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  //     color: AppColor.bluish,
                  //   ),
                  // ),
                  SizedBox(
                    height: 40,
                  ),
                  // صف 1: الاسم - العنوان
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormAuth(
                          hindtext: "ادخل الاسم",
                          labeltext: "الاسم",
                          iconData: Icons.person,
                          mycontroller: controller.name,
                          valid: (val) => validInput(val!, 3, 100, "name"),
                          isNumber: false,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CustomTextFormAuth(
                          hindtext: "ادخل العنوان",
                          labeltext: "العنوان",
                          iconData: Icons.location_on,
                          mycontroller: controller.type,
                          valid: (val) => validInput(val!, 3, 100, "name"),
                          isNumber: false,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),

                  // صف 2: المنطقة - التفاصيل
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormAuth(
                          hindtext: "ادخل وقت البداية",
                          labeltext: "الوقت البداية",
                          iconData: Icons.area_chart,
                          mycontroller: controller.start_time,
                          valid: (val) => validInput(val!, 1, 13, "time"),
                          isNumber: true,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CustomTextFormAuth(
                          hindtext: "ادخل النهاية",
                          labeltext: "النهلية",
                          iconData: Icons.notes,
                          mycontroller: controller.end_time,
                          valid: (val) => validInput(val!, 3, 100, "time"),
                          isNumber: false,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),

                  Row(
                    children: [
                      Expanded(
                        child: // اختيار المسجد
                            DropdownButtonFormField<String>(
                          value: controller.selectedMosqueId,
                          decoration: InputDecoration(
                            labelText: 'اختر المسجد',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                          ),
                          items: controller.mosqueList.map((mosque) {
                            return DropdownMenuItem<String>(
                              value: mosque.id.toString(),
                              child: Text(mosque.name ?? 'مسجد بدون اسم'),
                            );
                          }).toList(),
                          onChanged: (val) {
                            controller.selectedMosqueId = val;
                            controller.update();
                          },
                          validator: (val) {
                            if (val == null) return 'الرجاء اختيار مسجد';
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: // اختيار المشرف
                            DropdownButtonFormField<String>(
                          value: controller.selectedManagerId,
                          decoration: InputDecoration(
                            labelText: 'اختر المشرف',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                          ),
                          items: controller.managersList.map((manager) {
                            return DropdownMenuItem<String>(
                              value: manager.id.toString(),
                              child: Text(manager.full_name ?? 'مشرف بدون اسم'),
                            );
                          }).toList(),
                          onChanged: (val) {
                            controller.selectedManagerId = val;
                            controller.update();
                          },
                          validator: (val) {
                            if (val == null) return 'الرجاء اختيار مشرف';
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormAuth(
                          hindtext: "ادخل  اليوم",
                          labeltext: "اليومة",
                          iconData: Icons.area_chart,
                          mycontroller: controller.daysOfWeek,
                          valid: (val) => validInput(val!, 1, 13, "name"),
                          isNumber: true,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),

                  SizedBox(height: 15),

                  // زر الإضافة
                  CustomButtonAuth(
                    text: "تعدل الدوام",
                    onPressed: () {
                      controller.EditDuration();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
