import 'package:json_annotation/json_annotation.dart';

part 'user-model.g.dart';

@JsonSerializable()
class UserModel {
  int id;
  String name;
  int age;

  UserModel({
    required this.id,
    required this.name,
    required this.age,
  });

  //from json
  factory UserModel.fromJson(Map<String, dynamic> map) =>
      _$UserModelFromJson(map);

  //to json
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
