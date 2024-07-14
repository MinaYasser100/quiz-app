import 'package:flutter/material.dart';
import 'package:quiz_app/features/student/data/model/student_response_model.dart';

import '../../../../review/presentation/views/widgets/custom_review_info_widget.dart';
import '../../../../review/presentation/views/widgets/custom_review_question_sliver_list.dart';

class ShowStudentAnswersBodyView extends StatelessWidget {
  const ShowStudentAnswersBodyView(
      {super.key, required this.studentResponseModel});
  final StudentResponseModel studentResponseModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CustomReviewInfoWidget(
            isTeacher: true,
            studentResponseModel: studentResponseModel,
          ),
        ),
        CustomReviewQuestionSliverList(
          studentResponseModel: studentResponseModel,
        ),
      ],
    );
  }
}
