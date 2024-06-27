import 'package:flutter/material.dart';
import 'package:student_app/presentation/components/answer-container/horizontal_answer.dart';
import 'package:student_app/presentation/components/correction/correct_label.dart';
import 'package:student_app/presentation/components/correction/incorrect_label.dart';
import 'package:student_app/presentation/components/question-container/question_container.dart';

class HorizontalNonImageQuestion extends StatelessWidget {
  const HorizontalNonImageQuestion(
      {super.key,
      required this.setResponse,
      required this.response,
      required this.question,
      required this.labels,
      required this.review,
      required this.correctResponse,
      this.color,
      this.borderColor});

  final Function setResponse;
  final int? response;
  final String question;
  final List<String> labels;
  final bool review;
  final int correctResponse;
  final Color? color;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    for (int i = 0; i < labels.length; i++) {
      children.add(HorizontalAnswer(
        onTap: () => setResponse(i),
        index: i,
        label: labels[i],
        response: response,
      ));
      if (i != i - 1) {
        children.add(
          const SizedBox(
            width: 10,
          ),
        );
      }
    }

    return Builder(builder: (context) {
      return Column(
        children: [
          QuestionContainer(
            color: color,
            question: question,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: children,
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
