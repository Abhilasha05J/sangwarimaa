// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bpcr_blood_donor_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BloodDonorModel {

 String get id;@JsonKey(name: 'donor_type') String get donorType;// 'family' | 'community'
 String get name;@JsonKey(name: 'blood_group') String get bloodGroup; String? get relation; String? get address; String get phone;
/// Create a copy of BloodDonorModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BloodDonorModelCopyWith<BloodDonorModel> get copyWith => _$BloodDonorModelCopyWithImpl<BloodDonorModel>(this as BloodDonorModel, _$identity);

  /// Serializes this BloodDonorModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BloodDonorModel&&(identical(other.id, id) || other.id == id)&&(identical(other.donorType, donorType) || other.donorType == donorType)&&(identical(other.name, name) || other.name == name)&&(identical(other.bloodGroup, bloodGroup) || other.bloodGroup == bloodGroup)&&(identical(other.relation, relation) || other.relation == relation)&&(identical(other.address, address) || other.address == address)&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,donorType,name,bloodGroup,relation,address,phone);

@override
String toString() {
  return 'BloodDonorModel(id: $id, donorType: $donorType, name: $name, bloodGroup: $bloodGroup, relation: $relation, address: $address, phone: $phone)';
}


}

/// @nodoc
abstract mixin class $BloodDonorModelCopyWith<$Res>  {
  factory $BloodDonorModelCopyWith(BloodDonorModel value, $Res Function(BloodDonorModel) _then) = _$BloodDonorModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'donor_type') String donorType, String name,@JsonKey(name: 'blood_group') String bloodGroup, String? relation, String? address, String phone
});




}
/// @nodoc
class _$BloodDonorModelCopyWithImpl<$Res>
    implements $BloodDonorModelCopyWith<$Res> {
  _$BloodDonorModelCopyWithImpl(this._self, this._then);

  final BloodDonorModel _self;
  final $Res Function(BloodDonorModel) _then;

/// Create a copy of BloodDonorModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? donorType = null,Object? name = null,Object? bloodGroup = null,Object? relation = freezed,Object? address = freezed,Object? phone = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,donorType: null == donorType ? _self.donorType : donorType // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,bloodGroup: null == bloodGroup ? _self.bloodGroup : bloodGroup // ignore: cast_nullable_to_non_nullable
as String,relation: freezed == relation ? _self.relation : relation // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BloodDonorModel].
extension BloodDonorModelPatterns on BloodDonorModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BloodDonorModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BloodDonorModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BloodDonorModel value)  $default,){
final _that = this;
switch (_that) {
case _BloodDonorModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BloodDonorModel value)?  $default,){
final _that = this;
switch (_that) {
case _BloodDonorModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'donor_type')  String donorType,  String name, @JsonKey(name: 'blood_group')  String bloodGroup,  String? relation,  String? address,  String phone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BloodDonorModel() when $default != null:
return $default(_that.id,_that.donorType,_that.name,_that.bloodGroup,_that.relation,_that.address,_that.phone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'donor_type')  String donorType,  String name, @JsonKey(name: 'blood_group')  String bloodGroup,  String? relation,  String? address,  String phone)  $default,) {final _that = this;
switch (_that) {
case _BloodDonorModel():
return $default(_that.id,_that.donorType,_that.name,_that.bloodGroup,_that.relation,_that.address,_that.phone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'donor_type')  String donorType,  String name, @JsonKey(name: 'blood_group')  String bloodGroup,  String? relation,  String? address,  String phone)?  $default,) {final _that = this;
switch (_that) {
case _BloodDonorModel() when $default != null:
return $default(_that.id,_that.donorType,_that.name,_that.bloodGroup,_that.relation,_that.address,_that.phone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BloodDonorModel implements BloodDonorModel {
  const _BloodDonorModel({required this.id, @JsonKey(name: 'donor_type') required this.donorType, required this.name, @JsonKey(name: 'blood_group') required this.bloodGroup, this.relation, this.address, required this.phone});
  factory _BloodDonorModel.fromJson(Map<String, dynamic> json) => _$BloodDonorModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'donor_type') final  String donorType;
// 'family' | 'community'
@override final  String name;
@override@JsonKey(name: 'blood_group') final  String bloodGroup;
@override final  String? relation;
@override final  String? address;
@override final  String phone;

/// Create a copy of BloodDonorModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BloodDonorModelCopyWith<_BloodDonorModel> get copyWith => __$BloodDonorModelCopyWithImpl<_BloodDonorModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BloodDonorModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BloodDonorModel&&(identical(other.id, id) || other.id == id)&&(identical(other.donorType, donorType) || other.donorType == donorType)&&(identical(other.name, name) || other.name == name)&&(identical(other.bloodGroup, bloodGroup) || other.bloodGroup == bloodGroup)&&(identical(other.relation, relation) || other.relation == relation)&&(identical(other.address, address) || other.address == address)&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,donorType,name,bloodGroup,relation,address,phone);

@override
String toString() {
  return 'BloodDonorModel(id: $id, donorType: $donorType, name: $name, bloodGroup: $bloodGroup, relation: $relation, address: $address, phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$BloodDonorModelCopyWith<$Res> implements $BloodDonorModelCopyWith<$Res> {
  factory _$BloodDonorModelCopyWith(_BloodDonorModel value, $Res Function(_BloodDonorModel) _then) = __$BloodDonorModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'donor_type') String donorType, String name,@JsonKey(name: 'blood_group') String bloodGroup, String? relation, String? address, String phone
});




}
/// @nodoc
class __$BloodDonorModelCopyWithImpl<$Res>
    implements _$BloodDonorModelCopyWith<$Res> {
  __$BloodDonorModelCopyWithImpl(this._self, this._then);

  final _BloodDonorModel _self;
  final $Res Function(_BloodDonorModel) _then;

/// Create a copy of BloodDonorModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? donorType = null,Object? name = null,Object? bloodGroup = null,Object? relation = freezed,Object? address = freezed,Object? phone = null,}) {
  return _then(_BloodDonorModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,donorType: null == donorType ? _self.donorType : donorType // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,bloodGroup: null == bloodGroup ? _self.bloodGroup : bloodGroup // ignore: cast_nullable_to_non_nullable
as String,relation: freezed == relation ? _self.relation : relation // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
