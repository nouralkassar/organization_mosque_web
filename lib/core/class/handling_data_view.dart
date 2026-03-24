import 'package:organization_mosque_web/core/class/statusrequest.dart';
import 'package:organization_mosque_web/core/constant/color.dart';
import 'package:organization_mosque_web/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class handlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const handlingDataView({super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading ?
        Center(child: Lottie.asset(AppImageAsset.loading , width: 250,height: 250,repeat: true)) :
    statusRequest == StatusRequest.offlinefailure ?
    Center(child: Lottie.asset(AppImageAsset.offline , width: 250,height: 250,repeat: true)) :
    statusRequest == StatusRequest.serverfailure ?
        //////////////////// لا تنسي تحملي صورة السيرفر
    Center(child:Lottie.asset(AppImageAsset.noData , width: 250,height: 250 ,repeat: true)) :
    statusRequest == StatusRequest.failure ?
    Center(child: Lottie.asset(AppImageAsset.noData , width: 250,height: 250 ,repeat: true)) : widget;

  }
}


class handlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const handlingDataRequest({super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading ?
    Center(child: Lottie.asset(AppImageAsset.loading , width: 250,height: 250,repeat: true)) :
    statusRequest == StatusRequest.offlinefailure ?
    Center(child: Lottie.asset(AppImageAsset.offline , width: 250,height: 250,repeat: true)) :
    statusRequest == StatusRequest.serverfailure ?
    //////////////////// لا تنسي تحملي صورة السيرفر
    Center(child:Lottie.asset(AppImageAsset.noData , width: 250,height: 250 ,repeat: true)) :
   widget;

  }
}