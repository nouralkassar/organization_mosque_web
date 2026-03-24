import 'package:get/get.dart';
import '../core/functions/handling_data_controller.dart';
import '../data/datasource/remote/request_data.dart';
import '../core/class/statusrequest.dart';

class RequestController extends GetxController {
  final RequestData data = RequestData(Get.find());

  List<Map<String, dynamic>> requests = [];
  Map<int, Map<String, String>> pendingUpdates = {};

  late StatusRequest statusRequest;

  @override
  void onInit() {
    fetchRequests();
    super.onInit();
  }

  fetchRequests() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await data.getPreviousRequests();
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response is List) {
        requests = List<Map<String, dynamic>>.from(response);
      } else if (response is Map && response['data'] != null) {
        requests = List<Map<String, dynamic>>.from(response['data']);
      } else {
        requests = [];
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
      var req = requests.firstWhere((e) => e['id'] == requestId);
      req['status'] = updates['status'];
    }

    if (updates.containsKey('progress')) {
      await data.updateProgress(requestId, updates['progress']!);
      var req = requests.firstWhere((e) => e['id'] == requestId);
      req['progress'] = updates['progress'];
    }

    pendingUpdates.remove(requestId);
    update();
  }
}

