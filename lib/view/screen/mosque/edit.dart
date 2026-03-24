import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../animation/mousque/animation_card_edit_mosque.dart';
import '../../../controller/mosque/addcontroller.dart';
import '../../../controller/mosque/editcontroller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/uploadimage.dart';
import '../../../core/functions/valid_input.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextformauth.dart';

class EditMosque extends StatelessWidget {
  const EditMosque({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditMosqueControllerImp());

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent,
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
            child: GetBuilder<EditMosqueControllerImp>(
              builder: (controller) => handlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  width: screenWidth * 0.7,
                  constraints: BoxConstraints(
                    maxHeight: screenHeight * 0.7,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  decoration: BoxDecoration(
                    color: AppColor.Begie,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "تعديل مسجد",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColor.bluish,
                          ),
                        ),
                        const SizedBox(height: 20),
                        AnimatededitdMosqueCard(),
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
