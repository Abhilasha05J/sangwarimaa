// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mitanin_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MitaninProfileModel {

 String get id; String? get name; String? get mobile;@JsonKey(name: 'worker_role') String? get workerRole;@JsonKey(name: 'unique_id') String? get uniqueId; String? get subcentre; String? get village; String? get block; String? get district;@JsonKey(name: 'preferred_language') String get preferredLanguage;@JsonKey(name: 'total_beneficiaries') int get totalBeneficiaries;@JsonKey(name: 'pending_alerts') int get pendingAlerts;
/// Create a copy of MitaninProfileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MitaninProfileModelCopyWith<MitaninProfileModel> get copyWith => _$MitaninProfileModelCopyWithImpl<MitaninProfileModel>(this as MitaninProfileModel, _$identity);

  /// Serializes this MitaninProfileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MitaninProfileModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.workerRole, workerRole) || other.workerRole == workerRole)&&(identical(other.uniqueId, uniqueId) || other.uniqueId == uniqueId)&&(identical(other.subcentre, subcentre) || other.subcentre == subcentre)&&(identical(other.village, village) || other.village == village)&&(identical(other.block, block) || other.block == block)&&(identical(other.district, district) || other.district == district)&&(identical(other.preferredLanguage, preferredLanguage) || other.preferredLanguage == preferredLanguage)&&(identical(other.totalBeneficiaries, totalBeneficiaries) || other.totalBeneficiaries == totalBeneficiaries)&&(identical(other.pendingAlerts, pendingAlerts) || other.pendingAlerts == pendingAlerts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,mobile,workerRole,uniqueId,subcentre,village,block,district,preferredLanguage,totalBeneficiaries,pendingAlerts);

@override
String toString() {
  return 'MitaninProfileModel(id: $id, name: $name, mobile: $mobile, workerRole: $workerRole, uniqueId: $uniqueId, subcentre: $subcentre, village: $village, block: $block, district: $district, preferredLanguage: $preferredLanguage, totalBeneficiaries: $totalBeneficiaries, pendingAlerts: $pendingAlerts)';
}


}

/// @nodoc
abstract mixin class $MitaninProfileModelCopyWith<$Res>  {
  factory $MitaninProfileModelCopyWith(MitaninProfileModel value, $Res Function(MitaninProfileModel) _then) = _$MitaninProfileModelCopyWithImpl;
@useResult
$Res call({
 String id, String? name, String? mobile,@JsonKey(name: 'worker_role') String? workerRole,@JsonKey(name: 'unique_id') String? uniqueId, String? subcentre, String? village, String? block, String? district,@JsonKey(name: 'preferred_language') String preferredLanguage,@JsonKey(name: 'total_beneficiaries') int totalBeneficiaries,@JsonKey(name: 'pending_alerts') int pendingAlerts
});




}
/// @nodoc
class _$MitaninProfileModelCopyWithImpl<$Res>
    implements $MitaninProfileModelCopyWith<$Res> {
  _$MitaninProfileModelCopyWithImpl(this._self, this._then);

  final MitaninProfileModel _self;
  final $Res Function(MitaninProfileModel) _then;

/// Create a copy of MitaninProfileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,Object? mobile = freezed,Object? workerRole = freezed,Object? uniqueId = freezed,Object? subcentre = freezed,Object? village = freezed,Object? block = freezed,Object? district = freezed,Object? preferredLanguage = null,Object? totalBeneficiaries = null,Object? pendingAlerts = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,mobile: freezed == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String?,workerRole: freezed == workerRole ? _self.workerRole : workerRole // ignore: cast_nullable_to_non_nullable
as String?,uniqueId: freezed == uniqueId ? _self.uniqueId : uniqueId // ignore: cast_nullable_to_non_nullable
as String?,subcentre: freezed == subcentre ? _self.subcentre : subcentre // ignore: cast_nullable_to_non_nullable
as String?,village: freezed == village ? _self.village : village // ignore: cast_nullable_to_non_nullable
as String?,block: freezed == block ? _self.block : block // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,preferredLanguage: null == preferredLanguage ? _self.preferredLanguage : preferredLanguage // ignore: cast_nullable_to_non_nullable
as String,totalBeneficiaries: null == totalBeneficiaries ? _self.totalBeneficiaries : totalBeneficiaries // ignore: cast_nullable_to_non_nullable
as int,pendingAlerts: null == pendingAlerts ? _self.pendingAlerts : pendingAlerts // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MitaninProfileModel].
extension MitaninProfileModelPatterns on MitaninProfileModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MitaninProfileModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MitaninProfileModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MitaninProfileModel value)  $default,){
final _that = this;
switch (_that) {
case _MitaninProfileModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MitaninProfileModel value)?  $default,){
final _that = this;
switch (_that) {
case _MitaninProfileModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? name,  String? mobile, @JsonKey(name: 'worker_role')  String? workerRole, @JsonKey(name: 'unique_id')  String? uniqueId,  String? subcentre,  String? village,  String? block,  String? district, @JsonKey(name: 'preferred_language')  String preferredLanguage, @JsonKey(name: 'total_beneficiaries')  int totalBeneficiaries, @JsonKey(name: 'pending_alerts')  int pendingAlerts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MitaninProfileModel() when $default != null:
return $default(_that.id,_that.name,_that.mobile,_that.workerRole,_that.uniqueId,_that.subcentre,_that.village,_that.block,_that.district,_that.preferredLanguage,_that.totalBeneficiaries,_that.pendingAlerts);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? name,  String? mobile, @JsonKey(name: 'worker_role')  String? workerRole, @JsonKey(name: 'unique_id')  String? uniqueId,  String? subcentre,  String? village,  String? block,  String? district, @JsonKey(name: 'preferred_language')  String preferredLanguage, @JsonKey(name: 'total_beneficiaries')  int totalBeneficiaries, @JsonKey(name: 'pending_alerts')  int pendingAlerts)  $default,) {final _that = this;
switch (_that) {
case _MitaninProfileModel():
return $default(_that.id,_that.name,_that.mobile,_that.workerRole,_that.uniqueId,_that.subcentre,_that.village,_that.block,_that.district,_that.preferredLanguage,_that.totalBeneficiaries,_that.pendingAlerts);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? name,  String? mobile, @JsonKey(name: 'worker_role')  String? workerRole, @JsonKey(name: 'unique_id')  String? uniqueId,  String? subcentre,  String? village,  String? block,  String? district, @JsonKey(name: 'preferred_language')  String preferredLanguage, @JsonKey(name: 'total_beneficiaries')  int totalBeneficiaries, @JsonKey(name: 'pending_alerts')  int pendingAlerts)?  $default,) {final _that = this;
switch (_that) {
case _MitaninProfileModel() when $default != null:
return $default(_that.id,_that.name,_that.mobile,_that.workerRole,_that.uniqueId,_that.subcentre,_that.village,_that.block,_that.district,_that.preferredLanguage,_that.totalBeneficiaries,_that.pendingAlerts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MitaninProfileModel implements MitaninProfileModel {
  const _MitaninProfileModel({required this.id, this.name, this.mobile, @JsonKey(name: 'worker_role') this.workerRole, @JsonKey(name: 'unique_id') this.uniqueId, this.subcentre, this.village, this.block, this.district, @JsonKey(name: 'preferred_language') this.preferredLanguage = 'hi', @JsonKey(name: 'total_beneficiaries') this.totalBeneficiaries = 0, @JsonKey(name: 'pending_alerts') this.pendingAlerts = 0});
  factory _MitaninProfileModel.fromJson(Map<String, dynamic> json) => _$MitaninProfileModelFromJson(json);

@override final  String id;
@override final  String? name;
@override final  String? mobile;
@override@JsonKey(name: 'worker_role') final  String? workerRole;
@override@JsonKey(name: 'unique_id') final  String? uniqueId;
@override final  String? subcentre;
@override final  String? village;
@override final  String? block;
@override final  String? district;
@override@JsonKey(name: 'preferred_language') final  String preferredLanguage;
@override@JsonKey(name: 'total_beneficiaries') final  int totalBeneficiaries;
@override@JsonKey(name: 'pending_alerts') final  int pendingAlerts;

/// Create a copy of MitaninProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MitaninProfileModelCopyWith<_MitaninProfileModel> get copyWith => __$MitaninProfileModelCopyWithImpl<_MitaninProfileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MitaninProfileModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MitaninProfileModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.workerRole, workerRole) || other.workerRole == workerRole)&&(identical(other.uniqueId, uniqueId) || other.uniqueId == uniqueId)&&(identical(other.subcentre, subcentre) || other.subcentre == subcentre)&&(identical(other.village, village) || other.village == village)&&(identical(other.block, block) || other.block == block)&&(identical(other.district, district) || other.district == district)&&(identical(other.preferredLanguage, preferredLanguage) || other.preferredLanguage == preferredLanguage)&&(identical(other.totalBeneficiaries, totalBeneficiaries) || other.totalBeneficiaries == totalBeneficiaries)&&(identical(other.pendingAlerts, pendingAlerts) || other.pendingAlerts == pendingAlerts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,mobile,workerRole,uniqueId,subcentre,village,block,district,preferredLanguage,totalBeneficiaries,pendingAlerts);

@override
String toString() {
  return 'MitaninProfileModel(id: $id, name: $name, mobile: $mobile, workerRole: $workerRole, uniqueId: $uniqueId, subcentre: $subcentre, village: $village, block: $block, district: $district, preferredLanguage: $preferredLanguage, totalBeneficiaries: $totalBeneficiaries, pendingAlerts: $pendingAlerts)';
}


}

/// @nodoc
abstract mixin class _$MitaninProfileModelCopyWith<$Res> implements $MitaninProfileModelCopyWith<$Res> {
  factory _$MitaninProfileModelCopyWith(_MitaninProfileModel value, $Res Function(_MitaninProfileModel) _then) = __$MitaninProfileModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String? name, String? mobile,@JsonKey(name: 'worker_role') String? workerRole,@JsonKey(name: 'unique_id') String? uniqueId, String? subcentre, String? village, String? block, String? district,@JsonKey(name: 'preferred_language') String preferredLanguage,@JsonKey(name: 'total_beneficiaries') int totalBeneficiaries,@JsonKey(name: 'pending_alerts') int pendingAlerts
});




}
/// @nodoc
class __$MitaninProfileModelCopyWithImpl<$Res>
    implements _$MitaninProfileModelCopyWith<$Res> {
  __$MitaninProfileModelCopyWithImpl(this._self, this._then);

  final _MitaninProfileModel _self;
  final $Res Function(_MitaninProfileModel) _then;

/// Create a copy of MitaninProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,Object? mobile = freezed,Object? workerRole = freezed,Object? uniqueId = freezed,Object? subcentre = freezed,Object? village = freezed,Object? block = freezed,Object? district = freezed,Object? preferredLanguage = null,Object? totalBeneficiaries = null,Object? pendingAlerts = null,}) {
  return _then(_MitaninProfileModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,mobile: freezed == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String?,workerRole: freezed == workerRole ? _self.workerRole : workerRole // ignore: cast_nullable_to_non_nullable
as String?,uniqueId: freezed == uniqueId ? _self.uniqueId : uniqueId // ignore: cast_nullable_to_non_nullable
as String?,subcentre: freezed == subcentre ? _self.subcentre : subcentre // ignore: cast_nullable_to_non_nullable
as String?,village: freezed == village ? _self.village : village // ignore: cast_nullable_to_non_nullable
as String?,block: freezed == block ? _self.block : block // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,preferredLanguage: null == preferredLanguage ? _self.preferredLanguage : preferredLanguage // ignore: cast_nullable_to_non_nullable
as String,totalBeneficiaries: null == totalBeneficiaries ? _self.totalBeneficiaries : totalBeneficiaries // ignore: cast_nullable_to_non_nullable
as int,pendingAlerts: null == pendingAlerts ? _self.pendingAlerts : pendingAlerts // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
