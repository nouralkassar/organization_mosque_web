import 'package:organization_mosque_web/data/datasource/remote/decision_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handling_data_controller.dart';
import 'package:flutter/services.dart' show rootBundle;

class IssueDecisionController extends GetxController {
  final DecisionData decisionData = DecisionData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  List<String> decisionTypes = [
    "قرار تعيين مدير جديد",
    "قرار إنهاء تكليف مدير",
    " قرار تعليق مدير"
  ];
  String selectedDecisionType = "قرار تعيين مدير جديد";

  late TextEditingController fullNameController;
  late TextEditingController mosqueNameController;
  late TextEditingController dateController;

  StatusRequest statusRequest = StatusRequest.none;

  changeDecisionType(String value) {
    selectedDecisionType = value;
    update();
  }

  issueDecision() async {
    var formData = formstate.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await decisionData.issueDecision({
        "type_decision": selectedDecisionType,
        "full_name": fullNameController.text,
        "mosque_name": mosqueNameController.text,
        "date_decision": dateController.text,
      });
      print("========================$response");
//

      ///
      statusRequest = handlingData(response);
      print("🚦 Status after handling: $statusRequest");
      if (statusRequest == StatusRequest.success) {
        if (response['success'] == true) {
          print("hellllo--------------------");
          Get.defaultDialog(
            title: 'نجاح',
            middleText: response["message"],
          );
          Get.offAllNamed("/dashboard");
        } else {
          statusRequest == StatusRequest.failure;
          Get.defaultDialog(
            title: 'warning',
            middleText: 'Email OR password Not Correct',
          );
        }
      }
      update();
    } else {
      print("not vlid");
    }
  }

  @override
  void onInit() {
    fullNameController = TextEditingController();
    mosqueNameController = TextEditingController();
    dateController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    mosqueNameController.dispose();
    dateController.dispose();
    super.dispose();
  }

  generatePdf() async {
    final pdf = pw.Document();
    // تحميل الخط
    final fontData =
        await rootBundle.load("assets/fonts/Cairo/Cairo-Regular.ttf");
    final ttf = pw.Font.ttf(fontData);

    final imageBytes = await rootBundle.load('assets/images/template.PNG');
    final image = pw.MemoryImage(imageBytes.buffer.asUint8List());

    String fullName = fullNameController.text;
    String mosqueName = mosqueNameController.text;
    String decisionDate = dateController.text;

    String decisionText = '';
    if (selectedDecisionType.contains("تعيين")) {
      decisionText =
          "تم تعيين السيد $fullName ليكون مديراً لمسجد $mosqueName بتاريخ $decisionDate.";
    } else if (selectedDecisionType.contains("إنهاء")) {
      decisionText =
          "تم إنهاء تكليف السيد $fullName من إدارة مسجد $mosqueName بتاريخ $decisionDate.";
    } else {
      decisionText =
          "تم إصدار قرار بحق السيد $fullName يتعلق بمسجد $mosqueName بتاريخ $decisionDate.";
    }
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Stack(
            children: [
              pw.Positioned.fill(child: pw.Image(image, fit: pw.BoxFit.cover)),
              pw.Center(
                child: pw.Padding(
                  padding: const pw.EdgeInsets.all(32),
                  child: pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.Text('قرار إداري',
                          style: pw.TextStyle(
                              fontSize: 30,
                              fontWeight: pw.FontWeight.bold,
                              font: ttf)),
                      pw.SizedBox(height: 20),
                      pw.Text(
                        decisionText,
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(fontSize: 18, font: ttf),
                      ),
                      pw.SizedBox(height: 50),
                      pw.Text(
                        'التاريخ: $decisionDate',
                        style: pw.TextStyle(fontSize: 16, font: ttf),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }
}
