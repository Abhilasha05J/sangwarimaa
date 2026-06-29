import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

enum UserRole {
  @JsonValue('pregnant_woman') pregnantWoman,
  @JsonValue('asha') asha,
  @JsonValue('anm') anm,
  @JsonValue('block_admin') blockAdmin,
  @JsonValue('pi') pi,
  @JsonValue('super_admin') superAdmin,
}

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String mobile,
    required UserRole role,
    String? name,
    @JsonKey(name: 'preferred_language') @Default('hi') String preferredLanguage,
    @JsonKey(name: 'fcm_token') String? fcmToken,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'last_login_at') String? lastLoginAt,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}