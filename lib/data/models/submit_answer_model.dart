import 'package:json_annotation/json_annotation.dart';

part 'submit_answer_model.g.dart';

@JsonSerializable()
class SubmitAnswerModel {
  final int user_id;
  final int question_id;
  final String option_answer;

  SubmitAnswerModel({
    required this.user_id,
    required this.question_id,
    required this.option_answer,
  });

  factory SubmitAnswerModel.fromJson(Map<String, dynamic> json) =>
      _$SubmitAnswerModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitAnswerModelToJson(this);
}
