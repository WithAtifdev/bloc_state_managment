 import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
//object create krne wala 
abstract class UserModel with _$UserModel {
  const factory UserModel({
    @Default('') String token,
    @Default('') String error,
  }) = _UserModel;

// JSON se object create karne wala
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}