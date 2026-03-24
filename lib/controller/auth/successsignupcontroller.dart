import 'package:organization_mosque_web/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SucessSignUpController extends GetxController{

  goToPagrLogin();
}
class SucessSignUpControllerImp extends SucessSignUpController{
  @override
  goToPagrLogin() {
    Get.offAllNamed(AppRoute.login);
  }

}