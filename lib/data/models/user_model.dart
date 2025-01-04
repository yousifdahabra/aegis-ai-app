import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String name;
  final String email;
  final String phone_number;
  final String links;
  final String extraInformations;
  final String password;
  final int? age;

  UserModel({
    required this.name,
    required this.email,
    required this.phone_number,
    required this.links,
    required this.extraInformations,
    required this.password,
    this.age,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
