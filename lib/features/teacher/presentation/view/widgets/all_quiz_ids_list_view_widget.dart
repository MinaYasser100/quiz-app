import 'package:flutter/material.dart';
import 'package:quiz_app/core/func/check_internet_connection.dart';
import 'package:quiz_app/core/func/custom_no_internet_show_dialog.dart';
import 'package:quiz_app/features/quiz_results/presentation/views/quiz_results_view.dart';

import 'custom_quiz_id_item_widget.dart';

class AllQuizIdsListViewWidget extends StatelessWidget {
  const AllQuizIdsListViewWidget({
    super.key,
    required this.itemCount,
    required this.quizzesId,
  });
  final int itemCount;
  final List<Map<String, String>> quizzesId;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        final quiz = quizzesId[index];
        return GestureDetector(
          onTap: () async {
            bool internet = await checkInternetConnection();
            if (internet) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuizResultsView(
                    quizCode: quiz['quizID'] ?? 'No Quiz ID',
                  ),
                ),
              );
            } else {
              customNoInternetShowDialog(context);
            }
          },
          child: CustomQuizIdItemWidget(
            index: index,
            quizIdText: quiz['quizID'] ?? 'No Quiz ID',
            titleText: quiz['title'] ?? 'No Title',
          ),
        );
      },
    );
  }
}
