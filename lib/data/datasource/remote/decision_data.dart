import 'package:organization_mosque_web/core/class/crud.dart';

import '../../../link_api.dart';

class DecisionData {
  Crud crud;
  DecisionData(this.crud);

  issueDecision(Map<String, String> data) async {
    var response = await crud.PostDataWithToken(AppLink.issueDecision, data);
    return response.fold((l) => l, (r) => r);
  }
}
