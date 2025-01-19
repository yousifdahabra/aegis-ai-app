// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_test_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StartTestModel _$StartTestModelFromJson(Map<String, dynamic> json) =>
    StartTestModel(
      title: json['title'] as String,
      user_id: (json['user_id'] as num).toInt(),
      expert_id: (json['expert_id'] as num?)?.toInt() ?? 3,
      test_state_id: (json['test_state_id'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$StartTestModelToJson(StartTestModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'user_id': instance.user_id,
      'expert_id': instance.expert_id,
      'test_state_id': instance.test_state_id,
    };
