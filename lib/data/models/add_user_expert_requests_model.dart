import 'package:json_annotation/json_annotation.dart';

part 'add_user_expert_requests_model.g.dart';

@JsonSerializable()
class AddUserExpertRequestModel {
  final String about_user;
  final String user_note;
  final String? links;

  AddUserExpertRequestModel({
    required this.about_user,
    required this.user_note,
    this.links,
  });

  factory AddUserExpertRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AddUserExpertRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddUserExpertRequestModelToJson(this);
}
