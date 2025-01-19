// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_answer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitAnswerModel _$SubmitAnswerModelFromJson(Map<String, dynamic> json) =>
    SubmitAnswerModel(
      user_id: (json['user_id'] as num).toInt(),
      question_id: (json['question_id'] as num).toInt(),
      option_answer: json['option_answer'] as String,
    );

Map<String, dynamic> _$SubmitAnswerModelToJson(SubmitAnswerModel instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'question_id': instance.question_id,
      'option_answer': instance.option_answer,
    };
