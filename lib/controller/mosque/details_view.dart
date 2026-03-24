import 'package:organization_mosque_web/core/constant/routes.dart';
import 'package:organization_mosque_web/data/model/mosque_model.dart';
import 'package:organization_mosque_web/data/model/manager_model.dart';
import 'package:get/get.dart';
import '../../data/datasource/remote/mosque.dart';

abstract class DetailsMosqueController extends GetxController {
  fetchManagers();
  addDuration();

}

class DetailsMosqueControllerImp extends DetailsMosqueController {
  MosqueModel? mosque;
  List<ManagerModel> managers = [];

  MosqueData mosqueData = MosqueData(Get.find());

  // ✅ بيانات الدوامات – مؤقتة وثابتة للتجريب
  List<ShiftModel> shifts = [
    ShiftModel(name: "الدوام الاول / ذكور", from: "04:30 ص", to: "06:00 ص"),
    ShiftModel(name: "الدوام الثاني / اناث", from: "12:30 م", to: "01:30 م"),
    ShiftModel(name: "الدوام الثالث / اناث ", from: "03:45 م", to: "05:00 م"),
  ];

  @override
  void onInit() {
    mosque = Get.arguments['mosque'];
    super.onInit();
  }



  fetchManagers() async {
    try {
      print("🔍 جاري جلب القائمين للمسجد ID: ${mosque?.id}");

      var response = await mosqueData.getArchivedStaff(mosque!.id!);

      print("📦 استجابة السيرفر:");
      print(response);

      if (response['success'] == true) {
        List data = response['data'];
        print("📋 عدد القائمين المسترجعين: ${data.length}");

        managers = data.map((e) => ManagerModel.fromJson(e)).toList();

        for (var manager in managers) {
          print("👤 ${manager.full_name} - ${manager.role}");
        }

        update(); // لو عم تستخدم GetBuilder
      } else {
        print("❌ فشل في تحميل القائمين: ${response['message']}");
        Get.snackbar("خطأ", "فشل في تحميل القائمين");
      }
    } catch (e) {
      print("❗️حدث استثناء أثناء جلب القائمين: $e");
      Get.snackbar("خطأ", "حدث خطأ أثناء تحميل البيانات");
    }
  }

  @override
  addDuration() {
    Get.offNamed(AppRoute.addDuration);
  }
}

/// ✅ نموذج بسيط للدوامات (داخل نفس الملف أو ضيفه بملف خارجي لو تحب)
class ShiftModel {
  final String name;
  final String from;
  final String to;

  ShiftModel({
    required this.name,
    required this.from,
    required this.to,
  });
}
