import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String? name;
  final String email;
  final String password;
  final String? birth_year;

  UserModel({
    this.name,
    required this.email,
    required this.password,
    this.birth_year,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
