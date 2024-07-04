import 'package:hive/hive.dart';
import 'package:quiz_app/core/constant/constant.dart';

Future<void> storeQuizIdsInHive(String quizID) async {
  var box = Hive.box<List<String>>(hiveQuizID);
  List<String>? quizIDs = box.get('ids', defaultValue: []);
  quizIDs!.add(quizID);
  await box.put('ids', quizIDs);
}
