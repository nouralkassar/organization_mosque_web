import 'package:get/get.dart';
import '../core/functions/handling_data_controller.dart';
import '../data/datasource/remote/complaints_data.dart';
import '../core/class/statusrequest.dart';

class ComplaintsController extends GetxController {
  final ComplaintsData data = ComplaintsData(Get.find());

  List<Map<String, dynamic>> complaints = [];
  Map<int, Map<String, String>> pendingUpdates = {};

  late StatusRequest statusRequest;

  @override
  void onInit() {
    fetchComplaints();
    super.onInit();
  }

  fetchComplaints() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await data.getPreviousComplaints();
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response is List) {
        complaints = List<Map<String, dynamic>>.from(response);
      } else if (response is Map && response['data'] != null) {
        complaints = List<Map<String, dynamic>>.from(response['data']);
      } else {
        complaints = [];
      }
    }

    update();
  }


  void setTemporaryUpdate(int requestId, String key, String value) {
    pendingUpdates.putIfAbsent(requestId, () => {});
    pendingUpdates[requestId]![key] = value;
    update();
  }


  Future<void> saveUpdates(int requestId) async {
    if (!pendingUpdates.containsKey(requestId)) return;

    final updates = pendingUpdates[requestId]!;

    if (updates.containsKey('status')) {
      await data.updateStatus(requestId, updates['status']!);
      var req = complaints.firstWhere((e) => e['id'] == requestId);
      req['status'] = updates['status'];
    }



    pendingUpdates.remove(requestId);
    update();
  }
}

