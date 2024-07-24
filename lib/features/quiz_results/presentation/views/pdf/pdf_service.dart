import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';
import 'package:open_file/open_file.dart';

import 'model/data_paths_to_pdf.dart';
import 'pdf_body.dart';

class ApiPdfService {
  static Future<File> savePDF(
      {required Document pdf, required String name}) async {
    // Specify the file path where you want to save the PDF
    final bytes = await pdf.save();
    final dir = await getApplicationCacheDirectory();
    final file = File('${dir.path}/$name');
    await file.writeAsBytes(bytes);
    return file;
  }

  static Future openfile(File file) async {
    final url = file.path;
    await OpenFile.open(url);
  }

  static Future<File> generate(PdfDataModel pdfDataModel) async {
    final pdf = Document();
    pdf.addPage(PdfStudentDegresBody.pdfBody(pdfDataModel));
    return ApiPdfService.savePDF(pdf: pdf, name: 'My_Pdf.pdf');
  }
}
