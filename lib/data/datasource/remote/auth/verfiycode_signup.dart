import 'package:organization_mosque_web/core/class/crud.dart';
import 'package:organization_mosque_web/link_api.dart';

class VerifyCodeSignUpData{

  Crud crud;

  VerifyCodeSignUpData(this.crud);

  postData(String email,String verifycode) async{
    var response =await crud.PostData(AppLink.verifyCodeSignUp, {

      "email" : email,
      "verifycode" : verifycode,


    });

    return response.fold((l) => l, (r) => r);
  }

}