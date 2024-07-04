import 'package:flutter/material.dart';

import 'custom_quiz_id_item_widget.dart';

class AllQuizIdsListViewWidget extends StatelessWidget {
  const AllQuizIdsListViewWidget({
    super.key,
    required this.itemCount,
    required this.quizzesId,
  });
  final int itemCount;
  final List<String> quizzesId;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return CustomQuizIdItemWidget(
          index: index,
          quizIdText: quizzesId[index],
        );
      },
    );
  }
}
