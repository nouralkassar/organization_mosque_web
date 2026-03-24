// import 'dart:io';
//
// import 'package:ecommaerce_course/core/constant/routes.dart';
// import 'package:ecommaerce_course/data/datasource/remote/auth/add_manger.dart';
// import 'package:ecommaerce_course/data/datasource/remote/auth/signup.dart';
// import 'package:ecommaerce_course/view/screen/auth/add_manager.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
//
// import '../../core/class/statusrequest.dart';
// import '../../core/functions/handling_data_controller.dart';
// import '../data/datasource/remote/add_mosque.dart';
//
// abstract class AddMosqueController extends GetxController {
//   AddMosque();
//
// }
//
// class AddMosqueControllerImp extends AddMosqueController {
//   GlobalKey<FormState> formstate = GlobalKey<FormState>();
//
//   late TextEditingController name;
//   late TextEditingController address;
//   late TextEditingController area;
//   late TextEditingController details;
//   late TextEditingController technical_status;
//   late TextEditingController category;
//   bool has_female_section = false;
//   File? image;
//   final _piker = ImagePicker();
//
//   StatusRequest statusRequest=StatusRequest.none;
//
//   AddMosqueData addmosquetData = AddMosqueData(Get.find());
//
//   List data = [];
//
//   Future getImage() async {
//     try {
//       print("======================================== imagewee=====================");
//       final pickedfile = await _piker.pickImage(source: ImageSource.gallery, imageQuality: 80);
//
//       if (pickedfile != null) {
//         image = File(pickedfile.path);
//         update(); // تحديث الواجهة
//         print("Image picked: ${pickedfile.path}");
//       } else {
//         print("No image selected");
//       }
//     } catch (e) {
//       print("Error picking image: $e");
//     }
//   }
//
//   @override
//   AddMosque() async {
//     var formData = formstate.currentState;
//     if (formData!.validate()) {
//       statusRequest = StatusRequest.loading;
//       update();
//       var response = await addmosquetData.PostDataWithToken(
//         name.text,
//         address.text,
//         area .text,
//         details.text,
//         technical_status.text,
//         category.text,
//         has_female_section,
//           image!,
//        // image_path.text,
//       );
//       print("==============================response $response");
//       statusRequest = handlingData(response);
//       if (StatusRequest.success == statusRequest) {
//         if (response['success'] == true) {
//           Get.defaultDialog(
//             title: 'success',
//             middleText: 'Added Successfully',
//           );
//           Get.offNamed(AppRoute.items);
//           /// طريقة اخرى لحذف المعلومات من sign up لما رد ارجعلها مرة اخرى من Login
//           /// في صفح
//           //Get.delete<SignUpControllerImp>();
//           print("valid");
//         } else {
//           Get.defaultDialog(
//             title: 'warning',
//             middleText: 'Phone number OR Email Already exists',
//           );
//           statusRequest = StatusRequest.failure;
//
//         }
//       }
//       update();
//     } else {
//       print(" not valid");
//     }
//   }
//
//
//
//   @override
//   void onInit() {
//     name = TextEditingController();
//     address = TextEditingController();
//     area = TextEditingController();
//     details =TextEditingController();
//     technical_status =TextEditingController();
//     category =TextEditingController();
//   //  image_path =TextEditingController();
//
//     super.onInit();
//   }
//
//   @override
//   void dispose() {
//     name.dispose();
//     address.dispose();
//     area.dispose();
//     details.dispose();
//     technical_status.dispose();
//     category.dispose();
//  //   image_path.dispose();
//     super.dispose();
//   }
// }
