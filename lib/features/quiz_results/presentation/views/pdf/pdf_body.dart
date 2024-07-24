import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:quiz_app/features/quiz_results/presentation/views/pdf/model/data_paths_to_pdf.dart';

class PdfStudentDegresBody {
  static MultiPage pdfBody(PdfDataModel data) {
    return MultiPage(
      footer: (context) {
        return pIeChartCountFooterPdf(data);
      },
      header: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Data : ${data.date}'),
            Text('Quiz Name : ${data.quizName}'),
          ],
        );
      },
      pageFormat: PdfPageFormat.a4, // setting the page size
      build: (context) => [
        SizedBox(height: 30),
        // title of the pdf page
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Studnets Examined Examiners',
              style: const TextStyle(fontSize: 25),
            ),
          ],
        ),
        SizedBox(height: 8),
        buildTable(data),
        SizedBox(height: 8),
      ],
    );
  }

  static Row pIeChartCountFooterPdf(PdfDataModel data) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text('Student\'s Results'), // should be dynamicaly
      Text('Date : ${data.date}')
    ]);
  }

  static Widget buildTable(PdfDataModel data) {
    List heardersList = [
      'Name',
      'Degree',
    ];
    List<String> names = data.names;
    List<String> gredess = data.degres;
    List<List<String>> tableData = [];
    for (int i = 0; i < names.length; i++) {
      tableData.add([names[i], gredess[i]]);
    }

    return TableHelper.fromTextArray(
      headers: heardersList,
      cellAlignment: Alignment.center,
      border: null,
      headerStyle: const TextStyle(
        fontSize: 20,
      ),
      headerDecoration: const BoxDecoration(
        color: PdfColors.grey300,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      data: tableData,
    );
  }
}
