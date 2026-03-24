import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'binding/init_binding.dart';
import 'core/localization/changedlocal.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';
import 'root.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //// اول ما شغل بيكون هاد السيرفيسيس جاهز
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: controller.language,
      theme: controller.appTheme,
      initialBinding: InitialBindings(),
      //routes: routes,
      getPages: routes,
    );
  }
}
