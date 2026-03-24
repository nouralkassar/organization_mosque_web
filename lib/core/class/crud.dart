import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:organization_mosque_web/core/class/statusrequest.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:path/path.dart';
import '../services/services.dart';
import 'package:file_picker/file_picker.dart'; // لاستخدام ملفات الويب

MyServices myServices = Get.find();
String? token = myServices.sharedPreferences.getString("token");

// String _basicAuth =
//     'Basic ${base64Encode(utf8.encode('dddd:sdfsdfsdfsdfdsf'))}';
Map<String,String> _myheaders={    //authorization':_basicAuth,
  'Accept': 'application/json',
  'Authorization': 'Bearer $token',
};

class Crud{


  Future<Either<StatusRequest,Map>> PostData( String linkurl, Map data) async{
try{

    print("🚀 Sending data: $data"); // اطبع البيانات قبل الإرسال

    var response = await http.post(Uri.parse(
        linkurl),
        headers: {

          'Accept': 'application/json',

        },
        body:data
    );
    if(response.statusCode == 200 ||response.statusCode == 201 ){

      Map responsebody = jsonDecode(response.body);
      return Right(responsebody);
    }else{
      print("❌ Server returned error:");
      print("🔢 Status code: ${response.statusCode}");
      print("📦 Response body: ${response.body}");
      return Left(StatusRequest.serverfailure);

    }
  }


catch(e){
  print("❗ Exception occurred: $e");  // هذا مهم جداً

  return Left(StatusRequest.serverExption);
}
}

  Future<Either<StatusRequest, Map>> PostDataWithToken(String linkurl,Map data) async {
    try {

      var response = await http.post(Uri.parse(linkurl),
          headers: {

            'Accept': 'application/json',
            'Authorization': 'Bearer $token',

          },
          body:data);
      if (response.statusCode == 200) {
        Map responsebody = jsonDecode(response.body);
        return Right(responsebody);
      } else {
        print("❌ Server returned error:");
        print("🔢 Status code: ${response.statusCode}");
        print("📦 Response body: ${response.body}");
        return Left(StatusRequest.serverfailure);
      }

    } catch (e) {
      print("❗ Exception occurred: $e");
      return Left(StatusRequest.serverExption);
    }
  }



  Future<Either<StatusRequest, Map>> DeleteData(String linkurl) async {
    try {
      var response = await http.delete(
        Uri.parse(linkurl),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        return Right({"status": "success"});
      } else {
        print("❌ Error: ${response.statusCode}");
        print("📦 Body: ${response.body}");
        return Left(StatusRequest.serverfailure);
      }
    } catch (e) {
      print("❗ Exception: $e");
      return Left(StatusRequest.serverExption);
    }
  }

  Future<Either<StatusRequest, Map>> getData(String linkurl) async {
    try {
      final url = Uri.parse(linkurl);
       final response = await http.get(url,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
    //  print("📥 Raw response body:\n${response.body}");
      if (response.statusCode == 200) {
        print(url);
        try {
          Map responsebody = jsonDecode(response.body);
          print(responsebody);
          // print("✅ Decoded JSON: $responsebody");
          return Right(responsebody);
        } catch (e) {
          print("❗ Error decoding JSON: $e");
          return Left(StatusRequest.serverExption);
        }
      } else {
        print("❌ Server returned error:");
        print("🔢 Status code: ${response.statusCode}");
        print("📦 Response body:\n${response.body}");
        return Left(StatusRequest.serverfailure);
      }

    } catch (e) {
      print("❗ Unexpected exception occurred: $e");
      return Left(StatusRequest.serverExption);
    }
  }


  Future<Either<StatusRequest, Map>> addRequestWithImageOne(
      String url, Map data, dynamic image,
      [String? namerequest]) async {
    if (namerequest == null) {
      namerequest = "image_path";
    }

    var uri = Uri.parse(url);
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll(_myheaders);

    print("🧾 Preparing multipart request to: $url");
    print("📤 Headers: ${request.headers}");
    print("📄 Fields: $data");

    if (image != null) {
      if (kIsWeb && image is Uint8List) {
        print("🌐 Detected Web (Uint8List)");
        var multipartFile = http.MultipartFile.fromBytes(
          namerequest,
          image,
          filename: "upload_image.jpg", // اسم افتراضي
        );
        request.files.add(multipartFile);
        print("📎 Image added as MultipartFile.fromBytes");
      } else if (image is File) {
        print("📂 Detected File from local system");
        var length = await image.length();
        var stream = http.ByteStream(image.openRead());
        var multipartFile = http.MultipartFile(namerequest, stream, length,
            filename: basename(image.path));
        request.files.add(multipartFile);
        print("📎 Image added as MultipartFile from File");
      } else {
        print("⚠️ Unknown image type: ${image.runtimeType}");
      }
    } else {
      print("📎 No image provided");
    }

    data.forEach((key, value) {
      request.fields[key] = value;
    });

    try {
      print("🚀 Sending request...");
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      print("✅ Response status code: ${response.statusCode}");
      print("📥 Response body: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responseBody = jsonDecode(response.body);
        return Right(responseBody);
      } else {
        print("❌ Server returned error status");
        return const Left(StatusRequest.serverfailure);
      }
    } catch (e) {
      print("❗ Exception during upload: $e");
      return Left(StatusRequest.serverExption);
    }
  }

}