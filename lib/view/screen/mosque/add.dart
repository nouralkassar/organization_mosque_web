import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../animation/mousque/animation_card_addmosque.dart';
import '../../../controller/mosque/addcontroller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/uploadimage.dart';
import '../../../core/functions/valid_input.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextformauth.dart';

class AddMosque extends StatelessWidget {
  const AddMosque({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddMosqueControllerImp());

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // خلفية الصورة
          Image.asset(
            "assets/images/login.png", // ضع المسار الصحيح هنا
            fit: BoxFit.cover,
          ),

          // طبقة شفافة غامقة قليلاً
          Positioned.fill(
            child: Container(
              color: AppColor.Begie.withOpacity(0.2),
            ),
          ),
          // المحتوى (الحقول)
          GetBuilder<AddMosqueControllerImp>(
            builder: (controller) => handlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                decoration: BoxDecoration(
                  color: AppColor.Begie.withOpacity(0.2), // لون الخلفية للصندوق
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.5), // حدود خفيفة
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(20), // زوايا مدورة
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 80),
                    child: Form(
                      key: controller.formstate,
                      child: AnimatedAddMosqueCard(),
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
