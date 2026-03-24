import 'package:get/get.dart';
import 'package:organization_mosque_web/core/class/crud.dart';
import 'package:organization_mosque_web/core/services/services.dart';

class StatsController extends GetxController {
  var mosques = "0".obs;
  var supervisors = "0".obs;
  var requests = "0".obs;
  var complaints = "0".obs;

  Crud crud = Crud();
  MyServices myServices = Get.find();

  Future<void> fetchStats() async {
    String? token = myServices.sharedPreferences.getString("token");
    if (token == null) {
      print("❌ No token found, cannot fetch stats");
      return;
    }

    var url = "http://127.0.0.1:8000/api/admin/getStats";

    var response = await crud.getData(url);

    response.fold(
      (failure) {
        print("❌ Failed to fetch stats: $failure");
      },
      (data) {
        print("📌 Stats fetched: $data");
        mosques.value = data['data']['mosques'].toString();
        supervisors.value = data['data']['supervisors'].toString();
        requests.value = data['data']['requests'].toString();
        complaints.value = data['data']['complaints'].toString();
      },
    );
  }
}
