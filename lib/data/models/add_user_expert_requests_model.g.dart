// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_user_expert_requests_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddUserExpertRequestModel _$AddUserExpertRequestModelFromJson(
        Map<String, dynamic> json) =>
    AddUserExpertRequestModel(
      about_user: json['about_user'] as String,
      user_note: json['user_note'] as String,
      links: json['links'] as String?,
    );

Map<String, dynamic> _$AddUserExpertRequestModelToJson(
        AddUserExpertRequestModel instance) =>
    <String, dynamic>{
      'about_user': instance.about_user,
      'user_note': instance.user_note,
      'links': instance.links,
    };
