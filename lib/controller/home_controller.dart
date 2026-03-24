import 'package:organization_mosque_web/core/services/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

}
class HomeControllerImp extends HomeController{
  MyServices myServices= Get.find();

  String? username;

  initialData(){

    username =myServices.sharedPreferences.getString("name");

  }
@override
  void onInit() {
  initialData();
    super.onInit();
  }

}