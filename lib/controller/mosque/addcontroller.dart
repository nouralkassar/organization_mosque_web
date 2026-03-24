import 'package:organization_mosque_web/controller/mosque/viewcontroller.dart';
import 'package:organization_mosque_web/core/constant/routes.dart';
import 'package:organization_mosque_web/data/model/mosque_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../core/functions/uploadimage.dart';
import '../../data/datasource/remote/mosque.dart';

abstract class AddMosqueController extends GetxController {
  chooseImage();
  AddMosque();
}

class AddMosqueControllerImp extends AddMosqueController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController name;
  late TextEditingController address;
  late TextEditingController area;
  late TextEditingController details;
  late TextEditingController technical_status;
  late TextEditingController category;
  bool has_female_section = false;

  StatusRequest statusRequest = StatusRequest.none;

  MosqueData mosqueData = MosqueData(Get.find());

  List<MosqueModel> data = [];

  dynamic? file;

  @override
  chooseImage() async {
    file = await fileUpLoadGallery();
    print("🧾 File type: ${file.runtimeType}");
    update();
  }

  @override
  AddMosque() async {
    if (formstate.currentState!.validate()) {
      if (file == null) Get.snackbar("تحذير", "رجاء اختار صورة");

      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "name": name.text,
        "address": address.text,
        "area": area.text,
        "details": details.text,
        "technical_status": technical_status.text,
        "category": category.text,
        "has_female_section": has_female_section ? "1" : "0",
      };
      var response = await mosqueData.add(data, file!);
      print("==============================response $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['success'] == true) {
          Get.delete<AddMosqueControllerImp>();
          /////////////////////////////////// هنا التغيير
          Get.offNamed(AppRoute.Dashboard);
          ViewAllMosqueControllerImp c = Get.find();
          c.GetAllMosque();
          print("valid");
        } else {
          print("Not valid");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("Not valid formstate");
    }
  }

  @override
  void onInit() {
    name = TextEditingController();
    address = TextEditingController();
    area = TextEditingController();
    details = TextEditingController();
    technical_status = TextEditingController();
    category = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    address.dispose();
    area.dispose();
    details.dispose();
    technical_status.dispose();
    category.dispose();
    super.dispose();
  }
}
