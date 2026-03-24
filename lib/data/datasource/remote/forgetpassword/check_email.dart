import 'package:organization_mosque_web/core/class/crud.dart';
import 'package:organization_mosque_web/link_api.dart';

class CheckEmailData{

  Crud crud;

  CheckEmailData(this.crud);

  postData(String email) async{
    var response =await crud.PostData(AppLink.checkemail, {
      "email" :email ,



    });

    return response.fold((l) => l, (r) => r);
  }

}