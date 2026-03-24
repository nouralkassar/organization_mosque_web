import 'package:organization_mosque_web/view/screen/auth/add_manager.dart';
import 'package:organization_mosque_web/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:organization_mosque_web/view/screen/auth/login.dart';
import 'package:organization_mosque_web/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:organization_mosque_web/view/screen/auth/sign_up.dart';
import 'package:organization_mosque_web/view/screen/auth/success_sign_up.dart';
import 'package:organization_mosque_web/view/screen/auth/forgetpassword/successresetpassword.dart';
import 'package:organization_mosque_web/view/screen/auth/forgetpassword/verfiycode.dart';
import 'package:organization_mosque_web/view/screen/auth/verfiy_code_sign_up.dart';
import 'package:organization_mosque_web/view/screen/complaints.dart';
import 'package:organization_mosque_web/view/screen/dashorad/dashboard.dart';
import 'package:organization_mosque_web/view/screen/dashorad/issuedecisionpage.dart';
import 'package:organization_mosque_web/view/screen/duration/add.dart';
import 'package:organization_mosque_web/view/screen/duration/edit.dart';
import 'package:organization_mosque_web/view/screen/duration/view.dart';
import 'package:organization_mosque_web/view/screen/home.dart';
import 'package:organization_mosque_web/view/screen/laguage.dart';
import 'package:organization_mosque_web/view/screen/manager/add.dart';
import 'package:organization_mosque_web/view/screen/manager/archieve.dart';
import 'package:organization_mosque_web/view/screen/manager/edit.dart';
import 'package:organization_mosque_web/view/screen/manager/view.dart';
import 'package:organization_mosque_web/view/screen/mosque/CoursesPage%20.dart';
import 'package:organization_mosque_web/view/screen/mosque/add.dart';
import 'package:organization_mosque_web/view/screen/mosque/archive.dart';
import 'package:organization_mosque_web/view/screen/mosque/details_view_mosque.dart';
import 'package:organization_mosque_web/view/screen/mosque/edit.dart';
import 'package:organization_mosque_web/view/screen/mosque/halaqat_page.dart';
import 'package:organization_mosque_web/view/screen/mosque/view.dart';
import 'package:organization_mosque_web/view/screen/request.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'core/constant/routes.dart';
import 'core/middleware/my_middleware.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddeeWare()]),

  /// Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signup, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetpassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiycode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetpassword, page: () => const Resetpassword()),
  GetPage(
      name: AppRoute.successresertpassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successsignup, page: () => const SuccessSignUp()),
  GetPage(
      name: AppRoute.verfiycodesignup, page: () => const VerfiyCodeSignUp()),

  ///

  GetPage(name: AppRoute.AddUser, page: () => const AddUser()),
  GetPage(name: AppRoute.Home, page: () => const Home()),
  GetPage(name: AppRoute.Dashboard, page: () => const Dashboard()),
  GetPage(name: AppRoute.Mosque, page: () => const AllMosque()),
  GetPage(name: AppRoute.AddMosque, page: () => const AddMosque()),
  GetPage(name: AppRoute.EditMosque, page: () => const EditMosque()),
  GetPage(
      name: AppRoute.ArchiveDeleteMosque,
      page: () => const ArchiveDeleteMosque()),
  GetPage(name: AppRoute.detailMosque, page: () => DetailMosque()),
  GetPage(name: AppRoute.Manager, page: () => const AllManager()),
  GetPage(name: AppRoute.AddMAnager, page: () => const AddManagerToMosque()),
  GetPage(name: AppRoute.EditManager, page: () => const EditManager()),
  GetPage(
      name: AppRoute.ArchiveDeleteManager,
      page: () => const ArchiveDeleteManager()),
  GetPage(name: AppRoute.issueDecision, page: () => IssueDecisionPage()),
  GetPage(
    name: AppRoute.halaqatpage,
    page: () => HalaqatPage(),
    arguments: {
      "name": "الدوام الصباحي",
      "date": "2025-07-11",
    },
  ),

  GetPage(
    name: "/coursesPage",
    page: () => CoursesPage(),
  ),

  //////  request
  GetPage(name: AppRoute.Requset, page: () => const RequestView()),

  ///////// complaints
  GetPage(name: AppRoute.Complaints, page: () => const ComplaintsView()),

  /////// duration
  GetPage(name: AppRoute.addDuration, page: () => const AddDuration()),
  GetPage(name: AppRoute.viewDuration, page: () => const ManagerDuration()),
  GetPage(name: AppRoute.EditDuration, page: () => const EditDuration()),



];
