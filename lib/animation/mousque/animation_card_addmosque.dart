import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/functions/valid_input.dart';
import '../../../../core/constant/color.dart';
import '../../controller/mosque/addcontroller.dart';
import '../../view/widget/auth/custombuttonauth.dart';
import '../../view/widget/auth/customtextformauth.dart';

class AnimatedAddMosqueCard extends StatefulWidget {
  const AnimatedAddMosqueCard({super.key});

  @override
  State<AnimatedAddMosqueCard> createState() => _AnimatedAddMosqueCardState();
}

class _AnimatedAddMosqueCardState extends State<AnimatedAddMosqueCard> {
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
    final controller = Get.put(AddMosqueControllerImp());

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
          child: Column(
            children: [
              Text(
                "اضافة مسجد  ",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: AppColor.bluish,
                    ),
              ),
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
                      mycontroller: controller.address,
                      valid: (val) => validInput(val!, 5, 100, "name"),
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
                      hindtext: "ادخل المساحة",
                      labeltext: "المساحة",
                      iconData: Icons.area_chart,
                      mycontroller: controller.area,
                      valid: (val) => validInput(val!, 1, 13, "number"),
                      isNumber: true,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: CustomTextFormAuth(
                      hindtext: "ادخل التفاصيل",
                      labeltext: "التفاصيل",
                      iconData: Icons.notes,
                      mycontroller: controller.details,
                      valid: (val) => validInput(val!, 3, 100, "name"),
                      isNumber: false,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              // صف 3: التقنية - الفئة
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormAuth(
                      hindtext: "ادخل الحالة التقنية",
                      labeltext: "التقنية",
                      iconData: Icons.build,
                      mycontroller: controller.technical_status,
                      valid: (val) => validInput(val!, 3, 13, "name"),
                      isNumber: false,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: CustomTextFormAuth(
                      hindtext: "ادخل الفئة",
                      labeltext: "الفئة",
                      iconData: Icons.category,
                      mycontroller: controller.category,
                      valid: (val) => validInput(val!, 1, 2, "enum"),
                      isNumber: true,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              // قسم نسائي
              Align(
                alignment: Alignment.centerRight,
                child: GetBuilder<AddMosqueControllerImp>(
                  builder: (controller) => Row(
                    children: [
                      Checkbox(
                        value: controller.has_female_section,
                        onChanged: (val) {
                          controller.has_female_section = val!;
                          controller.update();
                        },
                      ),
                      Text("هل يوجد قسم نسائي؟",
                          style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10),

              // الصورة
              GetBuilder<AddMosqueControllerImp>(
                builder: (controller) {
                  if (controller.file == null) {
                    return MaterialButton(
                      onPressed: () {
                        controller.chooseImage();
                      },
                      color: AppColor.bluish,
                      textColor: Colors.white,
                      child: Text("اختر صورة"),
                    );
                  } else {
                    return Center(
                      child: ClipOval(
                        child: Image.memory(
                          controller.file!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }
                },
              ),

              SizedBox(height: 15),

              // زر الإضافة
              CustomButtonAuth(
                text: "إضافة المسجد",
                onPressed: () {
                  controller.AddMosque();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
