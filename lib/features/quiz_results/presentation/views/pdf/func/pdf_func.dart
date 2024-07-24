import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:quiz_app/core/styles/styles.dart';
import 'package:quiz_app/features/quiz_results/presentation/views/pdf/model/data_paths_to_pdf.dart';
import 'package:quiz_app/features/quiz_results/presentation/views/pdf/pdf_service.dart';
import 'package:quiz_app/features/student/data/model/student_response_model.dart';

PdfDataModel getPdfDataModel(List<StudentResponseModel> studentResponses) {
  List<String> names = [];
  List<String> degres = [];
  for (var element in studentResponses) {
    names.add(element.name);
    degres.add(element.result.toString());
  }
  PdfDataModel pdfDataModel = PdfDataModel(
    names: names,
    degres: degres,
    date: gettingDayDate(),
    quizName: 'Quiz',
  );
  return pdfDataModel;
}

String gettingDayDate() {
  var now = DateTime.now();
  var formatter = DateFormat('yyyy-MM-dd');
  return formatter.format(now);
}

void printStudentDegres(
    {required List<StudentResponseModel> studentResponses,
    required BuildContext context}) async {
  EasyLoading.show(
    status: 'Loading...',
  );
  try {
    PdfDataModel pdfDataModel = getPdfDataModel(studentResponses);
    //generating pdf methode
    final pdfFile = await ApiPdfService.generate(pdfDataModel);
    //open file methode
    ApiPdfService.openfile(pdfFile);
  } catch (e) {
    errorOnCreatingFile(
      context: context,
      message: ' حدث خطاء اثناء انشاء الفايل رجاء اعادة المحاولة ',
    );
  }
  EasyLoading.dismiss();
}

AlertDialog errorOnCreatingFile(
    {required String message, required BuildContext context}) {
  return AlertDialog(
    title: Text(
      'Failure',
      style: Styles.textStyle20,
    ),
    content: Text(
      message,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.red,
        fontWeight: FontWeight.w600,
      ),
    ),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text(
          'Try Again',
        ),
      ),
    ],
  );
}
