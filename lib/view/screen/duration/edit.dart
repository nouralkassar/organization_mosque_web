import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../animation/duration/edit.dart';
import '../../../controller/duration/edit.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/valid_input.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextformauth.dart';

class EditDuration extends StatelessWidget {
  const EditDuration({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditDurationControllerImp());
    return Scaffold(
      // backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/login.png", // ضع المسار الصحيح هنا
              fit: BoxFit.cover,
            ),
          ),

          // الحاوية في الوسط مع حدود للعرض والارتفاع
          Center(
            child: GetBuilder<EditDurationControllerImp>(
              builder: (controller) => handlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  width: 600,
                  constraints: BoxConstraints(
                      //  maxHeight: screenHeight * 0.7,
                      ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  decoration: BoxDecoration(
                    color: AppColor.Begie.withOpacity(0.5),
                    // border: Border.all(
                    //     // color: AppColor.bluish,
                    //     // width: 2,
                    //     ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      // BoxShadow(
                      //   color: Colors.black26,
                      //   blurRadius: 5,
                      //   offset: Offset(0, 5),
                      // ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "تعديل الدوام",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColor.bluish,
                          ),
                        ),
                        const SizedBox(height: 20),
                        AnimatedEditDurationCard(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
