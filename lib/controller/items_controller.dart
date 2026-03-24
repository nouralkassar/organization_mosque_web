//
// import 'package:get/get.dart';
//
// import '../core/class/statusrequest.dart';
// import '../core/functions/handling_data_controller.dart';
// import '../data/datasource/remote/items_data.dart';
// import '../data/model/itemsmodel.dart';
//
//
// abstract class ItemsController extends GetxController{
//
//   getItems(  );
//   goToPageProductDetails(ItemsModel itemsModel);
//
// }
// class ItemsControllerImp extends ItemsController{
//
//
//
//   ItemsData itemsData =ItemsData(Get.find());
//
//   List data=[];
//
//   StatusRequest statusRequest=StatusRequest.none;
//
//
//
//   @override
//   void onInit() {
//
//     getItems();
//     super.onInit();
//   }
//
//
//
//
//
//   @override
//   getItems(  ) async {
//     data.clear();
//     statusRequest =StatusRequest.loading;
//     var response = await itemsData.getData();
//     print("==============================response $response");
//     statusRequest =handlingData(response);
//     if(StatusRequest.success == statusRequest){
//       if(response ['success'] == true){
//         data.addAll(response['data']);
//       }
//       else{
//         statusRequest =StatusRequest.failure;
//       }
//     }
//     update();
//
//   }
//
//   @override
//   goToPageProductDetails( itemsModel){
//     Get.toNamed("productdetails" , arguments:  {"itemsmodel" :itemsModel});
//   }
// }