import 'package:flutter/material.dart';
import 'package:student_app/presentation/components/answer-container/vertical_answer.dart';
import 'package:student_app/presentation/components/correction/correct_label.dart';
import 'package:student_app/presentation/components/correction/incorrect_label.dart';
import 'package:student_app/presentation/components/question-container/question_container.dart';
import 'package:student_app/presentation/theme/app_colors.dart';

class VerticalImageQuestion extends StatelessWidget {
  const VerticalImageQuestion(
      {super.key,
      required this.question,
      required this.imagePath,
      required this.labels,
      required this.setResponse,
      this.response,
      required this.review,
      required this.correctResponse,
      this.color,
      this.borderColor});

  final String question;
  final String imagePath;
  final List<String> labels;
  final Function setResponse;
  final int? response;
  final bool review;
  final int correctResponse;
  final Color? color;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      List<Widget> children = [];

      for (int i = 0; i < labels.length; i++) {
        children.add(VerticalAnswer(
          onTap: () => setResponse(i),
          index: i,
          label: labels[i],
          response: response,
          borderColor: borderColor,
        ));
      }
      return Column(
        children: [
          QuestionContainer(
            question: question,
            color: color,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                        color: borderColor ?? AppColors.primaryColor)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: SizedBox(
                    width: 80,
                    height: 80,
                    child: Image.asset(imagePath),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(children: children),
              ),
            ],
          ),
          if (review && correctResponse == response) const CorrectLabel(),
          if (review && correctResponse != response) const IncorrectLabel(),
          const SizedBox(
            height: 10,
          )
        ],
      );
    });
  }
}
