// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'women_register_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WomenRegisterRequestModel {

 String get name; int get age;@JsonKey(name: 'husband_name') String? get husbandName;@JsonKey(name: 'husband_age') int? get husbandAge; String? get dob;// ISO yyyy-MM-dd
 String? get address; String? get village; String? get phc; String? get block; String? get district; String get lmp;// ISO yyyy-MM-dd
@JsonKey(name: 'blood_group') String? get bloodGroup;@JsonKey(name: 'preferred_language') String get preferredLanguage; bool get consent; String? get latitude; String? get longitude;
/// Create a copy of WomenRegisterRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WomenRegisterRequestModelCopyWith<WomenRegisterRequestModel> get copyWith => _$WomenRegisterRequestModelCopyWithImpl<WomenRegisterRequestModel>(this as WomenRegisterRequestModel, _$identity);

  /// Serializes this WomenRegisterRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WomenRegisterRequestModel&&(identical(other.name, name) || other.name == name)&&(identical(other.age, age) || other.age == age)&&(identical(other.husbandName, husbandName) || other.husbandName == husbandName)&&(identical(other.husbandAge, husbandAge) || other.husbandAge == husbandAge)&&(identical(other.dob, dob) || other.dob == dob)&&(identical(other.address, address) || other.address == address)&&(identical(other.village, village) || other.village == village)&&(identical(other.phc, phc) || other.phc == phc)&&(identical(other.block, block) || other.block == block)&&(identical(other.district, district) || other.district == district)&&(identical(other.lmp, lmp) || other.lmp == lmp)&&(identical(other.bloodGroup, bloodGroup) || other.bloodGroup == bloodGroup)&&(identical(other.preferredLanguage, preferredLanguage) || other.preferredLanguage == preferredLanguage)&&(identical(other.consent, consent) || other.consent == consent)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,age,husbandName,husbandAge,dob,address,village,phc,block,district,lmp,bloodGroup,preferredLanguage,consent,latitude,longitude);

@override
String toString() {
  return 'WomenRegisterRequestModel(name: $name, age: $age, husbandName: $husbandName, husbandAge: $husbandAge, dob: $dob, address: $address, village: $village, phc: $phc, block: $block, district: $district, lmp: $lmp, bloodGroup: $bloodGroup, preferredLanguage: $preferredLanguage, consent: $consent, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $WomenRegisterRequestModelCopyWith<$Res>  {
  factory $WomenRegisterRequestModelCopyWith(WomenRegisterRequestModel value, $Res Function(WomenRegisterRequestModel) _then) = _$WomenRegisterRequestModelCopyWithImpl;
@useResult
$Res call({
 String name, int age,@JsonKey(name: 'husband_name') String? husbandName,@JsonKey(name: 'husband_age') int? husbandAge, String? dob, String? address, String? village, String? phc, String? block, String? district, String lmp,@JsonKey(name: 'blood_group') String? bloodGroup,@JsonKey(name: 'preferred_language') String preferredLanguage, bool consent, String? latitude, String? longitude
});




}
/// @nodoc
class _$WomenRegisterRequestModelCopyWithImpl<$Res>
    implements $WomenRegisterRequestModelCopyWith<$Res> {
  _$WomenRegisterRequestModelCopyWithImpl(this._self, this._then);

  final WomenRegisterRequestModel _self;
  final $Res Function(WomenRegisterRequestModel) _then;

/// Create a copy of WomenRegisterRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? age = null,Object? husbandName = freezed,Object? husbandAge = freezed,Object? dob = freezed,Object? address = freezed,Object? village = freezed,Object? phc = freezed,Object? block = freezed,Object? district = freezed,Object? lmp = null,Object? bloodGroup = freezed,Object? preferredLanguage = null,Object? consent = null,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,husbandName: freezed == husbandName ? _self.husbandName : husbandName // ignore: cast_nullable_to_non_nullable
as String?,husbandAge: freezed == husbandAge ? _self.husbandAge : husbandAge // ignore: cast_nullable_to_non_nullable
as int?,dob: freezed == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,village: freezed == village ? _self.village : village // ignore: cast_nullable_to_non_nullable
as String?,phc: freezed == phc ? _self.phc : phc // ignore: cast_nullable_to_non_nullable
as String?,block: freezed == block ? _self.block : block // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,lmp: null == lmp ? _self.lmp : lmp // ignore: cast_nullable_to_non_nullable
as String,bloodGroup: freezed == bloodGroup ? _self.bloodGroup : bloodGroup // ignore: cast_nullable_to_non_nullable
as String?,preferredLanguage: null == preferredLanguage ? _self.preferredLanguage : preferredLanguage // ignore: cast_nullable_to_non_nullable
as String,consent: null == consent ? _self.consent : consent // ignore: cast_nullable_to_non_nullable
as bool,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WomenRegisterRequestModel].
extension WomenRegisterRequestModelPatterns on WomenRegisterRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WomenRegisterRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WomenRegisterRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WomenRegisterRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _WomenRegisterRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WomenRegisterRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _WomenRegisterRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int age, @JsonKey(name: 'husband_name')  String? husbandName, @JsonKey(name: 'husband_age')  int? husbandAge,  String? dob,  String? address,  String? village,  String? phc,  String? block,  String? district,  String lmp, @JsonKey(name: 'blood_group')  String? bloodGroup, @JsonKey(name: 'preferred_language')  String preferredLanguage,  bool consent,  String? latitude,  String? longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WomenRegisterRequestModel() when $default != null:
return $default(_that.name,_that.age,_that.husbandName,_that.husbandAge,_that.dob,_that.address,_that.village,_that.phc,_that.block,_that.district,_that.lmp,_that.bloodGroup,_that.preferredLanguage,_that.consent,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int age, @JsonKey(name: 'husband_name')  String? husbandName, @JsonKey(name: 'husband_age')  int? husbandAge,  String? dob,  String? address,  String? village,  String? phc,  String? block,  String? district,  String lmp, @JsonKey(name: 'blood_group')  String? bloodGroup, @JsonKey(name: 'preferred_language')  String preferredLanguage,  bool consent,  String? latitude,  String? longitude)  $default,) {final _that = this;
switch (_that) {
case _WomenRegisterRequestModel():
return $default(_that.name,_that.age,_that.husbandName,_that.husbandAge,_that.dob,_that.address,_that.village,_that.phc,_that.block,_that.district,_that.lmp,_that.bloodGroup,_that.preferredLanguage,_that.consent,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int age, @JsonKey(name: 'husband_name')  String? husbandName, @JsonKey(name: 'husband_age')  int? husbandAge,  String? dob,  String? address,  String? village,  String? phc,  String? block,  String? district,  String lmp, @JsonKey(name: 'blood_group')  String? bloodGroup, @JsonKey(name: 'preferred_language')  String preferredLanguage,  bool consent,  String? latitude,  String? longitude)?  $default,) {final _that = this;
switch (_that) {
case _WomenRegisterRequestModel() when $default != null:
return $default(_that.name,_that.age,_that.husbandName,_that.husbandAge,_that.dob,_that.address,_that.village,_that.phc,_that.block,_that.district,_that.lmp,_that.bloodGroup,_that.preferredLanguage,_that.consent,_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WomenRegisterRequestModel implements WomenRegisterRequestModel {
  const _WomenRegisterRequestModel({required this.name, required this.age, @JsonKey(name: 'husband_name') this.husbandName, @JsonKey(name: 'husband_age') this.husbandAge, this.dob, this.address, this.village, this.phc, this.block, this.district, required this.lmp, @JsonKey(name: 'blood_group') this.bloodGroup, @JsonKey(name: 'preferred_language') this.preferredLanguage = 'hi', required this.consent, this.latitude, this.longitude});
  factory _WomenRegisterRequestModel.fromJson(Map<String, dynamic> json) => _$WomenRegisterRequestModelFromJson(json);

@override final  String name;
@override final  int age;
@override@JsonKey(name: 'husband_name') final  String? husbandName;
@override@JsonKey(name: 'husband_age') final  int? husbandAge;
@override final  String? dob;
// ISO yyyy-MM-dd
@override final  String? address;
@override final  String? village;
@override final  String? phc;
@override final  String? block;
@override final  String? district;
@override final  String lmp;
// ISO yyyy-MM-dd
@override@JsonKey(name: 'blood_group') final  String? bloodGroup;
@override@JsonKey(name: 'preferred_language') final  String preferredLanguage;
@override final  bool consent;
@override final  String? latitude;
@override final  String? longitude;

/// Create a copy of WomenRegisterRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WomenRegisterRequestModelCopyWith<_WomenRegisterRequestModel> get copyWith => __$WomenRegisterRequestModelCopyWithImpl<_WomenRegisterRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WomenRegisterRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WomenRegisterRequestModel&&(identical(other.name, name) || other.name == name)&&(identical(other.age, age) || other.age == age)&&(identical(other.husbandName, husbandName) || other.husbandName == husbandName)&&(identical(other.husbandAge, husbandAge) || other.husbandAge == husbandAge)&&(identical(other.dob, dob) || other.dob == dob)&&(identical(other.address, address) || other.address == address)&&(identical(other.village, village) || other.village == village)&&(identical(other.phc, phc) || other.phc == phc)&&(identical(other.block, block) || other.block == block)&&(identical(other.district, district) || other.district == district)&&(identical(other.lmp, lmp) || other.lmp == lmp)&&(identical(other.bloodGroup, bloodGroup) || other.bloodGroup == bloodGroup)&&(identical(other.preferredLanguage, preferredLanguage) || other.preferredLanguage == preferredLanguage)&&(identical(other.consent, consent) || other.consent == consent)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,age,husbandName,husbandAge,dob,address,village,phc,block,district,lmp,bloodGroup,preferredLanguage,consent,latitude,longitude);

@override
String toString() {
  return 'WomenRegisterRequestModel(name: $name, age: $age, husbandName: $husbandName, husbandAge: $husbandAge, dob: $dob, address: $address, village: $village, phc: $phc, block: $block, district: $district, lmp: $lmp, bloodGroup: $bloodGroup, preferredLanguage: $preferredLanguage, consent: $consent, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$WomenRegisterRequestModelCopyWith<$Res> implements $WomenRegisterRequestModelCopyWith<$Res> {
  factory _$WomenRegisterRequestModelCopyWith(_WomenRegisterRequestModel value, $Res Function(_WomenRegisterRequestModel) _then) = __$WomenRegisterRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String name, int age,@JsonKey(name: 'husband_name') String? husbandName,@JsonKey(name: 'husband_age') int? husbandAge, String? dob, String? address, String? village, String? phc, String? block, String? district, String lmp,@JsonKey(name: 'blood_group') String? bloodGroup,@JsonKey(name: 'preferred_language') String preferredLanguage, bool consent, String? latitude, String? longitude
});




}
/// @nodoc
class __$WomenRegisterRequestModelCopyWithImpl<$Res>
    implements _$WomenRegisterRequestModelCopyWith<$Res> {
  __$WomenRegisterRequestModelCopyWithImpl(this._self, this._then);

  final _WomenRegisterRequestModel _self;
  final $Res Function(_WomenRegisterRequestModel) _then;

/// Create a copy of WomenRegisterRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? age = null,Object? husbandName = freezed,Object? husbandAge = freezed,Object? dob = freezed,Object? address = freezed,Object? village = freezed,Object? phc = freezed,Object? block = freezed,Object? district = freezed,Object? lmp = null,Object? bloodGroup = freezed,Object? preferredLanguage = null,Object? consent = null,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_WomenRegisterRequestModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,husbandName: freezed == husbandName ? _self.husbandName : husbandName // ignore: cast_nullable_to_non_nullable
as String?,husbandAge: freezed == husbandAge ? _self.husbandAge : husbandAge // ignore: cast_nullable_to_non_nullable
as int?,dob: freezed == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,village: freezed == village ? _self.village : village // ignore: cast_nullable_to_non_nullable
as String?,phc: freezed == phc ? _self.phc : phc // ignore: cast_nullable_to_non_nullable
as String?,block: freezed == block ? _self.block : block // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,lmp: null == lmp ? _self.lmp : lmp // ignore: cast_nullable_to_non_nullable
as String,bloodGroup: freezed == bloodGroup ? _self.bloodGroup : bloodGroup // ignore: cast_nullable_to_non_nullable
as String?,preferredLanguage: null == preferredLanguage ? _self.preferredLanguage : preferredLanguage // ignore: cast_nullable_to_non_nullable
as String,consent: null == consent ? _self.consent : consent // ignore: cast_nullable_to_non_nullable
as bool,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
