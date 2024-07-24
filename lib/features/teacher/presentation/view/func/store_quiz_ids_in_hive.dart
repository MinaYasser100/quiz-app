import 'package:hive/hive.dart';
import 'package:quiz_app/core/constant/constant.dart';

Future<void> storeQuizIdsInHive(String quizID, String title) async {
  var box = Hive.box<List<Map<String, String>>>(hiveQuizID);
  List<Map<String, String>>? quizIDsAndTitles =
      box.get('ids', defaultValue: []);
  quizIDsAndTitles!.add({'quizID': quizID, 'title': title});
  await box.put('ids', quizIDsAndTitles);
}
