import 'package:organization_mosque_web/core/class/crud.dart';
import 'package:organization_mosque_web/link_api.dart';

class VerifyCodeForgetPassword{

  Crud crud;

  VerifyCodeForgetPassword(this.crud);

  postData(String email,String verifycode) async{
    var response =await crud.PostData(AppLink.verifycodeforgetpassword, {
      "email" :email ,
      "code" : verifycode,


    });

    return response.fold((l) => l, (r) => r);
  }

}