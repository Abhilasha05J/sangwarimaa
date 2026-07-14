// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'women_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WomenProfileModel {

 WomenProfileUserModel get user; WomenProfileDataModel get profile; Map<String, dynamic>? get pregnancy;
/// Create a copy of WomenProfileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WomenProfileModelCopyWith<WomenProfileModel> get copyWith => _$WomenProfileModelCopyWithImpl<WomenProfileModel>(this as WomenProfileModel, _$identity);

  /// Serializes this WomenProfileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WomenProfileModel&&(identical(other.user, user) || other.user == user)&&(identical(other.profile, profile) || other.profile == profile)&&const DeepCollectionEquality().equals(other.pregnancy, pregnancy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,profile,const DeepCollectionEquality().hash(pregnancy));

@override
String toString() {
  return 'WomenProfileModel(user: $user, profile: $profile, pregnancy: $pregnancy)';
}


}

/// @nodoc
abstract mixin class $WomenProfileModelCopyWith<$Res>  {
  factory $WomenProfileModelCopyWith(WomenProfileModel value, $Res Function(WomenProfileModel) _then) = _$WomenProfileModelCopyWithImpl;
@useResult
$Res call({
 WomenProfileUserModel user, WomenProfileDataModel profile, Map<String, dynamic>? pregnancy
});


$WomenProfileUserModelCopyWith<$Res> get user;$WomenProfileDataModelCopyWith<$Res> get profile;

}
/// @nodoc
class _$WomenProfileModelCopyWithImpl<$Res>
    implements $WomenProfileModelCopyWith<$Res> {
  _$WomenProfileModelCopyWithImpl(this._self, this._then);

  final WomenProfileModel _self;
  final $Res Function(WomenProfileModel) _then;

/// Create a copy of WomenProfileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,Object? profile = null,Object? pregnancy = freezed,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as WomenProfileUserModel,profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as WomenProfileDataModel,pregnancy: freezed == pregnancy ? _self.pregnancy : pregnancy // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}
/// Create a copy of WomenProfileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WomenProfileUserModelCopyWith<$Res> get user {
  
  return $WomenProfileUserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of WomenProfileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WomenProfileDataModelCopyWith<$Res> get profile {
  
  return $WomenProfileDataModelCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}


/// Adds pattern-matching-related methods to [WomenProfileModel].
extension WomenProfileModelPatterns on WomenProfileModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WomenProfileModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WomenProfileModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WomenProfileModel value)  $default,){
final _that = this;
switch (_that) {
case _WomenProfileModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WomenProfileModel value)?  $default,){
final _that = this;
switch (_that) {
case _WomenProfileModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( WomenProfileUserModel user,  WomenProfileDataModel profile,  Map<String, dynamic>? pregnancy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WomenProfileModel() when $default != null:
return $default(_that.user,_that.profile,_that.pregnancy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( WomenProfileUserModel user,  WomenProfileDataModel profile,  Map<String, dynamic>? pregnancy)  $default,) {final _that = this;
switch (_that) {
case _WomenProfileModel():
return $default(_that.user,_that.profile,_that.pregnancy);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( WomenProfileUserModel user,  WomenProfileDataModel profile,  Map<String, dynamic>? pregnancy)?  $default,) {final _that = this;
switch (_that) {
case _WomenProfileModel() when $default != null:
return $default(_that.user,_that.profile,_that.pregnancy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WomenProfileModel implements WomenProfileModel {
  const _WomenProfileModel({required this.user, required this.profile, final  Map<String, dynamic>? pregnancy}): _pregnancy = pregnancy;
  factory _WomenProfileModel.fromJson(Map<String, dynamic> json) => _$WomenProfileModelFromJson(json);

@override final  WomenProfileUserModel user;
@override final  WomenProfileDataModel profile;
 final  Map<String, dynamic>? _pregnancy;
@override Map<String, dynamic>? get pregnancy {
  final value = _pregnancy;
  if (value == null) return null;
  if (_pregnancy is EqualUnmodifiableMapView) return _pregnancy;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of WomenProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WomenProfileModelCopyWith<_WomenProfileModel> get copyWith => __$WomenProfileModelCopyWithImpl<_WomenProfileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WomenProfileModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WomenProfileModel&&(identical(other.user, user) || other.user == user)&&(identical(other.profile, profile) || other.profile == profile)&&const DeepCollectionEquality().equals(other._pregnancy, _pregnancy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,profile,const DeepCollectionEquality().hash(_pregnancy));

@override
String toString() {
  return 'WomenProfileModel(user: $user, profile: $profile, pregnancy: $pregnancy)';
}


}

/// @nodoc
abstract mixin class _$WomenProfileModelCopyWith<$Res> implements $WomenProfileModelCopyWith<$Res> {
  factory _$WomenProfileModelCopyWith(_WomenProfileModel value, $Res Function(_WomenProfileModel) _then) = __$WomenProfileModelCopyWithImpl;
@override @useResult
$Res call({
 WomenProfileUserModel user, WomenProfileDataModel profile, Map<String, dynamic>? pregnancy
});


@override $WomenProfileUserModelCopyWith<$Res> get user;@override $WomenProfileDataModelCopyWith<$Res> get profile;

}
/// @nodoc
class __$WomenProfileModelCopyWithImpl<$Res>
    implements _$WomenProfileModelCopyWith<$Res> {
  __$WomenProfileModelCopyWithImpl(this._self, this._then);

  final _WomenProfileModel _self;
  final $Res Function(_WomenProfileModel) _then;

/// Create a copy of WomenProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,Object? profile = null,Object? pregnancy = freezed,}) {
  return _then(_WomenProfileModel(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as WomenProfileUserModel,profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as WomenProfileDataModel,pregnancy: freezed == pregnancy ? _self._pregnancy : pregnancy // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

/// Create a copy of WomenProfileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WomenProfileUserModelCopyWith<$Res> get user {
  
  return $WomenProfileUserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of WomenProfileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WomenProfileDataModelCopyWith<$Res> get profile {
  
  return $WomenProfileDataModelCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}


/// @nodoc
mixin _$WomenProfileUserModel {

 String get id; String get mobile; String? get name;@JsonKey(name: 'preferred_language') String get preferredLanguage;
/// Create a copy of WomenProfileUserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WomenProfileUserModelCopyWith<WomenProfileUserModel> get copyWith => _$WomenProfileUserModelCopyWithImpl<WomenProfileUserModel>(this as WomenProfileUserModel, _$identity);

  /// Serializes this WomenProfileUserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WomenProfileUserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.name, name) || other.name == name)&&(identical(other.preferredLanguage, preferredLanguage) || other.preferredLanguage == preferredLanguage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,mobile,name,preferredLanguage);

@override
String toString() {
  return 'WomenProfileUserModel(id: $id, mobile: $mobile, name: $name, preferredLanguage: $preferredLanguage)';
}


}

/// @nodoc
abstract mixin class $WomenProfileUserModelCopyWith<$Res>  {
  factory $WomenProfileUserModelCopyWith(WomenProfileUserModel value, $Res Function(WomenProfileUserModel) _then) = _$WomenProfileUserModelCopyWithImpl;
@useResult
$Res call({
 String id, String mobile, String? name,@JsonKey(name: 'preferred_language') String preferredLanguage
});




}
/// @nodoc
class _$WomenProfileUserModelCopyWithImpl<$Res>
    implements $WomenProfileUserModelCopyWith<$Res> {
  _$WomenProfileUserModelCopyWithImpl(this._self, this._then);

  final WomenProfileUserModel _self;
  final $Res Function(WomenProfileUserModel) _then;

/// Create a copy of WomenProfileUserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? mobile = null,Object? name = freezed,Object? preferredLanguage = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,mobile: null == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,preferredLanguage: null == preferredLanguage ? _self.preferredLanguage : preferredLanguage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WomenProfileUserModel].
extension WomenProfileUserModelPatterns on WomenProfileUserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WomenProfileUserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WomenProfileUserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WomenProfileUserModel value)  $default,){
final _that = this;
switch (_that) {
case _WomenProfileUserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WomenProfileUserModel value)?  $default,){
final _that = this;
switch (_that) {
case _WomenProfileUserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String mobile,  String? name, @JsonKey(name: 'preferred_language')  String preferredLanguage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WomenProfileUserModel() when $default != null:
return $default(_that.id,_that.mobile,_that.name,_that.preferredLanguage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String mobile,  String? name, @JsonKey(name: 'preferred_language')  String preferredLanguage)  $default,) {final _that = this;
switch (_that) {
case _WomenProfileUserModel():
return $default(_that.id,_that.mobile,_that.name,_that.preferredLanguage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String mobile,  String? name, @JsonKey(name: 'preferred_language')  String preferredLanguage)?  $default,) {final _that = this;
switch (_that) {
case _WomenProfileUserModel() when $default != null:
return $default(_that.id,_that.mobile,_that.name,_that.preferredLanguage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WomenProfileUserModel implements WomenProfileUserModel {
  const _WomenProfileUserModel({required this.id, required this.mobile, this.name, @JsonKey(name: 'preferred_language') this.preferredLanguage = 'hi'});
  factory _WomenProfileUserModel.fromJson(Map<String, dynamic> json) => _$WomenProfileUserModelFromJson(json);

@override final  String id;
@override final  String mobile;
@override final  String? name;
@override@JsonKey(name: 'preferred_language') final  String preferredLanguage;

/// Create a copy of WomenProfileUserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WomenProfileUserModelCopyWith<_WomenProfileUserModel> get copyWith => __$WomenProfileUserModelCopyWithImpl<_WomenProfileUserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WomenProfileUserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WomenProfileUserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.name, name) || other.name == name)&&(identical(other.preferredLanguage, preferredLanguage) || other.preferredLanguage == preferredLanguage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,mobile,name,preferredLanguage);

@override
String toString() {
  return 'WomenProfileUserModel(id: $id, mobile: $mobile, name: $name, preferredLanguage: $preferredLanguage)';
}


}

/// @nodoc
abstract mixin class _$WomenProfileUserModelCopyWith<$Res> implements $WomenProfileUserModelCopyWith<$Res> {
  factory _$WomenProfileUserModelCopyWith(_WomenProfileUserModel value, $Res Function(_WomenProfileUserModel) _then) = __$WomenProfileUserModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String mobile, String? name,@JsonKey(name: 'preferred_language') String preferredLanguage
});




}
/// @nodoc
class __$WomenProfileUserModelCopyWithImpl<$Res>
    implements _$WomenProfileUserModelCopyWith<$Res> {
  __$WomenProfileUserModelCopyWithImpl(this._self, this._then);

  final _WomenProfileUserModel _self;
  final $Res Function(_WomenProfileUserModel) _then;

/// Create a copy of WomenProfileUserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? mobile = null,Object? name = freezed,Object? preferredLanguage = null,}) {
  return _then(_WomenProfileUserModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,mobile: null == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,preferredLanguage: null == preferredLanguage ? _self.preferredLanguage : preferredLanguage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$WomenProfileDataModel {

 String get id; String? get name; int? get age;@JsonKey(name: 'husband_name') String? get husbandName; String? get village; String? get block; String? get district; String? get lmp;// ISO date string or null
 String? get edd;@JsonKey(name: 'blood_group') String? get bloodGroup;@JsonKey(name: 'risk_level') String get riskLevel;@JsonKey(name: 'preferred_language') String get preferredLanguage;@JsonKey(name: 'asha_name') String? get ashaName;@JsonKey(name: 'anm_name') String? get anmName;@JsonKey(name: 'created_at') String? get createdAt;
/// Create a copy of WomenProfileDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WomenProfileDataModelCopyWith<WomenProfileDataModel> get copyWith => _$WomenProfileDataModelCopyWithImpl<WomenProfileDataModel>(this as WomenProfileDataModel, _$identity);

  /// Serializes this WomenProfileDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WomenProfileDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.age, age) || other.age == age)&&(identical(other.husbandName, husbandName) || other.husbandName == husbandName)&&(identical(other.village, village) || other.village == village)&&(identical(other.block, block) || other.block == block)&&(identical(other.district, district) || other.district == district)&&(identical(other.lmp, lmp) || other.lmp == lmp)&&(identical(other.edd, edd) || other.edd == edd)&&(identical(other.bloodGroup, bloodGroup) || other.bloodGroup == bloodGroup)&&(identical(other.riskLevel, riskLevel) || other.riskLevel == riskLevel)&&(identical(other.preferredLanguage, preferredLanguage) || other.preferredLanguage == preferredLanguage)&&(identical(other.ashaName, ashaName) || other.ashaName == ashaName)&&(identical(other.anmName, anmName) || other.anmName == anmName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,age,husbandName,village,block,district,lmp,edd,bloodGroup,riskLevel,preferredLanguage,ashaName,anmName,createdAt);

@override
String toString() {
  return 'WomenProfileDataModel(id: $id, name: $name, age: $age, husbandName: $husbandName, village: $village, block: $block, district: $district, lmp: $lmp, edd: $edd, bloodGroup: $bloodGroup, riskLevel: $riskLevel, preferredLanguage: $preferredLanguage, ashaName: $ashaName, anmName: $anmName, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $WomenProfileDataModelCopyWith<$Res>  {
  factory $WomenProfileDataModelCopyWith(WomenProfileDataModel value, $Res Function(WomenProfileDataModel) _then) = _$WomenProfileDataModelCopyWithImpl;
@useResult
$Res call({
 String id, String? name, int? age,@JsonKey(name: 'husband_name') String? husbandName, String? village, String? block, String? district, String? lmp, String? edd,@JsonKey(name: 'blood_group') String? bloodGroup,@JsonKey(name: 'risk_level') String riskLevel,@JsonKey(name: 'preferred_language') String preferredLanguage,@JsonKey(name: 'asha_name') String? ashaName,@JsonKey(name: 'anm_name') String? anmName,@JsonKey(name: 'created_at') String? createdAt
});




}
/// @nodoc
class _$WomenProfileDataModelCopyWithImpl<$Res>
    implements $WomenProfileDataModelCopyWith<$Res> {
  _$WomenProfileDataModelCopyWithImpl(this._self, this._then);

  final WomenProfileDataModel _self;
  final $Res Function(WomenProfileDataModel) _then;

/// Create a copy of WomenProfileDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,Object? age = freezed,Object? husbandName = freezed,Object? village = freezed,Object? block = freezed,Object? district = freezed,Object? lmp = freezed,Object? edd = freezed,Object? bloodGroup = freezed,Object? riskLevel = null,Object? preferredLanguage = null,Object? ashaName = freezed,Object? anmName = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int?,husbandName: freezed == husbandName ? _self.husbandName : husbandName // ignore: cast_nullable_to_non_nullable
as String?,village: freezed == village ? _self.village : village // ignore: cast_nullable_to_non_nullable
as String?,block: freezed == block ? _self.block : block // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,lmp: freezed == lmp ? _self.lmp : lmp // ignore: cast_nullable_to_non_nullable
as String?,edd: freezed == edd ? _self.edd : edd // ignore: cast_nullable_to_non_nullable
as String?,bloodGroup: freezed == bloodGroup ? _self.bloodGroup : bloodGroup // ignore: cast_nullable_to_non_nullable
as String?,riskLevel: null == riskLevel ? _self.riskLevel : riskLevel // ignore: cast_nullable_to_non_nullable
as String,preferredLanguage: null == preferredLanguage ? _self.preferredLanguage : preferredLanguage // ignore: cast_nullable_to_non_nullable
as String,ashaName: freezed == ashaName ? _self.ashaName : ashaName // ignore: cast_nullable_to_non_nullable
as String?,anmName: freezed == anmName ? _self.anmName : anmName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WomenProfileDataModel].
extension WomenProfileDataModelPatterns on WomenProfileDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WomenProfileDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WomenProfileDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WomenProfileDataModel value)  $default,){
final _that = this;
switch (_that) {
case _WomenProfileDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WomenProfileDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _WomenProfileDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? name,  int? age, @JsonKey(name: 'husband_name')  String? husbandName,  String? village,  String? block,  String? district,  String? lmp,  String? edd, @JsonKey(name: 'blood_group')  String? bloodGroup, @JsonKey(name: 'risk_level')  String riskLevel, @JsonKey(name: 'preferred_language')  String preferredLanguage, @JsonKey(name: 'asha_name')  String? ashaName, @JsonKey(name: 'anm_name')  String? anmName, @JsonKey(name: 'created_at')  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WomenProfileDataModel() when $default != null:
return $default(_that.id,_that.name,_that.age,_that.husbandName,_that.village,_that.block,_that.district,_that.lmp,_that.edd,_that.bloodGroup,_that.riskLevel,_that.preferredLanguage,_that.ashaName,_that.anmName,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? name,  int? age, @JsonKey(name: 'husband_name')  String? husbandName,  String? village,  String? block,  String? district,  String? lmp,  String? edd, @JsonKey(name: 'blood_group')  String? bloodGroup, @JsonKey(name: 'risk_level')  String riskLevel, @JsonKey(name: 'preferred_language')  String preferredLanguage, @JsonKey(name: 'asha_name')  String? ashaName, @JsonKey(name: 'anm_name')  String? anmName, @JsonKey(name: 'created_at')  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case _WomenProfileDataModel():
return $default(_that.id,_that.name,_that.age,_that.husbandName,_that.village,_that.block,_that.district,_that.lmp,_that.edd,_that.bloodGroup,_that.riskLevel,_that.preferredLanguage,_that.ashaName,_that.anmName,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? name,  int? age, @JsonKey(name: 'husband_name')  String? husbandName,  String? village,  String? block,  String? district,  String? lmp,  String? edd, @JsonKey(name: 'blood_group')  String? bloodGroup, @JsonKey(name: 'risk_level')  String riskLevel, @JsonKey(name: 'preferred_language')  String preferredLanguage, @JsonKey(name: 'asha_name')  String? ashaName, @JsonKey(name: 'anm_name')  String? anmName, @JsonKey(name: 'created_at')  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _WomenProfileDataModel() when $default != null:
return $default(_that.id,_that.name,_that.age,_that.husbandName,_that.village,_that.block,_that.district,_that.lmp,_that.edd,_that.bloodGroup,_that.riskLevel,_that.preferredLanguage,_that.ashaName,_that.anmName,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WomenProfileDataModel implements WomenProfileDataModel {
  const _WomenProfileDataModel({required this.id, this.name, this.age, @JsonKey(name: 'husband_name') this.husbandName, this.village, this.block, this.district, this.lmp, this.edd, @JsonKey(name: 'blood_group') this.bloodGroup, @JsonKey(name: 'risk_level') this.riskLevel = 'low', @JsonKey(name: 'preferred_language') this.preferredLanguage = 'hi', @JsonKey(name: 'asha_name') this.ashaName, @JsonKey(name: 'anm_name') this.anmName, @JsonKey(name: 'created_at') this.createdAt});
  factory _WomenProfileDataModel.fromJson(Map<String, dynamic> json) => _$WomenProfileDataModelFromJson(json);

@override final  String id;
@override final  String? name;
@override final  int? age;
@override@JsonKey(name: 'husband_name') final  String? husbandName;
@override final  String? village;
@override final  String? block;
@override final  String? district;
@override final  String? lmp;
// ISO date string or null
@override final  String? edd;
@override@JsonKey(name: 'blood_group') final  String? bloodGroup;
@override@JsonKey(name: 'risk_level') final  String riskLevel;
@override@JsonKey(name: 'preferred_language') final  String preferredLanguage;
@override@JsonKey(name: 'asha_name') final  String? ashaName;
@override@JsonKey(name: 'anm_name') final  String? anmName;
@override@JsonKey(name: 'created_at') final  String? createdAt;

/// Create a copy of WomenProfileDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WomenProfileDataModelCopyWith<_WomenProfileDataModel> get copyWith => __$WomenProfileDataModelCopyWithImpl<_WomenProfileDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WomenProfileDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WomenProfileDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.age, age) || other.age == age)&&(identical(other.husbandName, husbandName) || other.husbandName == husbandName)&&(identical(other.village, village) || other.village == village)&&(identical(other.block, block) || other.block == block)&&(identical(other.district, district) || other.district == district)&&(identical(other.lmp, lmp) || other.lmp == lmp)&&(identical(other.edd, edd) || other.edd == edd)&&(identical(other.bloodGroup, bloodGroup) || other.bloodGroup == bloodGroup)&&(identical(other.riskLevel, riskLevel) || other.riskLevel == riskLevel)&&(identical(other.preferredLanguage, preferredLanguage) || other.preferredLanguage == preferredLanguage)&&(identical(other.ashaName, ashaName) || other.ashaName == ashaName)&&(identical(other.anmName, anmName) || other.anmName == anmName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,age,husbandName,village,block,district,lmp,edd,bloodGroup,riskLevel,preferredLanguage,ashaName,anmName,createdAt);

@override
String toString() {
  return 'WomenProfileDataModel(id: $id, name: $name, age: $age, husbandName: $husbandName, village: $village, block: $block, district: $district, lmp: $lmp, edd: $edd, bloodGroup: $bloodGroup, riskLevel: $riskLevel, preferredLanguage: $preferredLanguage, ashaName: $ashaName, anmName: $anmName, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$WomenProfileDataModelCopyWith<$Res> implements $WomenProfileDataModelCopyWith<$Res> {
  factory _$WomenProfileDataModelCopyWith(_WomenProfileDataModel value, $Res Function(_WomenProfileDataModel) _then) = __$WomenProfileDataModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String? name, int? age,@JsonKey(name: 'husband_name') String? husbandName, String? village, String? block, String? district, String? lmp, String? edd,@JsonKey(name: 'blood_group') String? bloodGroup,@JsonKey(name: 'risk_level') String riskLevel,@JsonKey(name: 'preferred_language') String preferredLanguage,@JsonKey(name: 'asha_name') String? ashaName,@JsonKey(name: 'anm_name') String? anmName,@JsonKey(name: 'created_at') String? createdAt
});




}
/// @nodoc
class __$WomenProfileDataModelCopyWithImpl<$Res>
    implements _$WomenProfileDataModelCopyWith<$Res> {
  __$WomenProfileDataModelCopyWithImpl(this._self, this._then);

  final _WomenProfileDataModel _self;
  final $Res Function(_WomenProfileDataModel) _then;

/// Create a copy of WomenProfileDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,Object? age = freezed,Object? husbandName = freezed,Object? village = freezed,Object? block = freezed,Object? district = freezed,Object? lmp = freezed,Object? edd = freezed,Object? bloodGroup = freezed,Object? riskLevel = null,Object? preferredLanguage = null,Object? ashaName = freezed,Object? anmName = freezed,Object? createdAt = freezed,}) {
  return _then(_WomenProfileDataModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int?,husbandName: freezed == husbandName ? _self.husbandName : husbandName // ignore: cast_nullable_to_non_nullable
as String?,village: freezed == village ? _self.village : village // ignore: cast_nullable_to_non_nullable
as String?,block: freezed == block ? _self.block : block // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,lmp: freezed == lmp ? _self.lmp : lmp // ignore: cast_nullable_to_non_nullable
as String?,edd: freezed == edd ? _self.edd : edd // ignore: cast_nullable_to_non_nullable
as String?,bloodGroup: freezed == bloodGroup ? _self.bloodGroup : bloodGroup // ignore: cast_nullable_to_non_nullable
as String?,riskLevel: null == riskLevel ? _self.riskLevel : riskLevel // ignore: cast_nullable_to_non_nullable
as String,preferredLanguage: null == preferredLanguage ? _self.preferredLanguage : preferredLanguage // ignore: cast_nullable_to_non_nullable
as String,ashaName: freezed == ashaName ? _self.ashaName : ashaName // ignore: cast_nullable_to_non_nullable
as String?,anmName: freezed == anmName ? _self.anmName : anmName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
