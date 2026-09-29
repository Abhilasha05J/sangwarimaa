// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bpcr_facility_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BpcrFacilityModel {

 String get id; String get name;@JsonKey(name: 'facility_type') String get facilityType;// CHC|PHC|SHC|SDH
@JsonKey(name: 'sub_district') String? get subDistrict;@JsonKey(name: 'is_24x7') bool get is24x7;@JsonKey(name: 'is_fru') bool get isFru; String? get category;@JsonKey(name: 'is_selected') bool get isSelected;@JsonKey(name: 'in_catchment') bool get inCatchment;
/// Create a copy of BpcrFacilityModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BpcrFacilityModelCopyWith<BpcrFacilityModel> get copyWith => _$BpcrFacilityModelCopyWithImpl<BpcrFacilityModel>(this as BpcrFacilityModel, _$identity);

  /// Serializes this BpcrFacilityModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BpcrFacilityModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.facilityType, facilityType) || other.facilityType == facilityType)&&(identical(other.subDistrict, subDistrict) || other.subDistrict == subDistrict)&&(identical(other.is24x7, is24x7) || other.is24x7 == is24x7)&&(identical(other.isFru, isFru) || other.isFru == isFru)&&(identical(other.category, category) || other.category == category)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected)&&(identical(other.inCatchment, inCatchment) || other.inCatchment == inCatchment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,facilityType,subDistrict,is24x7,isFru,category,isSelected,inCatchment);

@override
String toString() {
  return 'BpcrFacilityModel(id: $id, name: $name, facilityType: $facilityType, subDistrict: $subDistrict, is24x7: $is24x7, isFru: $isFru, category: $category, isSelected: $isSelected, inCatchment: $inCatchment)';
}


}

/// @nodoc
abstract mixin class $BpcrFacilityModelCopyWith<$Res>  {
  factory $BpcrFacilityModelCopyWith(BpcrFacilityModel value, $Res Function(BpcrFacilityModel) _then) = _$BpcrFacilityModelCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(name: 'facility_type') String facilityType,@JsonKey(name: 'sub_district') String? subDistrict,@JsonKey(name: 'is_24x7') bool is24x7,@JsonKey(name: 'is_fru') bool isFru, String? category,@JsonKey(name: 'is_selected') bool isSelected,@JsonKey(name: 'in_catchment') bool inCatchment
});




}
/// @nodoc
class _$BpcrFacilityModelCopyWithImpl<$Res>
    implements $BpcrFacilityModelCopyWith<$Res> {
  _$BpcrFacilityModelCopyWithImpl(this._self, this._then);

  final BpcrFacilityModel _self;
  final $Res Function(BpcrFacilityModel) _then;

/// Create a copy of BpcrFacilityModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? facilityType = null,Object? subDistrict = freezed,Object? is24x7 = null,Object? isFru = null,Object? category = freezed,Object? isSelected = null,Object? inCatchment = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,facilityType: null == facilityType ? _self.facilityType : facilityType // ignore: cast_nullable_to_non_nullable
as String,subDistrict: freezed == subDistrict ? _self.subDistrict : subDistrict // ignore: cast_nullable_to_non_nullable
as String?,is24x7: null == is24x7 ? _self.is24x7 : is24x7 // ignore: cast_nullable_to_non_nullable
as bool,isFru: null == isFru ? _self.isFru : isFru // ignore: cast_nullable_to_non_nullable
as bool,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,inCatchment: null == inCatchment ? _self.inCatchment : inCatchment // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [BpcrFacilityModel].
extension BpcrFacilityModelPatterns on BpcrFacilityModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BpcrFacilityModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BpcrFacilityModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BpcrFacilityModel value)  $default,){
final _that = this;
switch (_that) {
case _BpcrFacilityModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BpcrFacilityModel value)?  $default,){
final _that = this;
switch (_that) {
case _BpcrFacilityModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'facility_type')  String facilityType, @JsonKey(name: 'sub_district')  String? subDistrict, @JsonKey(name: 'is_24x7')  bool is24x7, @JsonKey(name: 'is_fru')  bool isFru,  String? category, @JsonKey(name: 'is_selected')  bool isSelected, @JsonKey(name: 'in_catchment')  bool inCatchment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BpcrFacilityModel() when $default != null:
return $default(_that.id,_that.name,_that.facilityType,_that.subDistrict,_that.is24x7,_that.isFru,_that.category,_that.isSelected,_that.inCatchment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'facility_type')  String facilityType, @JsonKey(name: 'sub_district')  String? subDistrict, @JsonKey(name: 'is_24x7')  bool is24x7, @JsonKey(name: 'is_fru')  bool isFru,  String? category, @JsonKey(name: 'is_selected')  bool isSelected, @JsonKey(name: 'in_catchment')  bool inCatchment)  $default,) {final _that = this;
switch (_that) {
case _BpcrFacilityModel():
return $default(_that.id,_that.name,_that.facilityType,_that.subDistrict,_that.is24x7,_that.isFru,_that.category,_that.isSelected,_that.inCatchment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(name: 'facility_type')  String facilityType, @JsonKey(name: 'sub_district')  String? subDistrict, @JsonKey(name: 'is_24x7')  bool is24x7, @JsonKey(name: 'is_fru')  bool isFru,  String? category, @JsonKey(name: 'is_selected')  bool isSelected, @JsonKey(name: 'in_catchment')  bool inCatchment)?  $default,) {final _that = this;
switch (_that) {
case _BpcrFacilityModel() when $default != null:
return $default(_that.id,_that.name,_that.facilityType,_that.subDistrict,_that.is24x7,_that.isFru,_that.category,_that.isSelected,_that.inCatchment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BpcrFacilityModel implements BpcrFacilityModel {
  const _BpcrFacilityModel({required this.id, required this.name, @JsonKey(name: 'facility_type') required this.facilityType, @JsonKey(name: 'sub_district') this.subDistrict, @JsonKey(name: 'is_24x7') this.is24x7 = false, @JsonKey(name: 'is_fru') this.isFru = false, this.category, @JsonKey(name: 'is_selected') this.isSelected = false, @JsonKey(name: 'in_catchment') this.inCatchment = false});
  factory _BpcrFacilityModel.fromJson(Map<String, dynamic> json) => _$BpcrFacilityModelFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey(name: 'facility_type') final  String facilityType;
// CHC|PHC|SHC|SDH
@override@JsonKey(name: 'sub_district') final  String? subDistrict;
@override@JsonKey(name: 'is_24x7') final  bool is24x7;
@override@JsonKey(name: 'is_fru') final  bool isFru;
@override final  String? category;
@override@JsonKey(name: 'is_selected') final  bool isSelected;
@override@JsonKey(name: 'in_catchment') final  bool inCatchment;

/// Create a copy of BpcrFacilityModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BpcrFacilityModelCopyWith<_BpcrFacilityModel> get copyWith => __$BpcrFacilityModelCopyWithImpl<_BpcrFacilityModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BpcrFacilityModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BpcrFacilityModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.facilityType, facilityType) || other.facilityType == facilityType)&&(identical(other.subDistrict, subDistrict) || other.subDistrict == subDistrict)&&(identical(other.is24x7, is24x7) || other.is24x7 == is24x7)&&(identical(other.isFru, isFru) || other.isFru == isFru)&&(identical(other.category, category) || other.category == category)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected)&&(identical(other.inCatchment, inCatchment) || other.inCatchment == inCatchment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,facilityType,subDistrict,is24x7,isFru,category,isSelected,inCatchment);

@override
String toString() {
  return 'BpcrFacilityModel(id: $id, name: $name, facilityType: $facilityType, subDistrict: $subDistrict, is24x7: $is24x7, isFru: $isFru, category: $category, isSelected: $isSelected, inCatchment: $inCatchment)';
}


}

/// @nodoc
abstract mixin class _$BpcrFacilityModelCopyWith<$Res> implements $BpcrFacilityModelCopyWith<$Res> {
  factory _$BpcrFacilityModelCopyWith(_BpcrFacilityModel value, $Res Function(_BpcrFacilityModel) _then) = __$BpcrFacilityModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(name: 'facility_type') String facilityType,@JsonKey(name: 'sub_district') String? subDistrict,@JsonKey(name: 'is_24x7') bool is24x7,@JsonKey(name: 'is_fru') bool isFru, String? category,@JsonKey(name: 'is_selected') bool isSelected,@JsonKey(name: 'in_catchment') bool inCatchment
});




}
/// @nodoc
class __$BpcrFacilityModelCopyWithImpl<$Res>
    implements _$BpcrFacilityModelCopyWith<$Res> {
  __$BpcrFacilityModelCopyWithImpl(this._self, this._then);

  final _BpcrFacilityModel _self;
  final $Res Function(_BpcrFacilityModel) _then;

/// Create a copy of BpcrFacilityModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? facilityType = null,Object? subDistrict = freezed,Object? is24x7 = null,Object? isFru = null,Object? category = freezed,Object? isSelected = null,Object? inCatchment = null,}) {
  return _then(_BpcrFacilityModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,facilityType: null == facilityType ? _self.facilityType : facilityType // ignore: cast_nullable_to_non_nullable
as String,subDistrict: freezed == subDistrict ? _self.subDistrict : subDistrict // ignore: cast_nullable_to_non_nullable
as String?,is24x7: null == is24x7 ? _self.is24x7 : is24x7 // ignore: cast_nullable_to_non_nullable
as bool,isFru: null == isFru ? _self.isFru : isFru // ignore: cast_nullable_to_non_nullable
as bool,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,inCatchment: null == inCatchment ? _self.inCatchment : inCatchment // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
