// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bpcr_sba_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SbaStaffModel {

 String get role;@JsonKey(name: 'role_label') String get roleLabel; String? get name;// null when the post is vacant
 String? get mobile;
/// Create a copy of SbaStaffModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SbaStaffModelCopyWith<SbaStaffModel> get copyWith => _$SbaStaffModelCopyWithImpl<SbaStaffModel>(this as SbaStaffModel, _$identity);

  /// Serializes this SbaStaffModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SbaStaffModel&&(identical(other.role, role) || other.role == role)&&(identical(other.roleLabel, roleLabel) || other.roleLabel == roleLabel)&&(identical(other.name, name) || other.name == name)&&(identical(other.mobile, mobile) || other.mobile == mobile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,role,roleLabel,name,mobile);

@override
String toString() {
  return 'SbaStaffModel(role: $role, roleLabel: $roleLabel, name: $name, mobile: $mobile)';
}


}

/// @nodoc
abstract mixin class $SbaStaffModelCopyWith<$Res>  {
  factory $SbaStaffModelCopyWith(SbaStaffModel value, $Res Function(SbaStaffModel) _then) = _$SbaStaffModelCopyWithImpl;
@useResult
$Res call({
 String role,@JsonKey(name: 'role_label') String roleLabel, String? name, String? mobile
});




}
/// @nodoc
class _$SbaStaffModelCopyWithImpl<$Res>
    implements $SbaStaffModelCopyWith<$Res> {
  _$SbaStaffModelCopyWithImpl(this._self, this._then);

  final SbaStaffModel _self;
  final $Res Function(SbaStaffModel) _then;

/// Create a copy of SbaStaffModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? role = null,Object? roleLabel = null,Object? name = freezed,Object? mobile = freezed,}) {
  return _then(_self.copyWith(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,roleLabel: null == roleLabel ? _self.roleLabel : roleLabel // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,mobile: freezed == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SbaStaffModel].
extension SbaStaffModelPatterns on SbaStaffModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SbaStaffModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SbaStaffModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SbaStaffModel value)  $default,){
final _that = this;
switch (_that) {
case _SbaStaffModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SbaStaffModel value)?  $default,){
final _that = this;
switch (_that) {
case _SbaStaffModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String role, @JsonKey(name: 'role_label')  String roleLabel,  String? name,  String? mobile)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SbaStaffModel() when $default != null:
return $default(_that.role,_that.roleLabel,_that.name,_that.mobile);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String role, @JsonKey(name: 'role_label')  String roleLabel,  String? name,  String? mobile)  $default,) {final _that = this;
switch (_that) {
case _SbaStaffModel():
return $default(_that.role,_that.roleLabel,_that.name,_that.mobile);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String role, @JsonKey(name: 'role_label')  String roleLabel,  String? name,  String? mobile)?  $default,) {final _that = this;
switch (_that) {
case _SbaStaffModel() when $default != null:
return $default(_that.role,_that.roleLabel,_that.name,_that.mobile);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SbaStaffModel implements SbaStaffModel {
  const _SbaStaffModel({required this.role, @JsonKey(name: 'role_label') required this.roleLabel, this.name, this.mobile});
  factory _SbaStaffModel.fromJson(Map<String, dynamic> json) => _$SbaStaffModelFromJson(json);

@override final  String role;
@override@JsonKey(name: 'role_label') final  String roleLabel;
@override final  String? name;
// null when the post is vacant
@override final  String? mobile;

/// Create a copy of SbaStaffModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SbaStaffModelCopyWith<_SbaStaffModel> get copyWith => __$SbaStaffModelCopyWithImpl<_SbaStaffModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SbaStaffModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SbaStaffModel&&(identical(other.role, role) || other.role == role)&&(identical(other.roleLabel, roleLabel) || other.roleLabel == roleLabel)&&(identical(other.name, name) || other.name == name)&&(identical(other.mobile, mobile) || other.mobile == mobile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,role,roleLabel,name,mobile);

@override
String toString() {
  return 'SbaStaffModel(role: $role, roleLabel: $roleLabel, name: $name, mobile: $mobile)';
}


}

/// @nodoc
abstract mixin class _$SbaStaffModelCopyWith<$Res> implements $SbaStaffModelCopyWith<$Res> {
  factory _$SbaStaffModelCopyWith(_SbaStaffModel value, $Res Function(_SbaStaffModel) _then) = __$SbaStaffModelCopyWithImpl;
@override @useResult
$Res call({
 String role,@JsonKey(name: 'role_label') String roleLabel, String? name, String? mobile
});




}
/// @nodoc
class __$SbaStaffModelCopyWithImpl<$Res>
    implements _$SbaStaffModelCopyWith<$Res> {
  __$SbaStaffModelCopyWithImpl(this._self, this._then);

  final _SbaStaffModel _self;
  final $Res Function(_SbaStaffModel) _then;

/// Create a copy of SbaStaffModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? role = null,Object? roleLabel = null,Object? name = freezed,Object? mobile = freezed,}) {
  return _then(_SbaStaffModel(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,roleLabel: null == roleLabel ? _self.roleLabel : roleLabel // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,mobile: freezed == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SbaShcGroupModel {

@JsonKey(name: 'shc_id') String get shcId;@JsonKey(name: 'shc_name') String get shcName;@JsonKey(name: 'is_own_village_shc') bool get isOwnVillageShc; List<SbaStaffModel> get staff;
/// Create a copy of SbaShcGroupModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SbaShcGroupModelCopyWith<SbaShcGroupModel> get copyWith => _$SbaShcGroupModelCopyWithImpl<SbaShcGroupModel>(this as SbaShcGroupModel, _$identity);

  /// Serializes this SbaShcGroupModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SbaShcGroupModel&&(identical(other.shcId, shcId) || other.shcId == shcId)&&(identical(other.shcName, shcName) || other.shcName == shcName)&&(identical(other.isOwnVillageShc, isOwnVillageShc) || other.isOwnVillageShc == isOwnVillageShc)&&const DeepCollectionEquality().equals(other.staff, staff));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shcId,shcName,isOwnVillageShc,const DeepCollectionEquality().hash(staff));

@override
String toString() {
  return 'SbaShcGroupModel(shcId: $shcId, shcName: $shcName, isOwnVillageShc: $isOwnVillageShc, staff: $staff)';
}


}

/// @nodoc
abstract mixin class $SbaShcGroupModelCopyWith<$Res>  {
  factory $SbaShcGroupModelCopyWith(SbaShcGroupModel value, $Res Function(SbaShcGroupModel) _then) = _$SbaShcGroupModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'shc_id') String shcId,@JsonKey(name: 'shc_name') String shcName,@JsonKey(name: 'is_own_village_shc') bool isOwnVillageShc, List<SbaStaffModel> staff
});




}
/// @nodoc
class _$SbaShcGroupModelCopyWithImpl<$Res>
    implements $SbaShcGroupModelCopyWith<$Res> {
  _$SbaShcGroupModelCopyWithImpl(this._self, this._then);

  final SbaShcGroupModel _self;
  final $Res Function(SbaShcGroupModel) _then;

/// Create a copy of SbaShcGroupModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? shcId = null,Object? shcName = null,Object? isOwnVillageShc = null,Object? staff = null,}) {
  return _then(_self.copyWith(
shcId: null == shcId ? _self.shcId : shcId // ignore: cast_nullable_to_non_nullable
as String,shcName: null == shcName ? _self.shcName : shcName // ignore: cast_nullable_to_non_nullable
as String,isOwnVillageShc: null == isOwnVillageShc ? _self.isOwnVillageShc : isOwnVillageShc // ignore: cast_nullable_to_non_nullable
as bool,staff: null == staff ? _self.staff : staff // ignore: cast_nullable_to_non_nullable
as List<SbaStaffModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [SbaShcGroupModel].
extension SbaShcGroupModelPatterns on SbaShcGroupModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SbaShcGroupModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SbaShcGroupModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SbaShcGroupModel value)  $default,){
final _that = this;
switch (_that) {
case _SbaShcGroupModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SbaShcGroupModel value)?  $default,){
final _that = this;
switch (_that) {
case _SbaShcGroupModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'shc_id')  String shcId, @JsonKey(name: 'shc_name')  String shcName, @JsonKey(name: 'is_own_village_shc')  bool isOwnVillageShc,  List<SbaStaffModel> staff)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SbaShcGroupModel() when $default != null:
return $default(_that.shcId,_that.shcName,_that.isOwnVillageShc,_that.staff);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'shc_id')  String shcId, @JsonKey(name: 'shc_name')  String shcName, @JsonKey(name: 'is_own_village_shc')  bool isOwnVillageShc,  List<SbaStaffModel> staff)  $default,) {final _that = this;
switch (_that) {
case _SbaShcGroupModel():
return $default(_that.shcId,_that.shcName,_that.isOwnVillageShc,_that.staff);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'shc_id')  String shcId, @JsonKey(name: 'shc_name')  String shcName, @JsonKey(name: 'is_own_village_shc')  bool isOwnVillageShc,  List<SbaStaffModel> staff)?  $default,) {final _that = this;
switch (_that) {
case _SbaShcGroupModel() when $default != null:
return $default(_that.shcId,_that.shcName,_that.isOwnVillageShc,_that.staff);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SbaShcGroupModel implements SbaShcGroupModel {
  const _SbaShcGroupModel({@JsonKey(name: 'shc_id') required this.shcId, @JsonKey(name: 'shc_name') required this.shcName, @JsonKey(name: 'is_own_village_shc') this.isOwnVillageShc = false, final  List<SbaStaffModel> staff = const []}): _staff = staff;
  factory _SbaShcGroupModel.fromJson(Map<String, dynamic> json) => _$SbaShcGroupModelFromJson(json);

@override@JsonKey(name: 'shc_id') final  String shcId;
@override@JsonKey(name: 'shc_name') final  String shcName;
@override@JsonKey(name: 'is_own_village_shc') final  bool isOwnVillageShc;
 final  List<SbaStaffModel> _staff;
@override@JsonKey() List<SbaStaffModel> get staff {
  if (_staff is EqualUnmodifiableListView) return _staff;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_staff);
}


/// Create a copy of SbaShcGroupModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SbaShcGroupModelCopyWith<_SbaShcGroupModel> get copyWith => __$SbaShcGroupModelCopyWithImpl<_SbaShcGroupModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SbaShcGroupModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SbaShcGroupModel&&(identical(other.shcId, shcId) || other.shcId == shcId)&&(identical(other.shcName, shcName) || other.shcName == shcName)&&(identical(other.isOwnVillageShc, isOwnVillageShc) || other.isOwnVillageShc == isOwnVillageShc)&&const DeepCollectionEquality().equals(other._staff, _staff));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shcId,shcName,isOwnVillageShc,const DeepCollectionEquality().hash(_staff));

@override
String toString() {
  return 'SbaShcGroupModel(shcId: $shcId, shcName: $shcName, isOwnVillageShc: $isOwnVillageShc, staff: $staff)';
}


}

/// @nodoc
abstract mixin class _$SbaShcGroupModelCopyWith<$Res> implements $SbaShcGroupModelCopyWith<$Res> {
  factory _$SbaShcGroupModelCopyWith(_SbaShcGroupModel value, $Res Function(_SbaShcGroupModel) _then) = __$SbaShcGroupModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'shc_id') String shcId,@JsonKey(name: 'shc_name') String shcName,@JsonKey(name: 'is_own_village_shc') bool isOwnVillageShc, List<SbaStaffModel> staff
});




}
/// @nodoc
class __$SbaShcGroupModelCopyWithImpl<$Res>
    implements _$SbaShcGroupModelCopyWith<$Res> {
  __$SbaShcGroupModelCopyWithImpl(this._self, this._then);

  final _SbaShcGroupModel _self;
  final $Res Function(_SbaShcGroupModel) _then;

/// Create a copy of SbaShcGroupModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? shcId = null,Object? shcName = null,Object? isOwnVillageShc = null,Object? staff = null,}) {
  return _then(_SbaShcGroupModel(
shcId: null == shcId ? _self.shcId : shcId // ignore: cast_nullable_to_non_nullable
as String,shcName: null == shcName ? _self.shcName : shcName // ignore: cast_nullable_to_non_nullable
as String,isOwnVillageShc: null == isOwnVillageShc ? _self.isOwnVillageShc : isOwnVillageShc // ignore: cast_nullable_to_non_nullable
as bool,staff: null == staff ? _self._staff : staff // ignore: cast_nullable_to_non_nullable
as List<SbaStaffModel>,
  ));
}


}


/// @nodoc
mixin _$SbaFacilityModel {

 SbaFacilityRef get facility;@JsonKey(name: 'no_direct_sba_data') bool get noDirectSbaData;@JsonKey(name: 'staff_via_child_facilities') bool get staffViaChildFacilities; List<SbaShcGroupModel> get groups;
/// Create a copy of SbaFacilityModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SbaFacilityModelCopyWith<SbaFacilityModel> get copyWith => _$SbaFacilityModelCopyWithImpl<SbaFacilityModel>(this as SbaFacilityModel, _$identity);

  /// Serializes this SbaFacilityModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SbaFacilityModel&&(identical(other.facility, facility) || other.facility == facility)&&(identical(other.noDirectSbaData, noDirectSbaData) || other.noDirectSbaData == noDirectSbaData)&&(identical(other.staffViaChildFacilities, staffViaChildFacilities) || other.staffViaChildFacilities == staffViaChildFacilities)&&const DeepCollectionEquality().equals(other.groups, groups));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,facility,noDirectSbaData,staffViaChildFacilities,const DeepCollectionEquality().hash(groups));

@override
String toString() {
  return 'SbaFacilityModel(facility: $facility, noDirectSbaData: $noDirectSbaData, staffViaChildFacilities: $staffViaChildFacilities, groups: $groups)';
}


}

/// @nodoc
abstract mixin class $SbaFacilityModelCopyWith<$Res>  {
  factory $SbaFacilityModelCopyWith(SbaFacilityModel value, $Res Function(SbaFacilityModel) _then) = _$SbaFacilityModelCopyWithImpl;
@useResult
$Res call({
 SbaFacilityRef facility,@JsonKey(name: 'no_direct_sba_data') bool noDirectSbaData,@JsonKey(name: 'staff_via_child_facilities') bool staffViaChildFacilities, List<SbaShcGroupModel> groups
});


$SbaFacilityRefCopyWith<$Res> get facility;

}
/// @nodoc
class _$SbaFacilityModelCopyWithImpl<$Res>
    implements $SbaFacilityModelCopyWith<$Res> {
  _$SbaFacilityModelCopyWithImpl(this._self, this._then);

  final SbaFacilityModel _self;
  final $Res Function(SbaFacilityModel) _then;

/// Create a copy of SbaFacilityModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? facility = null,Object? noDirectSbaData = null,Object? staffViaChildFacilities = null,Object? groups = null,}) {
  return _then(_self.copyWith(
facility: null == facility ? _self.facility : facility // ignore: cast_nullable_to_non_nullable
as SbaFacilityRef,noDirectSbaData: null == noDirectSbaData ? _self.noDirectSbaData : noDirectSbaData // ignore: cast_nullable_to_non_nullable
as bool,staffViaChildFacilities: null == staffViaChildFacilities ? _self.staffViaChildFacilities : staffViaChildFacilities // ignore: cast_nullable_to_non_nullable
as bool,groups: null == groups ? _self.groups : groups // ignore: cast_nullable_to_non_nullable
as List<SbaShcGroupModel>,
  ));
}
/// Create a copy of SbaFacilityModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SbaFacilityRefCopyWith<$Res> get facility {
  
  return $SbaFacilityRefCopyWith<$Res>(_self.facility, (value) {
    return _then(_self.copyWith(facility: value));
  });
}
}


/// Adds pattern-matching-related methods to [SbaFacilityModel].
extension SbaFacilityModelPatterns on SbaFacilityModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SbaFacilityModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SbaFacilityModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SbaFacilityModel value)  $default,){
final _that = this;
switch (_that) {
case _SbaFacilityModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SbaFacilityModel value)?  $default,){
final _that = this;
switch (_that) {
case _SbaFacilityModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SbaFacilityRef facility, @JsonKey(name: 'no_direct_sba_data')  bool noDirectSbaData, @JsonKey(name: 'staff_via_child_facilities')  bool staffViaChildFacilities,  List<SbaShcGroupModel> groups)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SbaFacilityModel() when $default != null:
return $default(_that.facility,_that.noDirectSbaData,_that.staffViaChildFacilities,_that.groups);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SbaFacilityRef facility, @JsonKey(name: 'no_direct_sba_data')  bool noDirectSbaData, @JsonKey(name: 'staff_via_child_facilities')  bool staffViaChildFacilities,  List<SbaShcGroupModel> groups)  $default,) {final _that = this;
switch (_that) {
case _SbaFacilityModel():
return $default(_that.facility,_that.noDirectSbaData,_that.staffViaChildFacilities,_that.groups);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SbaFacilityRef facility, @JsonKey(name: 'no_direct_sba_data')  bool noDirectSbaData, @JsonKey(name: 'staff_via_child_facilities')  bool staffViaChildFacilities,  List<SbaShcGroupModel> groups)?  $default,) {final _that = this;
switch (_that) {
case _SbaFacilityModel() when $default != null:
return $default(_that.facility,_that.noDirectSbaData,_that.staffViaChildFacilities,_that.groups);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SbaFacilityModel implements SbaFacilityModel {
  const _SbaFacilityModel({required this.facility, @JsonKey(name: 'no_direct_sba_data') this.noDirectSbaData = false, @JsonKey(name: 'staff_via_child_facilities') this.staffViaChildFacilities = false, final  List<SbaShcGroupModel> groups = const []}): _groups = groups;
  factory _SbaFacilityModel.fromJson(Map<String, dynamic> json) => _$SbaFacilityModelFromJson(json);

@override final  SbaFacilityRef facility;
@override@JsonKey(name: 'no_direct_sba_data') final  bool noDirectSbaData;
@override@JsonKey(name: 'staff_via_child_facilities') final  bool staffViaChildFacilities;
 final  List<SbaShcGroupModel> _groups;
@override@JsonKey() List<SbaShcGroupModel> get groups {
  if (_groups is EqualUnmodifiableListView) return _groups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_groups);
}


/// Create a copy of SbaFacilityModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SbaFacilityModelCopyWith<_SbaFacilityModel> get copyWith => __$SbaFacilityModelCopyWithImpl<_SbaFacilityModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SbaFacilityModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SbaFacilityModel&&(identical(other.facility, facility) || other.facility == facility)&&(identical(other.noDirectSbaData, noDirectSbaData) || other.noDirectSbaData == noDirectSbaData)&&(identical(other.staffViaChildFacilities, staffViaChildFacilities) || other.staffViaChildFacilities == staffViaChildFacilities)&&const DeepCollectionEquality().equals(other._groups, _groups));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,facility,noDirectSbaData,staffViaChildFacilities,const DeepCollectionEquality().hash(_groups));

@override
String toString() {
  return 'SbaFacilityModel(facility: $facility, noDirectSbaData: $noDirectSbaData, staffViaChildFacilities: $staffViaChildFacilities, groups: $groups)';
}


}

/// @nodoc
abstract mixin class _$SbaFacilityModelCopyWith<$Res> implements $SbaFacilityModelCopyWith<$Res> {
  factory _$SbaFacilityModelCopyWith(_SbaFacilityModel value, $Res Function(_SbaFacilityModel) _then) = __$SbaFacilityModelCopyWithImpl;
@override @useResult
$Res call({
 SbaFacilityRef facility,@JsonKey(name: 'no_direct_sba_data') bool noDirectSbaData,@JsonKey(name: 'staff_via_child_facilities') bool staffViaChildFacilities, List<SbaShcGroupModel> groups
});


@override $SbaFacilityRefCopyWith<$Res> get facility;

}
/// @nodoc
class __$SbaFacilityModelCopyWithImpl<$Res>
    implements _$SbaFacilityModelCopyWith<$Res> {
  __$SbaFacilityModelCopyWithImpl(this._self, this._then);

  final _SbaFacilityModel _self;
  final $Res Function(_SbaFacilityModel) _then;

/// Create a copy of SbaFacilityModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? facility = null,Object? noDirectSbaData = null,Object? staffViaChildFacilities = null,Object? groups = null,}) {
  return _then(_SbaFacilityModel(
facility: null == facility ? _self.facility : facility // ignore: cast_nullable_to_non_nullable
as SbaFacilityRef,noDirectSbaData: null == noDirectSbaData ? _self.noDirectSbaData : noDirectSbaData // ignore: cast_nullable_to_non_nullable
as bool,staffViaChildFacilities: null == staffViaChildFacilities ? _self.staffViaChildFacilities : staffViaChildFacilities // ignore: cast_nullable_to_non_nullable
as bool,groups: null == groups ? _self._groups : groups // ignore: cast_nullable_to_non_nullable
as List<SbaShcGroupModel>,
  ));
}

/// Create a copy of SbaFacilityModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SbaFacilityRefCopyWith<$Res> get facility {
  
  return $SbaFacilityRefCopyWith<$Res>(_self.facility, (value) {
    return _then(_self.copyWith(facility: value));
  });
}
}


/// @nodoc
mixin _$SbaFacilityRef {

 String get id; String get name;@JsonKey(name: 'facility_type') String get facilityType;
/// Create a copy of SbaFacilityRef
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SbaFacilityRefCopyWith<SbaFacilityRef> get copyWith => _$SbaFacilityRefCopyWithImpl<SbaFacilityRef>(this as SbaFacilityRef, _$identity);

  /// Serializes this SbaFacilityRef to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SbaFacilityRef&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.facilityType, facilityType) || other.facilityType == facilityType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,facilityType);

@override
String toString() {
  return 'SbaFacilityRef(id: $id, name: $name, facilityType: $facilityType)';
}


}

/// @nodoc
abstract mixin class $SbaFacilityRefCopyWith<$Res>  {
  factory $SbaFacilityRefCopyWith(SbaFacilityRef value, $Res Function(SbaFacilityRef) _then) = _$SbaFacilityRefCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(name: 'facility_type') String facilityType
});




}
/// @nodoc
class _$SbaFacilityRefCopyWithImpl<$Res>
    implements $SbaFacilityRefCopyWith<$Res> {
  _$SbaFacilityRefCopyWithImpl(this._self, this._then);

  final SbaFacilityRef _self;
  final $Res Function(SbaFacilityRef) _then;

/// Create a copy of SbaFacilityRef
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? facilityType = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,facilityType: null == facilityType ? _self.facilityType : facilityType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SbaFacilityRef].
extension SbaFacilityRefPatterns on SbaFacilityRef {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SbaFacilityRef value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SbaFacilityRef() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SbaFacilityRef value)  $default,){
final _that = this;
switch (_that) {
case _SbaFacilityRef():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SbaFacilityRef value)?  $default,){
final _that = this;
switch (_that) {
case _SbaFacilityRef() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'facility_type')  String facilityType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SbaFacilityRef() when $default != null:
return $default(_that.id,_that.name,_that.facilityType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'facility_type')  String facilityType)  $default,) {final _that = this;
switch (_that) {
case _SbaFacilityRef():
return $default(_that.id,_that.name,_that.facilityType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(name: 'facility_type')  String facilityType)?  $default,) {final _that = this;
switch (_that) {
case _SbaFacilityRef() when $default != null:
return $default(_that.id,_that.name,_that.facilityType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SbaFacilityRef implements SbaFacilityRef {
  const _SbaFacilityRef({required this.id, required this.name, @JsonKey(name: 'facility_type') required this.facilityType});
  factory _SbaFacilityRef.fromJson(Map<String, dynamic> json) => _$SbaFacilityRefFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey(name: 'facility_type') final  String facilityType;

/// Create a copy of SbaFacilityRef
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SbaFacilityRefCopyWith<_SbaFacilityRef> get copyWith => __$SbaFacilityRefCopyWithImpl<_SbaFacilityRef>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SbaFacilityRefToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SbaFacilityRef&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.facilityType, facilityType) || other.facilityType == facilityType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,facilityType);

@override
String toString() {
  return 'SbaFacilityRef(id: $id, name: $name, facilityType: $facilityType)';
}


}

/// @nodoc
abstract mixin class _$SbaFacilityRefCopyWith<$Res> implements $SbaFacilityRefCopyWith<$Res> {
  factory _$SbaFacilityRefCopyWith(_SbaFacilityRef value, $Res Function(_SbaFacilityRef) _then) = __$SbaFacilityRefCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(name: 'facility_type') String facilityType
});




}
/// @nodoc
class __$SbaFacilityRefCopyWithImpl<$Res>
    implements _$SbaFacilityRefCopyWith<$Res> {
  __$SbaFacilityRefCopyWithImpl(this._self, this._then);

  final _SbaFacilityRef _self;
  final $Res Function(_SbaFacilityRef) _then;

/// Create a copy of SbaFacilityRef
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? facilityType = null,}) {
  return _then(_SbaFacilityRef(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,facilityType: null == facilityType ? _self.facilityType : facilityType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AshaContactModel {

 String get name; String get mobile;
/// Create a copy of AshaContactModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AshaContactModelCopyWith<AshaContactModel> get copyWith => _$AshaContactModelCopyWithImpl<AshaContactModel>(this as AshaContactModel, _$identity);

  /// Serializes this AshaContactModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AshaContactModel&&(identical(other.name, name) || other.name == name)&&(identical(other.mobile, mobile) || other.mobile == mobile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,mobile);

@override
String toString() {
  return 'AshaContactModel(name: $name, mobile: $mobile)';
}


}

/// @nodoc
abstract mixin class $AshaContactModelCopyWith<$Res>  {
  factory $AshaContactModelCopyWith(AshaContactModel value, $Res Function(AshaContactModel) _then) = _$AshaContactModelCopyWithImpl;
@useResult
$Res call({
 String name, String mobile
});




}
/// @nodoc
class _$AshaContactModelCopyWithImpl<$Res>
    implements $AshaContactModelCopyWith<$Res> {
  _$AshaContactModelCopyWithImpl(this._self, this._then);

  final AshaContactModel _self;
  final $Res Function(AshaContactModel) _then;

/// Create a copy of AshaContactModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? mobile = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,mobile: null == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AshaContactModel].
extension AshaContactModelPatterns on AshaContactModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AshaContactModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AshaContactModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AshaContactModel value)  $default,){
final _that = this;
switch (_that) {
case _AshaContactModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AshaContactModel value)?  $default,){
final _that = this;
switch (_that) {
case _AshaContactModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String mobile)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AshaContactModel() when $default != null:
return $default(_that.name,_that.mobile);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String mobile)  $default,) {final _that = this;
switch (_that) {
case _AshaContactModel():
return $default(_that.name,_that.mobile);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String mobile)?  $default,) {final _that = this;
switch (_that) {
case _AshaContactModel() when $default != null:
return $default(_that.name,_that.mobile);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AshaContactModel implements AshaContactModel {
  const _AshaContactModel({required this.name, required this.mobile});
  factory _AshaContactModel.fromJson(Map<String, dynamic> json) => _$AshaContactModelFromJson(json);

@override final  String name;
@override final  String mobile;

/// Create a copy of AshaContactModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AshaContactModelCopyWith<_AshaContactModel> get copyWith => __$AshaContactModelCopyWithImpl<_AshaContactModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AshaContactModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AshaContactModel&&(identical(other.name, name) || other.name == name)&&(identical(other.mobile, mobile) || other.mobile == mobile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,mobile);

@override
String toString() {
  return 'AshaContactModel(name: $name, mobile: $mobile)';
}


}

/// @nodoc
abstract mixin class _$AshaContactModelCopyWith<$Res> implements $AshaContactModelCopyWith<$Res> {
  factory _$AshaContactModelCopyWith(_AshaContactModel value, $Res Function(_AshaContactModel) _then) = __$AshaContactModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String mobile
});




}
/// @nodoc
class __$AshaContactModelCopyWithImpl<$Res>
    implements _$AshaContactModelCopyWith<$Res> {
  __$AshaContactModelCopyWithImpl(this._self, this._then);

  final _AshaContactModel _self;
  final $Res Function(_AshaContactModel) _then;

/// Create a copy of AshaContactModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? mobile = null,}) {
  return _then(_AshaContactModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,mobile: null == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
