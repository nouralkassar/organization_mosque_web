import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/functions/valid_input.dart';
import '../../../../core/constant/color.dart';
import '../../controller/mosque/addcontroller.dart';
import '../../controller/mosque/editcontroller.dart';
import '../../view/widget/auth/custombuttonauth.dart';
import '../../view/widget/auth/customtextformauth.dart';

class AnimatededitdMosqueCard extends StatefulWidget {
  const AnimatededitdMosqueCard({super.key});

  @override
  State<AnimatededitdMosqueCard> createState() =>
      _AnimatededitdMosqueCardState();
}

class _AnimatededitdMosqueCardState extends State<AnimatededitdMosqueCard> {
  double _widthFactor = 0.2;
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      if (!mounted) return;
      setState(() {
        _widthFactor = 0.5;
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EditMosqueControllerImp>();

    return Center(
      child: Form(
        key: controller.formstate,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      CustomTextFormAuth(
                        hindtext: "ادخل الاسم ",
                        labeltext: "الاسم",
                        iconData: Icons.person,
                        mycontroller: controller.name,
                        valid: (val) {
                          return validInput(val!, 3, 100, "name");
                        },
                        isNumber: false,
                      ),
                      CustomTextFormAuth(
                        hindtext: "ادخل العنوان ",
                        labeltext: "العنوان",
                        iconData: Icons.location_on,
                        mycontroller: controller.address,
                        valid: (val) {
                          return validInput(val!, 5, 100, "name");
                        },
                        isNumber: false,
                      ),
                      CustomTextFormAuth(
                        hindtext: "ادخل المنطقة",
                        labeltext: "المنطقة",
                        iconData: Icons.area_chart,
                        mycontroller: controller.area,
                        valid: (val) {
                          return validInput(val!, 1, 13, "number");
                        },
                        isNumber: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20), // مسافة بين العمودين
                Expanded(
                  child: Column(
                    children: [
                      CustomTextFormAuth(
                        hindtext: "ادخل التفاصيل",
                        labeltext: "التفاصيل",
                        iconData: Icons.person,
                        mycontroller: controller.details,
                        valid: (val) {
                          return validInput(val!, 3, 100, "name");
                        },
                        isNumber: false,
                      ),
                      CustomTextFormAuth(
                        hindtext: "ادخل الحالة التقنية",
                        labeltext: "التقنية",
                        iconData: Icons.military_tech,
                        mycontroller: controller.technical_status,
                        valid: (val) {
                          return validInput(val!, 3, 13, "name");
                        },
                        isNumber: true,
                      ),
                      CustomTextFormAuth(
                        hindtext: "ادخل الفئة",
                        labeltext: "الفئة",
                        iconData: Icons.category,
                        mycontroller: controller.category,
                        valid: (val) {
                          return validInput(val!, 1, 13, "enum");
                        },
                        isNumber: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // باقي العناصر تحت الأعمدة
            GetBuilder<EditMosqueControllerImp>(
              builder: (controller) => InkWell(
                onTap: () {
                  controller.has_female_section = !controller.has_female_section;
                  controller.update();
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 180.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                          activeColor: AppColor.bluish,
                          checkColor: AppColor.black,
                          value: controller.has_female_section,
                          onChanged: (val) {
                            controller.has_female_section = val!;
                            controller.update();
                          },
                        ),
                        SizedBox(width: 160),
                        Text(
                          "هل يوجد قسم نسائي؟",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // الصورة وباقي العناصر كما هي
            Column(
              children: [
                GetBuilder<EditMosqueControllerImp>(
                  builder: (controller) {
                    Widget imageWidget;

                    if (controller.file != null) {
                      imageWidget = ClipOval(
                        child: Image.memory(
                          controller.file!,
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      );
                    } else if (controller.mosqueModel?.image_path != null &&
                        controller.mosqueModel!.image_path!.isNotEmpty) {
                      imageWidget = ClipOval(
                        child: Image.network(
                          controller.mosqueModel!.image_path!,
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      );
                    } else {
                      imageWidget = Icon(
                        Icons.image_not_supported,
                        size: 100,
                        color: Colors.grey,
                      );
                    }

                    return InkWell(
                      onTap: () {
                        controller.chooseImage();
                      },
                      child: imageWidget,
                    );
                  },
                ),
              ],
            ),

            SizedBox(height: 20),
            CustomButtonAuth(
              text: "Edit mosque",
              onPressed: () {
                controller.EditMosque();
              },
            ),
          ],
        ),
      ),
    );
  }
}
