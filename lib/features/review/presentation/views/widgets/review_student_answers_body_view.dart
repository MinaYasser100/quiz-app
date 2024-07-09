import 'package:flutter/material.dart';
import 'package:quiz_app/features/student/data/model/student_response_model.dart';

import 'custom_back_to_toggle_view.dart';
import 'custom_review_info_widget.dart';
import 'custom_review_question_sliver_list.dart';

class ReviewStudentAnswersBodyView extends StatelessWidget {
  const ReviewStudentAnswersBodyView(
      {super.key, required this.studentResponseModel});
  final StudentResponseModel studentResponseModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CustomReviewInfoWidget(
            studentResponseModel: studentResponseModel,
          ),
        ),
        CustomReviewQuestionSliverList(
          studentResponseModel: studentResponseModel,
        ),
        const SliverFillRemaining(
          hasScrollBody: false,
          child: CustomBackToToggleView(),
        ),
      ],
    );
  }
}
