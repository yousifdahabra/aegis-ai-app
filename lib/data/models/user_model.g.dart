// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      name: json['name'] as String?,
      email: json['email'] as String,
      phone_number: json['phone_number'] as String?,
      links: json['links'] as String?,
      extraInformations: json['extraInformations'] as String?,
      password: json['password'] as String,
      age: (json['age'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone_number': instance.phone_number,
      'links': instance.links,
      'extraInformations': instance.extraInformations,
      'password': instance.password,
      'age': instance.age,
    };
