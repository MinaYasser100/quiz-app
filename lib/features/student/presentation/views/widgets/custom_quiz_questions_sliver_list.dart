import 'package:flutter/material.dart';
import 'package:quiz_app/core/constant/app_color.dart';
import 'package:quiz_app/features/toggle/data/model/question_model.dart';

class CustomQuizQuestionsSliverList extends StatelessWidget {
  const CustomQuizQuestionsSliverList({
    super.key,
    required this.questions,
  });
  final List<QuestionModel> questions;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
          (context, index) => Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColor.primaryColor, // Border color
                      width: 1.0, // Border width
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Question'),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        'ajsklddkshafkljd;klfha;khdf;kahs;kdfhajkshfjkahk;fhasd;khfjklsdahfklh',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Divider(
                        color: AppColor.primaryColor,
                      ),
                      const Text('Answer'),
                      const SizedBox(
                        height: 10,
                      ),
                      for (int i = 0; i < 4; i++)
                        Column(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.radio_button_off_outlined,
                                    color: AppColor.primaryColor,
                                  ),
                                  onPressed: () {},
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Expanded(
                                  child: Text(
                                    'messssssssssssssssssssssssssssssss sssssssssssssssssssssssssssssssssssssi',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: Colors.grey[300],
                            )
                          ],
                        )
                    ],
                  ),
                ),
              ),
          childCount: questions.length),
    );
  }
}
