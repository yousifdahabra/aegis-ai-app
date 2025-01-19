import 'package:json_annotation/json_annotation.dart';

part 'start_test_model.g.dart';

@JsonSerializable()
class StartTestModel {
  final String title;
  final int user_id;
  final int expert_id;
  final int test_state_id;

  StartTestModel({
    required this.title,
    required this.user_id,
    this.expert_id = 3,
    this.test_state_id = 1,
  });

  factory StartTestModel.fromJson(Map<String, dynamic> json) =>
      _$StartTestModelFromJson(json);

  Map<String, dynamic> toJson() => _$StartTestModelToJson(this);
}
