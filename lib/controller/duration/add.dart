import 'package:organization_mosque_web/controller/mosque/viewcontroller.dart';
import 'package:organization_mosque_web/core/constant/routes.dart';
import 'package:organization_mosque_web/data/datasource/remote/manager/manager_data.dart';
import 'package:organization_mosque_web/data/model/mosque_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../core/functions/uploadimage.dart';
import '../../data/datasource/remote/duration.dart';
import '../../data/datasource/remote/mosque.dart';
import '../../data/model/manager_model.dart';

abstract class AddDurationController extends GetxController {

  AddDuration();
}

class AddDurationControllerImp extends AddDurationController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController name;
  late TextEditingController type;
  late TextEditingController daysOfWeek;
  late TextEditingController start_time;
  late TextEditingController end_time;

  List<ManagerModel> managersList = [];
  List<MosqueModel> mosqueList = [];

  String? selectedMosqueId ;
  String? selectedManagerId ;

  StatusRequest statusRequest = StatusRequest.none;

  DurationtData durationtData = DurationtData(Get.find());
  MosqueData mosqueData = MosqueData(Get.find());
 ManagerData managerData =ManagerData(Get.find());
  List<MosqueModel> data = [];


  @override
  AddDuration() async {
    if (formstate.currentState!.validate()) {

      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "mosque_id": selectedMosqueId.toString(),
        "staff_id": selectedManagerId.toString(),
        "name": name.text,
        "type": type.text,
        "daysOfWeek": daysOfWeek.text,
        "start_time": start_time.text,
        "end_time": end_time.text,

      };
      var response = await durationtData.AddDuration(data);
      print("==============================response $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['success'] == true) {
          Get.delete<AddDurationControllerImp>();
          Get.offNamed(AppRoute.Dashboard);

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

  void getMosques() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await mosqueData.get();
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['success'] == true) {
        List mosqueRaw = response['data'];
        mosqueList = mosqueRaw.map((e) => MosqueModel.fromjson(e)).toList();
      }
    }

    update();
  }
  void fetchManagers() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await managerData.get();
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest ) {
      if (response['success'] == true) {
        List managerRaw = response['data'];
        managersList = managerRaw.map((e) => ManagerModel.fromJson(e)).toList();
      }

    }

    update();
  }
  @override
  void onInit() {
    name = TextEditingController();
    type = TextEditingController();
    daysOfWeek = TextEditingController();
    start_time = TextEditingController();
    end_time = TextEditingController();
    getMosques();
    fetchManagers();

    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    type.dispose();
    daysOfWeek.dispose();
    start_time.dispose();
    end_time.dispose();
    super.dispose();
  }


}
