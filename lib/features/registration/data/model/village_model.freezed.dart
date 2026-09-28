// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'village_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VillageModel {

 String get id; String get name; String? get code; String get block;@JsonKey(name: 'shc_name') String? get shcName;@JsonKey(name: 'has_facility_data') bool get hasFacilityData;
/// Create a copy of VillageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VillageModelCopyWith<VillageModel> get copyWith => _$VillageModelCopyWithImpl<VillageModel>(this as VillageModel, _$identity);

  /// Serializes this VillageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VillageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.block, block) || other.block == block)&&(identical(other.shcName, shcName) || other.shcName == shcName)&&(identical(other.hasFacilityData, hasFacilityData) || other.hasFacilityData == hasFacilityData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,code,block,shcName,hasFacilityData);

@override
String toString() {
  return 'VillageModel(id: $id, name: $name, code: $code, block: $block, shcName: $shcName, hasFacilityData: $hasFacilityData)';
}


}

/// @nodoc
abstract mixin class $VillageModelCopyWith<$Res>  {
  factory $VillageModelCopyWith(VillageModel value, $Res Function(VillageModel) _then) = _$VillageModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? code, String block,@JsonKey(name: 'shc_name') String? shcName,@JsonKey(name: 'has_facility_data') bool hasFacilityData
});




}
/// @nodoc
class _$VillageModelCopyWithImpl<$Res>
    implements $VillageModelCopyWith<$Res> {
  _$VillageModelCopyWithImpl(this._self, this._then);

  final VillageModel _self;
  final $Res Function(VillageModel) _then;

/// Create a copy of VillageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? code = freezed,Object? block = null,Object? shcName = freezed,Object? hasFacilityData = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,block: null == block ? _self.block : block // ignore: cast_nullable_to_non_nullable
as String,shcName: freezed == shcName ? _self.shcName : shcName // ignore: cast_nullable_to_non_nullable
as String?,hasFacilityData: null == hasFacilityData ? _self.hasFacilityData : hasFacilityData // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [VillageModel].
extension VillageModelPatterns on VillageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VillageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VillageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VillageModel value)  $default,){
final _that = this;
switch (_that) {
case _VillageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VillageModel value)?  $default,){
final _that = this;
switch (_that) {
case _VillageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? code,  String block, @JsonKey(name: 'shc_name')  String? shcName, @JsonKey(name: 'has_facility_data')  bool hasFacilityData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VillageModel() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.block,_that.shcName,_that.hasFacilityData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? code,  String block, @JsonKey(name: 'shc_name')  String? shcName, @JsonKey(name: 'has_facility_data')  bool hasFacilityData)  $default,) {final _that = this;
switch (_that) {
case _VillageModel():
return $default(_that.id,_that.name,_that.code,_that.block,_that.shcName,_that.hasFacilityData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? code,  String block, @JsonKey(name: 'shc_name')  String? shcName, @JsonKey(name: 'has_facility_data')  bool hasFacilityData)?  $default,) {final _that = this;
switch (_that) {
case _VillageModel() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.block,_that.shcName,_that.hasFacilityData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VillageModel implements VillageModel {
  const _VillageModel({required this.id, required this.name, this.code, required this.block, @JsonKey(name: 'shc_name') this.shcName, @JsonKey(name: 'has_facility_data') this.hasFacilityData = false});
  factory _VillageModel.fromJson(Map<String, dynamic> json) => _$VillageModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? code;
@override final  String block;
@override@JsonKey(name: 'shc_name') final  String? shcName;
@override@JsonKey(name: 'has_facility_data') final  bool hasFacilityData;

/// Create a copy of VillageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VillageModelCopyWith<_VillageModel> get copyWith => __$VillageModelCopyWithImpl<_VillageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VillageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VillageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.block, block) || other.block == block)&&(identical(other.shcName, shcName) || other.shcName == shcName)&&(identical(other.hasFacilityData, hasFacilityData) || other.hasFacilityData == hasFacilityData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,code,block,shcName,hasFacilityData);

@override
String toString() {
  return 'VillageModel(id: $id, name: $name, code: $code, block: $block, shcName: $shcName, hasFacilityData: $hasFacilityData)';
}


}

/// @nodoc
abstract mixin class _$VillageModelCopyWith<$Res> implements $VillageModelCopyWith<$Res> {
  factory _$VillageModelCopyWith(_VillageModel value, $Res Function(_VillageModel) _then) = __$VillageModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? code, String block,@JsonKey(name: 'shc_name') String? shcName,@JsonKey(name: 'has_facility_data') bool hasFacilityData
});




}
/// @nodoc
class __$VillageModelCopyWithImpl<$Res>
    implements _$VillageModelCopyWith<$Res> {
  __$VillageModelCopyWithImpl(this._self, this._then);

  final _VillageModel _self;
  final $Res Function(_VillageModel) _then;

/// Create a copy of VillageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? code = freezed,Object? block = null,Object? shcName = freezed,Object? hasFacilityData = null,}) {
  return _then(_VillageModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,block: null == block ? _self.block : block // ignore: cast_nullable_to_non_nullable
as String,shcName: freezed == shcName ? _self.shcName : shcName // ignore: cast_nullable_to_non_nullable
as String?,hasFacilityData: null == hasFacilityData ? _self.hasFacilityData : hasFacilityData // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
