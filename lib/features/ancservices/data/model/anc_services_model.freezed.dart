// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anc_services_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChecklistItemModel {

 String get key;@JsonKey(name: 'label_hi') String? get labelHi;@JsonKey(name: 'label_en') String? get labelEn; bool get checked;
/// Create a copy of ChecklistItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChecklistItemModelCopyWith<ChecklistItemModel> get copyWith => _$ChecklistItemModelCopyWithImpl<ChecklistItemModel>(this as ChecklistItemModel, _$identity);

  /// Serializes this ChecklistItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChecklistItemModel&&(identical(other.key, key) || other.key == key)&&(identical(other.labelHi, labelHi) || other.labelHi == labelHi)&&(identical(other.labelEn, labelEn) || other.labelEn == labelEn)&&(identical(other.checked, checked) || other.checked == checked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,labelHi,labelEn,checked);

@override
String toString() {
  return 'ChecklistItemModel(key: $key, labelHi: $labelHi, labelEn: $labelEn, checked: $checked)';
}


}

/// @nodoc
abstract mixin class $ChecklistItemModelCopyWith<$Res>  {
  factory $ChecklistItemModelCopyWith(ChecklistItemModel value, $Res Function(ChecklistItemModel) _then) = _$ChecklistItemModelCopyWithImpl;
@useResult
$Res call({
 String key,@JsonKey(name: 'label_hi') String? labelHi,@JsonKey(name: 'label_en') String? labelEn, bool checked
});




}
/// @nodoc
class _$ChecklistItemModelCopyWithImpl<$Res>
    implements $ChecklistItemModelCopyWith<$Res> {
  _$ChecklistItemModelCopyWithImpl(this._self, this._then);

  final ChecklistItemModel _self;
  final $Res Function(ChecklistItemModel) _then;

/// Create a copy of ChecklistItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? labelHi = freezed,Object? labelEn = freezed,Object? checked = null,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,labelHi: freezed == labelHi ? _self.labelHi : labelHi // ignore: cast_nullable_to_non_nullable
as String?,labelEn: freezed == labelEn ? _self.labelEn : labelEn // ignore: cast_nullable_to_non_nullable
as String?,checked: null == checked ? _self.checked : checked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ChecklistItemModel].
extension ChecklistItemModelPatterns on ChecklistItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChecklistItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChecklistItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChecklistItemModel value)  $default,){
final _that = this;
switch (_that) {
case _ChecklistItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChecklistItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChecklistItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key, @JsonKey(name: 'label_hi')  String? labelHi, @JsonKey(name: 'label_en')  String? labelEn,  bool checked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChecklistItemModel() when $default != null:
return $default(_that.key,_that.labelHi,_that.labelEn,_that.checked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key, @JsonKey(name: 'label_hi')  String? labelHi, @JsonKey(name: 'label_en')  String? labelEn,  bool checked)  $default,) {final _that = this;
switch (_that) {
case _ChecklistItemModel():
return $default(_that.key,_that.labelHi,_that.labelEn,_that.checked);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key, @JsonKey(name: 'label_hi')  String? labelHi, @JsonKey(name: 'label_en')  String? labelEn,  bool checked)?  $default,) {final _that = this;
switch (_that) {
case _ChecklistItemModel() when $default != null:
return $default(_that.key,_that.labelHi,_that.labelEn,_that.checked);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChecklistItemModel implements ChecklistItemModel {
  const _ChecklistItemModel({required this.key, @JsonKey(name: 'label_hi') this.labelHi, @JsonKey(name: 'label_en') this.labelEn, this.checked = false});
  factory _ChecklistItemModel.fromJson(Map<String, dynamic> json) => _$ChecklistItemModelFromJson(json);

@override final  String key;
@override@JsonKey(name: 'label_hi') final  String? labelHi;
@override@JsonKey(name: 'label_en') final  String? labelEn;
@override@JsonKey() final  bool checked;

/// Create a copy of ChecklistItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChecklistItemModelCopyWith<_ChecklistItemModel> get copyWith => __$ChecklistItemModelCopyWithImpl<_ChecklistItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChecklistItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChecklistItemModel&&(identical(other.key, key) || other.key == key)&&(identical(other.labelHi, labelHi) || other.labelHi == labelHi)&&(identical(other.labelEn, labelEn) || other.labelEn == labelEn)&&(identical(other.checked, checked) || other.checked == checked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,labelHi,labelEn,checked);

@override
String toString() {
  return 'ChecklistItemModel(key: $key, labelHi: $labelHi, labelEn: $labelEn, checked: $checked)';
}


}

/// @nodoc
abstract mixin class _$ChecklistItemModelCopyWith<$Res> implements $ChecklistItemModelCopyWith<$Res> {
  factory _$ChecklistItemModelCopyWith(_ChecklistItemModel value, $Res Function(_ChecklistItemModel) _then) = __$ChecklistItemModelCopyWithImpl;
@override @useResult
$Res call({
 String key,@JsonKey(name: 'label_hi') String? labelHi,@JsonKey(name: 'label_en') String? labelEn, bool checked
});




}
/// @nodoc
class __$ChecklistItemModelCopyWithImpl<$Res>
    implements _$ChecklistItemModelCopyWith<$Res> {
  __$ChecklistItemModelCopyWithImpl(this._self, this._then);

  final _ChecklistItemModel _self;
  final $Res Function(_ChecklistItemModel) _then;

/// Create a copy of ChecklistItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? labelHi = freezed,Object? labelEn = freezed,Object? checked = null,}) {
  return _then(_ChecklistItemModel(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,labelHi: freezed == labelHi ? _self.labelHi : labelHi // ignore: cast_nullable_to_non_nullable
as String?,labelEn: freezed == labelEn ? _self.labelEn : labelEn // ignore: cast_nullable_to_non_nullable
as String?,checked: null == checked ? _self.checked : checked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$AncVisitTimelineItem {

@JsonKey(name: 'visit_number') int get visitNumber;@JsonKey(name: 'title_hi') String? get titleHi;@JsonKey(name: 'title_en') String? get titleEn;@JsonKey(name: 'week_range') String get weekRange; List<ChecklistItemModel> get items;@JsonKey(name: 'tests_completed') int get testsCompleted;@JsonKey(name: 'tests_total') int get testsTotal; String get status;// 'completed' | 'due'
@JsonKey(name: 'visit_date') String? get visitDate;
/// Create a copy of AncVisitTimelineItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AncVisitTimelineItemCopyWith<AncVisitTimelineItem> get copyWith => _$AncVisitTimelineItemCopyWithImpl<AncVisitTimelineItem>(this as AncVisitTimelineItem, _$identity);

  /// Serializes this AncVisitTimelineItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AncVisitTimelineItem&&(identical(other.visitNumber, visitNumber) || other.visitNumber == visitNumber)&&(identical(other.titleHi, titleHi) || other.titleHi == titleHi)&&(identical(other.titleEn, titleEn) || other.titleEn == titleEn)&&(identical(other.weekRange, weekRange) || other.weekRange == weekRange)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.testsCompleted, testsCompleted) || other.testsCompleted == testsCompleted)&&(identical(other.testsTotal, testsTotal) || other.testsTotal == testsTotal)&&(identical(other.status, status) || other.status == status)&&(identical(other.visitDate, visitDate) || other.visitDate == visitDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,visitNumber,titleHi,titleEn,weekRange,const DeepCollectionEquality().hash(items),testsCompleted,testsTotal,status,visitDate);

@override
String toString() {
  return 'AncVisitTimelineItem(visitNumber: $visitNumber, titleHi: $titleHi, titleEn: $titleEn, weekRange: $weekRange, items: $items, testsCompleted: $testsCompleted, testsTotal: $testsTotal, status: $status, visitDate: $visitDate)';
}


}

/// @nodoc
abstract mixin class $AncVisitTimelineItemCopyWith<$Res>  {
  factory $AncVisitTimelineItemCopyWith(AncVisitTimelineItem value, $Res Function(AncVisitTimelineItem) _then) = _$AncVisitTimelineItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'visit_number') int visitNumber,@JsonKey(name: 'title_hi') String? titleHi,@JsonKey(name: 'title_en') String? titleEn,@JsonKey(name: 'week_range') String weekRange, List<ChecklistItemModel> items,@JsonKey(name: 'tests_completed') int testsCompleted,@JsonKey(name: 'tests_total') int testsTotal, String status,@JsonKey(name: 'visit_date') String? visitDate
});




}
/// @nodoc
class _$AncVisitTimelineItemCopyWithImpl<$Res>
    implements $AncVisitTimelineItemCopyWith<$Res> {
  _$AncVisitTimelineItemCopyWithImpl(this._self, this._then);

  final AncVisitTimelineItem _self;
  final $Res Function(AncVisitTimelineItem) _then;

/// Create a copy of AncVisitTimelineItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? visitNumber = null,Object? titleHi = freezed,Object? titleEn = freezed,Object? weekRange = null,Object? items = null,Object? testsCompleted = null,Object? testsTotal = null,Object? status = null,Object? visitDate = freezed,}) {
  return _then(_self.copyWith(
visitNumber: null == visitNumber ? _self.visitNumber : visitNumber // ignore: cast_nullable_to_non_nullable
as int,titleHi: freezed == titleHi ? _self.titleHi : titleHi // ignore: cast_nullable_to_non_nullable
as String?,titleEn: freezed == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String?,weekRange: null == weekRange ? _self.weekRange : weekRange // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ChecklistItemModel>,testsCompleted: null == testsCompleted ? _self.testsCompleted : testsCompleted // ignore: cast_nullable_to_non_nullable
as int,testsTotal: null == testsTotal ? _self.testsTotal : testsTotal // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,visitDate: freezed == visitDate ? _self.visitDate : visitDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AncVisitTimelineItem].
extension AncVisitTimelineItemPatterns on AncVisitTimelineItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AncVisitTimelineItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AncVisitTimelineItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AncVisitTimelineItem value)  $default,){
final _that = this;
switch (_that) {
case _AncVisitTimelineItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AncVisitTimelineItem value)?  $default,){
final _that = this;
switch (_that) {
case _AncVisitTimelineItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'visit_number')  int visitNumber, @JsonKey(name: 'title_hi')  String? titleHi, @JsonKey(name: 'title_en')  String? titleEn, @JsonKey(name: 'week_range')  String weekRange,  List<ChecklistItemModel> items, @JsonKey(name: 'tests_completed')  int testsCompleted, @JsonKey(name: 'tests_total')  int testsTotal,  String status, @JsonKey(name: 'visit_date')  String? visitDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AncVisitTimelineItem() when $default != null:
return $default(_that.visitNumber,_that.titleHi,_that.titleEn,_that.weekRange,_that.items,_that.testsCompleted,_that.testsTotal,_that.status,_that.visitDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'visit_number')  int visitNumber, @JsonKey(name: 'title_hi')  String? titleHi, @JsonKey(name: 'title_en')  String? titleEn, @JsonKey(name: 'week_range')  String weekRange,  List<ChecklistItemModel> items, @JsonKey(name: 'tests_completed')  int testsCompleted, @JsonKey(name: 'tests_total')  int testsTotal,  String status, @JsonKey(name: 'visit_date')  String? visitDate)  $default,) {final _that = this;
switch (_that) {
case _AncVisitTimelineItem():
return $default(_that.visitNumber,_that.titleHi,_that.titleEn,_that.weekRange,_that.items,_that.testsCompleted,_that.testsTotal,_that.status,_that.visitDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'visit_number')  int visitNumber, @JsonKey(name: 'title_hi')  String? titleHi, @JsonKey(name: 'title_en')  String? titleEn, @JsonKey(name: 'week_range')  String weekRange,  List<ChecklistItemModel> items, @JsonKey(name: 'tests_completed')  int testsCompleted, @JsonKey(name: 'tests_total')  int testsTotal,  String status, @JsonKey(name: 'visit_date')  String? visitDate)?  $default,) {final _that = this;
switch (_that) {
case _AncVisitTimelineItem() when $default != null:
return $default(_that.visitNumber,_that.titleHi,_that.titleEn,_that.weekRange,_that.items,_that.testsCompleted,_that.testsTotal,_that.status,_that.visitDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AncVisitTimelineItem implements AncVisitTimelineItem {
  const _AncVisitTimelineItem({@JsonKey(name: 'visit_number') required this.visitNumber, @JsonKey(name: 'title_hi') this.titleHi, @JsonKey(name: 'title_en') this.titleEn, @JsonKey(name: 'week_range') required this.weekRange, final  List<ChecklistItemModel> items = const [], @JsonKey(name: 'tests_completed') this.testsCompleted = 0, @JsonKey(name: 'tests_total') this.testsTotal = 0, this.status = 'due', @JsonKey(name: 'visit_date') this.visitDate}): _items = items;
  factory _AncVisitTimelineItem.fromJson(Map<String, dynamic> json) => _$AncVisitTimelineItemFromJson(json);

@override@JsonKey(name: 'visit_number') final  int visitNumber;
@override@JsonKey(name: 'title_hi') final  String? titleHi;
@override@JsonKey(name: 'title_en') final  String? titleEn;
@override@JsonKey(name: 'week_range') final  String weekRange;
 final  List<ChecklistItemModel> _items;
@override@JsonKey() List<ChecklistItemModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey(name: 'tests_completed') final  int testsCompleted;
@override@JsonKey(name: 'tests_total') final  int testsTotal;
@override@JsonKey() final  String status;
// 'completed' | 'due'
@override@JsonKey(name: 'visit_date') final  String? visitDate;

/// Create a copy of AncVisitTimelineItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AncVisitTimelineItemCopyWith<_AncVisitTimelineItem> get copyWith => __$AncVisitTimelineItemCopyWithImpl<_AncVisitTimelineItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AncVisitTimelineItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AncVisitTimelineItem&&(identical(other.visitNumber, visitNumber) || other.visitNumber == visitNumber)&&(identical(other.titleHi, titleHi) || other.titleHi == titleHi)&&(identical(other.titleEn, titleEn) || other.titleEn == titleEn)&&(identical(other.weekRange, weekRange) || other.weekRange == weekRange)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.testsCompleted, testsCompleted) || other.testsCompleted == testsCompleted)&&(identical(other.testsTotal, testsTotal) || other.testsTotal == testsTotal)&&(identical(other.status, status) || other.status == status)&&(identical(other.visitDate, visitDate) || other.visitDate == visitDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,visitNumber,titleHi,titleEn,weekRange,const DeepCollectionEquality().hash(_items),testsCompleted,testsTotal,status,visitDate);

@override
String toString() {
  return 'AncVisitTimelineItem(visitNumber: $visitNumber, titleHi: $titleHi, titleEn: $titleEn, weekRange: $weekRange, items: $items, testsCompleted: $testsCompleted, testsTotal: $testsTotal, status: $status, visitDate: $visitDate)';
}


}

/// @nodoc
abstract mixin class _$AncVisitTimelineItemCopyWith<$Res> implements $AncVisitTimelineItemCopyWith<$Res> {
  factory _$AncVisitTimelineItemCopyWith(_AncVisitTimelineItem value, $Res Function(_AncVisitTimelineItem) _then) = __$AncVisitTimelineItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'visit_number') int visitNumber,@JsonKey(name: 'title_hi') String? titleHi,@JsonKey(name: 'title_en') String? titleEn,@JsonKey(name: 'week_range') String weekRange, List<ChecklistItemModel> items,@JsonKey(name: 'tests_completed') int testsCompleted,@JsonKey(name: 'tests_total') int testsTotal, String status,@JsonKey(name: 'visit_date') String? visitDate
});




}
/// @nodoc
class __$AncVisitTimelineItemCopyWithImpl<$Res>
    implements _$AncVisitTimelineItemCopyWith<$Res> {
  __$AncVisitTimelineItemCopyWithImpl(this._self, this._then);

  final _AncVisitTimelineItem _self;
  final $Res Function(_AncVisitTimelineItem) _then;

/// Create a copy of AncVisitTimelineItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? visitNumber = null,Object? titleHi = freezed,Object? titleEn = freezed,Object? weekRange = null,Object? items = null,Object? testsCompleted = null,Object? testsTotal = null,Object? status = null,Object? visitDate = freezed,}) {
  return _then(_AncVisitTimelineItem(
visitNumber: null == visitNumber ? _self.visitNumber : visitNumber // ignore: cast_nullable_to_non_nullable
as int,titleHi: freezed == titleHi ? _self.titleHi : titleHi // ignore: cast_nullable_to_non_nullable
as String?,titleEn: freezed == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String?,weekRange: null == weekRange ? _self.weekRange : weekRange // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ChecklistItemModel>,testsCompleted: null == testsCompleted ? _self.testsCompleted : testsCompleted // ignore: cast_nullable_to_non_nullable
as int,testsTotal: null == testsTotal ? _self.testsTotal : testsTotal // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,visitDate: freezed == visitDate ? _self.visitDate : visitDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$VisitProgressItem {

@JsonKey(name: 'visit_number') int get visitNumber;@JsonKey(name: 'week_range') String get weekRange;@JsonKey(name: 'is_completed') bool get isCompleted;
/// Create a copy of VisitProgressItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VisitProgressItemCopyWith<VisitProgressItem> get copyWith => _$VisitProgressItemCopyWithImpl<VisitProgressItem>(this as VisitProgressItem, _$identity);

  /// Serializes this VisitProgressItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VisitProgressItem&&(identical(other.visitNumber, visitNumber) || other.visitNumber == visitNumber)&&(identical(other.weekRange, weekRange) || other.weekRange == weekRange)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,visitNumber,weekRange,isCompleted);

@override
String toString() {
  return 'VisitProgressItem(visitNumber: $visitNumber, weekRange: $weekRange, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class $VisitProgressItemCopyWith<$Res>  {
  factory $VisitProgressItemCopyWith(VisitProgressItem value, $Res Function(VisitProgressItem) _then) = _$VisitProgressItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'visit_number') int visitNumber,@JsonKey(name: 'week_range') String weekRange,@JsonKey(name: 'is_completed') bool isCompleted
});




}
/// @nodoc
class _$VisitProgressItemCopyWithImpl<$Res>
    implements $VisitProgressItemCopyWith<$Res> {
  _$VisitProgressItemCopyWithImpl(this._self, this._then);

  final VisitProgressItem _self;
  final $Res Function(VisitProgressItem) _then;

/// Create a copy of VisitProgressItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? visitNumber = null,Object? weekRange = null,Object? isCompleted = null,}) {
  return _then(_self.copyWith(
visitNumber: null == visitNumber ? _self.visitNumber : visitNumber // ignore: cast_nullable_to_non_nullable
as int,weekRange: null == weekRange ? _self.weekRange : weekRange // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [VisitProgressItem].
extension VisitProgressItemPatterns on VisitProgressItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VisitProgressItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VisitProgressItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VisitProgressItem value)  $default,){
final _that = this;
switch (_that) {
case _VisitProgressItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VisitProgressItem value)?  $default,){
final _that = this;
switch (_that) {
case _VisitProgressItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'visit_number')  int visitNumber, @JsonKey(name: 'week_range')  String weekRange, @JsonKey(name: 'is_completed')  bool isCompleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VisitProgressItem() when $default != null:
return $default(_that.visitNumber,_that.weekRange,_that.isCompleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'visit_number')  int visitNumber, @JsonKey(name: 'week_range')  String weekRange, @JsonKey(name: 'is_completed')  bool isCompleted)  $default,) {final _that = this;
switch (_that) {
case _VisitProgressItem():
return $default(_that.visitNumber,_that.weekRange,_that.isCompleted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'visit_number')  int visitNumber, @JsonKey(name: 'week_range')  String weekRange, @JsonKey(name: 'is_completed')  bool isCompleted)?  $default,) {final _that = this;
switch (_that) {
case _VisitProgressItem() when $default != null:
return $default(_that.visitNumber,_that.weekRange,_that.isCompleted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VisitProgressItem implements VisitProgressItem {
  const _VisitProgressItem({@JsonKey(name: 'visit_number') required this.visitNumber, @JsonKey(name: 'week_range') required this.weekRange, @JsonKey(name: 'is_completed') this.isCompleted = false});
  factory _VisitProgressItem.fromJson(Map<String, dynamic> json) => _$VisitProgressItemFromJson(json);

@override@JsonKey(name: 'visit_number') final  int visitNumber;
@override@JsonKey(name: 'week_range') final  String weekRange;
@override@JsonKey(name: 'is_completed') final  bool isCompleted;

/// Create a copy of VisitProgressItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VisitProgressItemCopyWith<_VisitProgressItem> get copyWith => __$VisitProgressItemCopyWithImpl<_VisitProgressItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VisitProgressItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VisitProgressItem&&(identical(other.visitNumber, visitNumber) || other.visitNumber == visitNumber)&&(identical(other.weekRange, weekRange) || other.weekRange == weekRange)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,visitNumber,weekRange,isCompleted);

@override
String toString() {
  return 'VisitProgressItem(visitNumber: $visitNumber, weekRange: $weekRange, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class _$VisitProgressItemCopyWith<$Res> implements $VisitProgressItemCopyWith<$Res> {
  factory _$VisitProgressItemCopyWith(_VisitProgressItem value, $Res Function(_VisitProgressItem) _then) = __$VisitProgressItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'visit_number') int visitNumber,@JsonKey(name: 'week_range') String weekRange,@JsonKey(name: 'is_completed') bool isCompleted
});




}
/// @nodoc
class __$VisitProgressItemCopyWithImpl<$Res>
    implements _$VisitProgressItemCopyWith<$Res> {
  __$VisitProgressItemCopyWithImpl(this._self, this._then);

  final _VisitProgressItem _self;
  final $Res Function(_VisitProgressItem) _then;

/// Create a copy of VisitProgressItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? visitNumber = null,Object? weekRange = null,Object? isCompleted = null,}) {
  return _then(_VisitProgressItem(
visitNumber: null == visitNumber ? _self.visitNumber : visitNumber // ignore: cast_nullable_to_non_nullable
as int,weekRange: null == weekRange ? _self.weekRange : weekRange // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$PregnancyRegistrationModel {

@JsonKey(name: 'is_registered') bool get isRegistered;@JsonKey(name: 'registered_date') String? get registeredDate;@JsonKey(name: 'rch_id_generated') bool get rchIdGenerated;@JsonKey(name: 'rch_id') String? get rchId;@JsonKey(name: 'mcp_card_received') bool get mcpCardReceived;@JsonKey(name: 'asha_assigned') bool get ashaAssigned;
/// Create a copy of PregnancyRegistrationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PregnancyRegistrationModelCopyWith<PregnancyRegistrationModel> get copyWith => _$PregnancyRegistrationModelCopyWithImpl<PregnancyRegistrationModel>(this as PregnancyRegistrationModel, _$identity);

  /// Serializes this PregnancyRegistrationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PregnancyRegistrationModel&&(identical(other.isRegistered, isRegistered) || other.isRegistered == isRegistered)&&(identical(other.registeredDate, registeredDate) || other.registeredDate == registeredDate)&&(identical(other.rchIdGenerated, rchIdGenerated) || other.rchIdGenerated == rchIdGenerated)&&(identical(other.rchId, rchId) || other.rchId == rchId)&&(identical(other.mcpCardReceived, mcpCardReceived) || other.mcpCardReceived == mcpCardReceived)&&(identical(other.ashaAssigned, ashaAssigned) || other.ashaAssigned == ashaAssigned));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isRegistered,registeredDate,rchIdGenerated,rchId,mcpCardReceived,ashaAssigned);

@override
String toString() {
  return 'PregnancyRegistrationModel(isRegistered: $isRegistered, registeredDate: $registeredDate, rchIdGenerated: $rchIdGenerated, rchId: $rchId, mcpCardReceived: $mcpCardReceived, ashaAssigned: $ashaAssigned)';
}


}

/// @nodoc
abstract mixin class $PregnancyRegistrationModelCopyWith<$Res>  {
  factory $PregnancyRegistrationModelCopyWith(PregnancyRegistrationModel value, $Res Function(PregnancyRegistrationModel) _then) = _$PregnancyRegistrationModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'is_registered') bool isRegistered,@JsonKey(name: 'registered_date') String? registeredDate,@JsonKey(name: 'rch_id_generated') bool rchIdGenerated,@JsonKey(name: 'rch_id') String? rchId,@JsonKey(name: 'mcp_card_received') bool mcpCardReceived,@JsonKey(name: 'asha_assigned') bool ashaAssigned
});




}
/// @nodoc
class _$PregnancyRegistrationModelCopyWithImpl<$Res>
    implements $PregnancyRegistrationModelCopyWith<$Res> {
  _$PregnancyRegistrationModelCopyWithImpl(this._self, this._then);

  final PregnancyRegistrationModel _self;
  final $Res Function(PregnancyRegistrationModel) _then;

/// Create a copy of PregnancyRegistrationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isRegistered = null,Object? registeredDate = freezed,Object? rchIdGenerated = null,Object? rchId = freezed,Object? mcpCardReceived = null,Object? ashaAssigned = null,}) {
  return _then(_self.copyWith(
isRegistered: null == isRegistered ? _self.isRegistered : isRegistered // ignore: cast_nullable_to_non_nullable
as bool,registeredDate: freezed == registeredDate ? _self.registeredDate : registeredDate // ignore: cast_nullable_to_non_nullable
as String?,rchIdGenerated: null == rchIdGenerated ? _self.rchIdGenerated : rchIdGenerated // ignore: cast_nullable_to_non_nullable
as bool,rchId: freezed == rchId ? _self.rchId : rchId // ignore: cast_nullable_to_non_nullable
as String?,mcpCardReceived: null == mcpCardReceived ? _self.mcpCardReceived : mcpCardReceived // ignore: cast_nullable_to_non_nullable
as bool,ashaAssigned: null == ashaAssigned ? _self.ashaAssigned : ashaAssigned // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PregnancyRegistrationModel].
extension PregnancyRegistrationModelPatterns on PregnancyRegistrationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PregnancyRegistrationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PregnancyRegistrationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PregnancyRegistrationModel value)  $default,){
final _that = this;
switch (_that) {
case _PregnancyRegistrationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PregnancyRegistrationModel value)?  $default,){
final _that = this;
switch (_that) {
case _PregnancyRegistrationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'is_registered')  bool isRegistered, @JsonKey(name: 'registered_date')  String? registeredDate, @JsonKey(name: 'rch_id_generated')  bool rchIdGenerated, @JsonKey(name: 'rch_id')  String? rchId, @JsonKey(name: 'mcp_card_received')  bool mcpCardReceived, @JsonKey(name: 'asha_assigned')  bool ashaAssigned)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PregnancyRegistrationModel() when $default != null:
return $default(_that.isRegistered,_that.registeredDate,_that.rchIdGenerated,_that.rchId,_that.mcpCardReceived,_that.ashaAssigned);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'is_registered')  bool isRegistered, @JsonKey(name: 'registered_date')  String? registeredDate, @JsonKey(name: 'rch_id_generated')  bool rchIdGenerated, @JsonKey(name: 'rch_id')  String? rchId, @JsonKey(name: 'mcp_card_received')  bool mcpCardReceived, @JsonKey(name: 'asha_assigned')  bool ashaAssigned)  $default,) {final _that = this;
switch (_that) {
case _PregnancyRegistrationModel():
return $default(_that.isRegistered,_that.registeredDate,_that.rchIdGenerated,_that.rchId,_that.mcpCardReceived,_that.ashaAssigned);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'is_registered')  bool isRegistered, @JsonKey(name: 'registered_date')  String? registeredDate, @JsonKey(name: 'rch_id_generated')  bool rchIdGenerated, @JsonKey(name: 'rch_id')  String? rchId, @JsonKey(name: 'mcp_card_received')  bool mcpCardReceived, @JsonKey(name: 'asha_assigned')  bool ashaAssigned)?  $default,) {final _that = this;
switch (_that) {
case _PregnancyRegistrationModel() when $default != null:
return $default(_that.isRegistered,_that.registeredDate,_that.rchIdGenerated,_that.rchId,_that.mcpCardReceived,_that.ashaAssigned);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PregnancyRegistrationModel implements PregnancyRegistrationModel {
  const _PregnancyRegistrationModel({@JsonKey(name: 'is_registered') this.isRegistered = false, @JsonKey(name: 'registered_date') this.registeredDate, @JsonKey(name: 'rch_id_generated') this.rchIdGenerated = false, @JsonKey(name: 'rch_id') this.rchId, @JsonKey(name: 'mcp_card_received') this.mcpCardReceived = false, @JsonKey(name: 'asha_assigned') this.ashaAssigned = false});
  factory _PregnancyRegistrationModel.fromJson(Map<String, dynamic> json) => _$PregnancyRegistrationModelFromJson(json);

@override@JsonKey(name: 'is_registered') final  bool isRegistered;
@override@JsonKey(name: 'registered_date') final  String? registeredDate;
@override@JsonKey(name: 'rch_id_generated') final  bool rchIdGenerated;
@override@JsonKey(name: 'rch_id') final  String? rchId;
@override@JsonKey(name: 'mcp_card_received') final  bool mcpCardReceived;
@override@JsonKey(name: 'asha_assigned') final  bool ashaAssigned;

/// Create a copy of PregnancyRegistrationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PregnancyRegistrationModelCopyWith<_PregnancyRegistrationModel> get copyWith => __$PregnancyRegistrationModelCopyWithImpl<_PregnancyRegistrationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PregnancyRegistrationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PregnancyRegistrationModel&&(identical(other.isRegistered, isRegistered) || other.isRegistered == isRegistered)&&(identical(other.registeredDate, registeredDate) || other.registeredDate == registeredDate)&&(identical(other.rchIdGenerated, rchIdGenerated) || other.rchIdGenerated == rchIdGenerated)&&(identical(other.rchId, rchId) || other.rchId == rchId)&&(identical(other.mcpCardReceived, mcpCardReceived) || other.mcpCardReceived == mcpCardReceived)&&(identical(other.ashaAssigned, ashaAssigned) || other.ashaAssigned == ashaAssigned));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isRegistered,registeredDate,rchIdGenerated,rchId,mcpCardReceived,ashaAssigned);

@override
String toString() {
  return 'PregnancyRegistrationModel(isRegistered: $isRegistered, registeredDate: $registeredDate, rchIdGenerated: $rchIdGenerated, rchId: $rchId, mcpCardReceived: $mcpCardReceived, ashaAssigned: $ashaAssigned)';
}


}

/// @nodoc
abstract mixin class _$PregnancyRegistrationModelCopyWith<$Res> implements $PregnancyRegistrationModelCopyWith<$Res> {
  factory _$PregnancyRegistrationModelCopyWith(_PregnancyRegistrationModel value, $Res Function(_PregnancyRegistrationModel) _then) = __$PregnancyRegistrationModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'is_registered') bool isRegistered,@JsonKey(name: 'registered_date') String? registeredDate,@JsonKey(name: 'rch_id_generated') bool rchIdGenerated,@JsonKey(name: 'rch_id') String? rchId,@JsonKey(name: 'mcp_card_received') bool mcpCardReceived,@JsonKey(name: 'asha_assigned') bool ashaAssigned
});




}
/// @nodoc
class __$PregnancyRegistrationModelCopyWithImpl<$Res>
    implements _$PregnancyRegistrationModelCopyWith<$Res> {
  __$PregnancyRegistrationModelCopyWithImpl(this._self, this._then);

  final _PregnancyRegistrationModel _self;
  final $Res Function(_PregnancyRegistrationModel) _then;

/// Create a copy of PregnancyRegistrationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isRegistered = null,Object? registeredDate = freezed,Object? rchIdGenerated = null,Object? rchId = freezed,Object? mcpCardReceived = null,Object? ashaAssigned = null,}) {
  return _then(_PregnancyRegistrationModel(
isRegistered: null == isRegistered ? _self.isRegistered : isRegistered // ignore: cast_nullable_to_non_nullable
as bool,registeredDate: freezed == registeredDate ? _self.registeredDate : registeredDate // ignore: cast_nullable_to_non_nullable
as String?,rchIdGenerated: null == rchIdGenerated ? _self.rchIdGenerated : rchIdGenerated // ignore: cast_nullable_to_non_nullable
as bool,rchId: freezed == rchId ? _self.rchId : rchId // ignore: cast_nullable_to_non_nullable
as String?,mcpCardReceived: null == mcpCardReceived ? _self.mcpCardReceived : mcpCardReceived // ignore: cast_nullable_to_non_nullable
as bool,ashaAssigned: null == ashaAssigned ? _self.ashaAssigned : ashaAssigned // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$MaternalNutritionModel {

@JsonKey(name: 'nutrition_counselling_received') bool get nutritionCounsellingReceived;@JsonKey(name: 'weight_monitored') bool get weightMonitored;@JsonKey(name: 'supplementary_nutrition_received') bool get supplementaryNutritionReceived;
/// Create a copy of MaternalNutritionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaternalNutritionModelCopyWith<MaternalNutritionModel> get copyWith => _$MaternalNutritionModelCopyWithImpl<MaternalNutritionModel>(this as MaternalNutritionModel, _$identity);

  /// Serializes this MaternalNutritionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaternalNutritionModel&&(identical(other.nutritionCounsellingReceived, nutritionCounsellingReceived) || other.nutritionCounsellingReceived == nutritionCounsellingReceived)&&(identical(other.weightMonitored, weightMonitored) || other.weightMonitored == weightMonitored)&&(identical(other.supplementaryNutritionReceived, supplementaryNutritionReceived) || other.supplementaryNutritionReceived == supplementaryNutritionReceived));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nutritionCounsellingReceived,weightMonitored,supplementaryNutritionReceived);

@override
String toString() {
  return 'MaternalNutritionModel(nutritionCounsellingReceived: $nutritionCounsellingReceived, weightMonitored: $weightMonitored, supplementaryNutritionReceived: $supplementaryNutritionReceived)';
}


}

/// @nodoc
abstract mixin class $MaternalNutritionModelCopyWith<$Res>  {
  factory $MaternalNutritionModelCopyWith(MaternalNutritionModel value, $Res Function(MaternalNutritionModel) _then) = _$MaternalNutritionModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'nutrition_counselling_received') bool nutritionCounsellingReceived,@JsonKey(name: 'weight_monitored') bool weightMonitored,@JsonKey(name: 'supplementary_nutrition_received') bool supplementaryNutritionReceived
});




}
/// @nodoc
class _$MaternalNutritionModelCopyWithImpl<$Res>
    implements $MaternalNutritionModelCopyWith<$Res> {
  _$MaternalNutritionModelCopyWithImpl(this._self, this._then);

  final MaternalNutritionModel _self;
  final $Res Function(MaternalNutritionModel) _then;

/// Create a copy of MaternalNutritionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nutritionCounsellingReceived = null,Object? weightMonitored = null,Object? supplementaryNutritionReceived = null,}) {
  return _then(_self.copyWith(
nutritionCounsellingReceived: null == nutritionCounsellingReceived ? _self.nutritionCounsellingReceived : nutritionCounsellingReceived // ignore: cast_nullable_to_non_nullable
as bool,weightMonitored: null == weightMonitored ? _self.weightMonitored : weightMonitored // ignore: cast_nullable_to_non_nullable
as bool,supplementaryNutritionReceived: null == supplementaryNutritionReceived ? _self.supplementaryNutritionReceived : supplementaryNutritionReceived // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MaternalNutritionModel].
extension MaternalNutritionModelPatterns on MaternalNutritionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MaternalNutritionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MaternalNutritionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MaternalNutritionModel value)  $default,){
final _that = this;
switch (_that) {
case _MaternalNutritionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MaternalNutritionModel value)?  $default,){
final _that = this;
switch (_that) {
case _MaternalNutritionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'nutrition_counselling_received')  bool nutritionCounsellingReceived, @JsonKey(name: 'weight_monitored')  bool weightMonitored, @JsonKey(name: 'supplementary_nutrition_received')  bool supplementaryNutritionReceived)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaternalNutritionModel() when $default != null:
return $default(_that.nutritionCounsellingReceived,_that.weightMonitored,_that.supplementaryNutritionReceived);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'nutrition_counselling_received')  bool nutritionCounsellingReceived, @JsonKey(name: 'weight_monitored')  bool weightMonitored, @JsonKey(name: 'supplementary_nutrition_received')  bool supplementaryNutritionReceived)  $default,) {final _that = this;
switch (_that) {
case _MaternalNutritionModel():
return $default(_that.nutritionCounsellingReceived,_that.weightMonitored,_that.supplementaryNutritionReceived);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'nutrition_counselling_received')  bool nutritionCounsellingReceived, @JsonKey(name: 'weight_monitored')  bool weightMonitored, @JsonKey(name: 'supplementary_nutrition_received')  bool supplementaryNutritionReceived)?  $default,) {final _that = this;
switch (_that) {
case _MaternalNutritionModel() when $default != null:
return $default(_that.nutritionCounsellingReceived,_that.weightMonitored,_that.supplementaryNutritionReceived);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MaternalNutritionModel implements MaternalNutritionModel {
  const _MaternalNutritionModel({@JsonKey(name: 'nutrition_counselling_received') this.nutritionCounsellingReceived = false, @JsonKey(name: 'weight_monitored') this.weightMonitored = false, @JsonKey(name: 'supplementary_nutrition_received') this.supplementaryNutritionReceived = false});
  factory _MaternalNutritionModel.fromJson(Map<String, dynamic> json) => _$MaternalNutritionModelFromJson(json);

@override@JsonKey(name: 'nutrition_counselling_received') final  bool nutritionCounsellingReceived;
@override@JsonKey(name: 'weight_monitored') final  bool weightMonitored;
@override@JsonKey(name: 'supplementary_nutrition_received') final  bool supplementaryNutritionReceived;

/// Create a copy of MaternalNutritionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaternalNutritionModelCopyWith<_MaternalNutritionModel> get copyWith => __$MaternalNutritionModelCopyWithImpl<_MaternalNutritionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MaternalNutritionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaternalNutritionModel&&(identical(other.nutritionCounsellingReceived, nutritionCounsellingReceived) || other.nutritionCounsellingReceived == nutritionCounsellingReceived)&&(identical(other.weightMonitored, weightMonitored) || other.weightMonitored == weightMonitored)&&(identical(other.supplementaryNutritionReceived, supplementaryNutritionReceived) || other.supplementaryNutritionReceived == supplementaryNutritionReceived));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nutritionCounsellingReceived,weightMonitored,supplementaryNutritionReceived);

@override
String toString() {
  return 'MaternalNutritionModel(nutritionCounsellingReceived: $nutritionCounsellingReceived, weightMonitored: $weightMonitored, supplementaryNutritionReceived: $supplementaryNutritionReceived)';
}


}

/// @nodoc
abstract mixin class _$MaternalNutritionModelCopyWith<$Res> implements $MaternalNutritionModelCopyWith<$Res> {
  factory _$MaternalNutritionModelCopyWith(_MaternalNutritionModel value, $Res Function(_MaternalNutritionModel) _then) = __$MaternalNutritionModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'nutrition_counselling_received') bool nutritionCounsellingReceived,@JsonKey(name: 'weight_monitored') bool weightMonitored,@JsonKey(name: 'supplementary_nutrition_received') bool supplementaryNutritionReceived
});




}
/// @nodoc
class __$MaternalNutritionModelCopyWithImpl<$Res>
    implements _$MaternalNutritionModelCopyWith<$Res> {
  __$MaternalNutritionModelCopyWithImpl(this._self, this._then);

  final _MaternalNutritionModel _self;
  final $Res Function(_MaternalNutritionModel) _then;

/// Create a copy of MaternalNutritionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nutritionCounsellingReceived = null,Object? weightMonitored = null,Object? supplementaryNutritionReceived = null,}) {
  return _then(_MaternalNutritionModel(
nutritionCounsellingReceived: null == nutritionCounsellingReceived ? _self.nutritionCounsellingReceived : nutritionCounsellingReceived // ignore: cast_nullable_to_non_nullable
as bool,weightMonitored: null == weightMonitored ? _self.weightMonitored : weightMonitored // ignore: cast_nullable_to_non_nullable
as bool,supplementaryNutritionReceived: null == supplementaryNutritionReceived ? _self.supplementaryNutritionReceived : supplementaryNutritionReceived // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$MedicineTrackerItem {

 int get taken; int get total;
/// Create a copy of MedicineTrackerItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MedicineTrackerItemCopyWith<MedicineTrackerItem> get copyWith => _$MedicineTrackerItemCopyWithImpl<MedicineTrackerItem>(this as MedicineTrackerItem, _$identity);

  /// Serializes this MedicineTrackerItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MedicineTrackerItem&&(identical(other.taken, taken) || other.taken == taken)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,taken,total);

@override
String toString() {
  return 'MedicineTrackerItem(taken: $taken, total: $total)';
}


}

/// @nodoc
abstract mixin class $MedicineTrackerItemCopyWith<$Res>  {
  factory $MedicineTrackerItemCopyWith(MedicineTrackerItem value, $Res Function(MedicineTrackerItem) _then) = _$MedicineTrackerItemCopyWithImpl;
@useResult
$Res call({
 int taken, int total
});




}
/// @nodoc
class _$MedicineTrackerItemCopyWithImpl<$Res>
    implements $MedicineTrackerItemCopyWith<$Res> {
  _$MedicineTrackerItemCopyWithImpl(this._self, this._then);

  final MedicineTrackerItem _self;
  final $Res Function(MedicineTrackerItem) _then;

/// Create a copy of MedicineTrackerItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? taken = null,Object? total = null,}) {
  return _then(_self.copyWith(
taken: null == taken ? _self.taken : taken // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MedicineTrackerItem].
extension MedicineTrackerItemPatterns on MedicineTrackerItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MedicineTrackerItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MedicineTrackerItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MedicineTrackerItem value)  $default,){
final _that = this;
switch (_that) {
case _MedicineTrackerItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MedicineTrackerItem value)?  $default,){
final _that = this;
switch (_that) {
case _MedicineTrackerItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int taken,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MedicineTrackerItem() when $default != null:
return $default(_that.taken,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int taken,  int total)  $default,) {final _that = this;
switch (_that) {
case _MedicineTrackerItem():
return $default(_that.taken,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int taken,  int total)?  $default,) {final _that = this;
switch (_that) {
case _MedicineTrackerItem() when $default != null:
return $default(_that.taken,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MedicineTrackerItem implements MedicineTrackerItem {
  const _MedicineTrackerItem({this.taken = 0, this.total = 0});
  factory _MedicineTrackerItem.fromJson(Map<String, dynamic> json) => _$MedicineTrackerItemFromJson(json);

@override@JsonKey() final  int taken;
@override@JsonKey() final  int total;

/// Create a copy of MedicineTrackerItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MedicineTrackerItemCopyWith<_MedicineTrackerItem> get copyWith => __$MedicineTrackerItemCopyWithImpl<_MedicineTrackerItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MedicineTrackerItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MedicineTrackerItem&&(identical(other.taken, taken) || other.taken == taken)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,taken,total);

@override
String toString() {
  return 'MedicineTrackerItem(taken: $taken, total: $total)';
}


}

/// @nodoc
abstract mixin class _$MedicineTrackerItemCopyWith<$Res> implements $MedicineTrackerItemCopyWith<$Res> {
  factory _$MedicineTrackerItemCopyWith(_MedicineTrackerItem value, $Res Function(_MedicineTrackerItem) _then) = __$MedicineTrackerItemCopyWithImpl;
@override @useResult
$Res call({
 int taken, int total
});




}
/// @nodoc
class __$MedicineTrackerItemCopyWithImpl<$Res>
    implements _$MedicineTrackerItemCopyWith<$Res> {
  __$MedicineTrackerItemCopyWithImpl(this._self, this._then);

  final _MedicineTrackerItem _self;
  final $Res Function(_MedicineTrackerItem) _then;

/// Create a copy of MedicineTrackerItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? taken = null,Object? total = null,}) {
  return _then(_MedicineTrackerItem(
taken: null == taken ? _self.taken : taken // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ImmunizationItem {

@JsonKey(name: 'dose_type') String get doseType; String get status;// 'pending' | 'received'
 String? get date;
/// Create a copy of ImmunizationItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImmunizationItemCopyWith<ImmunizationItem> get copyWith => _$ImmunizationItemCopyWithImpl<ImmunizationItem>(this as ImmunizationItem, _$identity);

  /// Serializes this ImmunizationItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImmunizationItem&&(identical(other.doseType, doseType) || other.doseType == doseType)&&(identical(other.status, status) || other.status == status)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doseType,status,date);

@override
String toString() {
  return 'ImmunizationItem(doseType: $doseType, status: $status, date: $date)';
}


}

/// @nodoc
abstract mixin class $ImmunizationItemCopyWith<$Res>  {
  factory $ImmunizationItemCopyWith(ImmunizationItem value, $Res Function(ImmunizationItem) _then) = _$ImmunizationItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'dose_type') String doseType, String status, String? date
});




}
/// @nodoc
class _$ImmunizationItemCopyWithImpl<$Res>
    implements $ImmunizationItemCopyWith<$Res> {
  _$ImmunizationItemCopyWithImpl(this._self, this._then);

  final ImmunizationItem _self;
  final $Res Function(ImmunizationItem) _then;

/// Create a copy of ImmunizationItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? doseType = null,Object? status = null,Object? date = freezed,}) {
  return _then(_self.copyWith(
doseType: null == doseType ? _self.doseType : doseType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ImmunizationItem].
extension ImmunizationItemPatterns on ImmunizationItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImmunizationItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImmunizationItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImmunizationItem value)  $default,){
final _that = this;
switch (_that) {
case _ImmunizationItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImmunizationItem value)?  $default,){
final _that = this;
switch (_that) {
case _ImmunizationItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'dose_type')  String doseType,  String status,  String? date)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImmunizationItem() when $default != null:
return $default(_that.doseType,_that.status,_that.date);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'dose_type')  String doseType,  String status,  String? date)  $default,) {final _that = this;
switch (_that) {
case _ImmunizationItem():
return $default(_that.doseType,_that.status,_that.date);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'dose_type')  String doseType,  String status,  String? date)?  $default,) {final _that = this;
switch (_that) {
case _ImmunizationItem() when $default != null:
return $default(_that.doseType,_that.status,_that.date);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ImmunizationItem implements ImmunizationItem {
  const _ImmunizationItem({@JsonKey(name: 'dose_type') required this.doseType, this.status = 'pending', this.date});
  factory _ImmunizationItem.fromJson(Map<String, dynamic> json) => _$ImmunizationItemFromJson(json);

@override@JsonKey(name: 'dose_type') final  String doseType;
@override@JsonKey() final  String status;
// 'pending' | 'received'
@override final  String? date;

/// Create a copy of ImmunizationItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImmunizationItemCopyWith<_ImmunizationItem> get copyWith => __$ImmunizationItemCopyWithImpl<_ImmunizationItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImmunizationItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImmunizationItem&&(identical(other.doseType, doseType) || other.doseType == doseType)&&(identical(other.status, status) || other.status == status)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doseType,status,date);

@override
String toString() {
  return 'ImmunizationItem(doseType: $doseType, status: $status, date: $date)';
}


}

/// @nodoc
abstract mixin class _$ImmunizationItemCopyWith<$Res> implements $ImmunizationItemCopyWith<$Res> {
  factory _$ImmunizationItemCopyWith(_ImmunizationItem value, $Res Function(_ImmunizationItem) _then) = __$ImmunizationItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'dose_type') String doseType, String status, String? date
});




}
/// @nodoc
class __$ImmunizationItemCopyWithImpl<$Res>
    implements _$ImmunizationItemCopyWith<$Res> {
  __$ImmunizationItemCopyWithImpl(this._self, this._then);

  final _ImmunizationItem _self;
  final $Res Function(_ImmunizationItem) _then;

/// Create a copy of ImmunizationItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? doseType = null,Object? status = null,Object? date = freezed,}) {
  return _then(_ImmunizationItem(
doseType: null == doseType ? _self.doseType : doseType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$UltrasoundItem {

@JsonKey(name: 'scan_type') String get scanType; String get status;// 'due' | 'completed'
@JsonKey(name: 'scan_date') String? get scanDate;
/// Create a copy of UltrasoundItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UltrasoundItemCopyWith<UltrasoundItem> get copyWith => _$UltrasoundItemCopyWithImpl<UltrasoundItem>(this as UltrasoundItem, _$identity);

  /// Serializes this UltrasoundItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UltrasoundItem&&(identical(other.scanType, scanType) || other.scanType == scanType)&&(identical(other.status, status) || other.status == status)&&(identical(other.scanDate, scanDate) || other.scanDate == scanDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,scanType,status,scanDate);

@override
String toString() {
  return 'UltrasoundItem(scanType: $scanType, status: $status, scanDate: $scanDate)';
}


}

/// @nodoc
abstract mixin class $UltrasoundItemCopyWith<$Res>  {
  factory $UltrasoundItemCopyWith(UltrasoundItem value, $Res Function(UltrasoundItem) _then) = _$UltrasoundItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'scan_type') String scanType, String status,@JsonKey(name: 'scan_date') String? scanDate
});




}
/// @nodoc
class _$UltrasoundItemCopyWithImpl<$Res>
    implements $UltrasoundItemCopyWith<$Res> {
  _$UltrasoundItemCopyWithImpl(this._self, this._then);

  final UltrasoundItem _self;
  final $Res Function(UltrasoundItem) _then;

/// Create a copy of UltrasoundItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? scanType = null,Object? status = null,Object? scanDate = freezed,}) {
  return _then(_self.copyWith(
scanType: null == scanType ? _self.scanType : scanType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,scanDate: freezed == scanDate ? _self.scanDate : scanDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UltrasoundItem].
extension UltrasoundItemPatterns on UltrasoundItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UltrasoundItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UltrasoundItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UltrasoundItem value)  $default,){
final _that = this;
switch (_that) {
case _UltrasoundItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UltrasoundItem value)?  $default,){
final _that = this;
switch (_that) {
case _UltrasoundItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'scan_type')  String scanType,  String status, @JsonKey(name: 'scan_date')  String? scanDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UltrasoundItem() when $default != null:
return $default(_that.scanType,_that.status,_that.scanDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'scan_type')  String scanType,  String status, @JsonKey(name: 'scan_date')  String? scanDate)  $default,) {final _that = this;
switch (_that) {
case _UltrasoundItem():
return $default(_that.scanType,_that.status,_that.scanDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'scan_type')  String scanType,  String status, @JsonKey(name: 'scan_date')  String? scanDate)?  $default,) {final _that = this;
switch (_that) {
case _UltrasoundItem() when $default != null:
return $default(_that.scanType,_that.status,_that.scanDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UltrasoundItem implements UltrasoundItem {
  const _UltrasoundItem({@JsonKey(name: 'scan_type') required this.scanType, this.status = 'due', @JsonKey(name: 'scan_date') this.scanDate});
  factory _UltrasoundItem.fromJson(Map<String, dynamic> json) => _$UltrasoundItemFromJson(json);

@override@JsonKey(name: 'scan_type') final  String scanType;
@override@JsonKey() final  String status;
// 'due' | 'completed'
@override@JsonKey(name: 'scan_date') final  String? scanDate;

/// Create a copy of UltrasoundItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UltrasoundItemCopyWith<_UltrasoundItem> get copyWith => __$UltrasoundItemCopyWithImpl<_UltrasoundItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UltrasoundItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UltrasoundItem&&(identical(other.scanType, scanType) || other.scanType == scanType)&&(identical(other.status, status) || other.status == status)&&(identical(other.scanDate, scanDate) || other.scanDate == scanDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,scanType,status,scanDate);

@override
String toString() {
  return 'UltrasoundItem(scanType: $scanType, status: $status, scanDate: $scanDate)';
}


}

/// @nodoc
abstract mixin class _$UltrasoundItemCopyWith<$Res> implements $UltrasoundItemCopyWith<$Res> {
  factory _$UltrasoundItemCopyWith(_UltrasoundItem value, $Res Function(_UltrasoundItem) _then) = __$UltrasoundItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'scan_type') String scanType, String status,@JsonKey(name: 'scan_date') String? scanDate
});




}
/// @nodoc
class __$UltrasoundItemCopyWithImpl<$Res>
    implements _$UltrasoundItemCopyWith<$Res> {
  __$UltrasoundItemCopyWithImpl(this._self, this._then);

  final _UltrasoundItem _self;
  final $Res Function(_UltrasoundItem) _then;

/// Create a copy of UltrasoundItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? scanType = null,Object? status = null,Object? scanDate = freezed,}) {
  return _then(_UltrasoundItem(
scanType: null == scanType ? _self.scanType : scanType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,scanDate: freezed == scanDate ? _self.scanDate : scanDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AncServicesModel {

@JsonKey(name: 'gestational_week') int? get gestationalWeek; int? get trimester; String get edd;@JsonKey(name: 'high_risk_status') String get highRiskStatus;// 'Yes'|'No'|'NA'
@JsonKey(name: 'high_risk_flags') List<String> get highRiskFlags;@JsonKey(name: 'bpcr_score_percent') double? get bpcrScorePercent;@JsonKey(name: 'visit_progress') List<VisitProgressItem> get visitProgress;@JsonKey(name: 'pregnancy_registration') PregnancyRegistrationModel get pregnancyRegistration;@JsonKey(name: 'maternal_nutrition') MaternalNutritionModel get maternalNutrition;@JsonKey(name: 'anc_visit_timeline') List<AncVisitTimelineItem> get ancVisitTimeline;@JsonKey(name: 'medicine_tracker') Map<String, MedicineTrackerItem> get medicineTracker; List<ImmunizationItem> get immunization; List<UltrasoundItem> get ultrasound;@JsonKey(name: 'total_visits') int get totalVisits;@JsonKey(name: 'next_due_date') String? get nextDueDate;@JsonKey(name: 'is_overdue') bool get isOverdue;@JsonKey(name: 'overdue_days') int? get overdueDays;
/// Create a copy of AncServicesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AncServicesModelCopyWith<AncServicesModel> get copyWith => _$AncServicesModelCopyWithImpl<AncServicesModel>(this as AncServicesModel, _$identity);

  /// Serializes this AncServicesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AncServicesModel&&(identical(other.gestationalWeek, gestationalWeek) || other.gestationalWeek == gestationalWeek)&&(identical(other.trimester, trimester) || other.trimester == trimester)&&(identical(other.edd, edd) || other.edd == edd)&&(identical(other.highRiskStatus, highRiskStatus) || other.highRiskStatus == highRiskStatus)&&const DeepCollectionEquality().equals(other.highRiskFlags, highRiskFlags)&&(identical(other.bpcrScorePercent, bpcrScorePercent) || other.bpcrScorePercent == bpcrScorePercent)&&const DeepCollectionEquality().equals(other.visitProgress, visitProgress)&&(identical(other.pregnancyRegistration, pregnancyRegistration) || other.pregnancyRegistration == pregnancyRegistration)&&(identical(other.maternalNutrition, maternalNutrition) || other.maternalNutrition == maternalNutrition)&&const DeepCollectionEquality().equals(other.ancVisitTimeline, ancVisitTimeline)&&const DeepCollectionEquality().equals(other.medicineTracker, medicineTracker)&&const DeepCollectionEquality().equals(other.immunization, immunization)&&const DeepCollectionEquality().equals(other.ultrasound, ultrasound)&&(identical(other.totalVisits, totalVisits) || other.totalVisits == totalVisits)&&(identical(other.nextDueDate, nextDueDate) || other.nextDueDate == nextDueDate)&&(identical(other.isOverdue, isOverdue) || other.isOverdue == isOverdue)&&(identical(other.overdueDays, overdueDays) || other.overdueDays == overdueDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gestationalWeek,trimester,edd,highRiskStatus,const DeepCollectionEquality().hash(highRiskFlags),bpcrScorePercent,const DeepCollectionEquality().hash(visitProgress),pregnancyRegistration,maternalNutrition,const DeepCollectionEquality().hash(ancVisitTimeline),const DeepCollectionEquality().hash(medicineTracker),const DeepCollectionEquality().hash(immunization),const DeepCollectionEquality().hash(ultrasound),totalVisits,nextDueDate,isOverdue,overdueDays);

@override
String toString() {
  return 'AncServicesModel(gestationalWeek: $gestationalWeek, trimester: $trimester, edd: $edd, highRiskStatus: $highRiskStatus, highRiskFlags: $highRiskFlags, bpcrScorePercent: $bpcrScorePercent, visitProgress: $visitProgress, pregnancyRegistration: $pregnancyRegistration, maternalNutrition: $maternalNutrition, ancVisitTimeline: $ancVisitTimeline, medicineTracker: $medicineTracker, immunization: $immunization, ultrasound: $ultrasound, totalVisits: $totalVisits, nextDueDate: $nextDueDate, isOverdue: $isOverdue, overdueDays: $overdueDays)';
}


}

/// @nodoc
abstract mixin class $AncServicesModelCopyWith<$Res>  {
  factory $AncServicesModelCopyWith(AncServicesModel value, $Res Function(AncServicesModel) _then) = _$AncServicesModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'gestational_week') int? gestationalWeek, int? trimester, String edd,@JsonKey(name: 'high_risk_status') String highRiskStatus,@JsonKey(name: 'high_risk_flags') List<String> highRiskFlags,@JsonKey(name: 'bpcr_score_percent') double? bpcrScorePercent,@JsonKey(name: 'visit_progress') List<VisitProgressItem> visitProgress,@JsonKey(name: 'pregnancy_registration') PregnancyRegistrationModel pregnancyRegistration,@JsonKey(name: 'maternal_nutrition') MaternalNutritionModel maternalNutrition,@JsonKey(name: 'anc_visit_timeline') List<AncVisitTimelineItem> ancVisitTimeline,@JsonKey(name: 'medicine_tracker') Map<String, MedicineTrackerItem> medicineTracker, List<ImmunizationItem> immunization, List<UltrasoundItem> ultrasound,@JsonKey(name: 'total_visits') int totalVisits,@JsonKey(name: 'next_due_date') String? nextDueDate,@JsonKey(name: 'is_overdue') bool isOverdue,@JsonKey(name: 'overdue_days') int? overdueDays
});


$PregnancyRegistrationModelCopyWith<$Res> get pregnancyRegistration;$MaternalNutritionModelCopyWith<$Res> get maternalNutrition;

}
/// @nodoc
class _$AncServicesModelCopyWithImpl<$Res>
    implements $AncServicesModelCopyWith<$Res> {
  _$AncServicesModelCopyWithImpl(this._self, this._then);

  final AncServicesModel _self;
  final $Res Function(AncServicesModel) _then;

/// Create a copy of AncServicesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? gestationalWeek = freezed,Object? trimester = freezed,Object? edd = null,Object? highRiskStatus = null,Object? highRiskFlags = null,Object? bpcrScorePercent = freezed,Object? visitProgress = null,Object? pregnancyRegistration = null,Object? maternalNutrition = null,Object? ancVisitTimeline = null,Object? medicineTracker = null,Object? immunization = null,Object? ultrasound = null,Object? totalVisits = null,Object? nextDueDate = freezed,Object? isOverdue = null,Object? overdueDays = freezed,}) {
  return _then(_self.copyWith(
gestationalWeek: freezed == gestationalWeek ? _self.gestationalWeek : gestationalWeek // ignore: cast_nullable_to_non_nullable
as int?,trimester: freezed == trimester ? _self.trimester : trimester // ignore: cast_nullable_to_non_nullable
as int?,edd: null == edd ? _self.edd : edd // ignore: cast_nullable_to_non_nullable
as String,highRiskStatus: null == highRiskStatus ? _self.highRiskStatus : highRiskStatus // ignore: cast_nullable_to_non_nullable
as String,highRiskFlags: null == highRiskFlags ? _self.highRiskFlags : highRiskFlags // ignore: cast_nullable_to_non_nullable
as List<String>,bpcrScorePercent: freezed == bpcrScorePercent ? _self.bpcrScorePercent : bpcrScorePercent // ignore: cast_nullable_to_non_nullable
as double?,visitProgress: null == visitProgress ? _self.visitProgress : visitProgress // ignore: cast_nullable_to_non_nullable
as List<VisitProgressItem>,pregnancyRegistration: null == pregnancyRegistration ? _self.pregnancyRegistration : pregnancyRegistration // ignore: cast_nullable_to_non_nullable
as PregnancyRegistrationModel,maternalNutrition: null == maternalNutrition ? _self.maternalNutrition : maternalNutrition // ignore: cast_nullable_to_non_nullable
as MaternalNutritionModel,ancVisitTimeline: null == ancVisitTimeline ? _self.ancVisitTimeline : ancVisitTimeline // ignore: cast_nullable_to_non_nullable
as List<AncVisitTimelineItem>,medicineTracker: null == medicineTracker ? _self.medicineTracker : medicineTracker // ignore: cast_nullable_to_non_nullable
as Map<String, MedicineTrackerItem>,immunization: null == immunization ? _self.immunization : immunization // ignore: cast_nullable_to_non_nullable
as List<ImmunizationItem>,ultrasound: null == ultrasound ? _self.ultrasound : ultrasound // ignore: cast_nullable_to_non_nullable
as List<UltrasoundItem>,totalVisits: null == totalVisits ? _self.totalVisits : totalVisits // ignore: cast_nullable_to_non_nullable
as int,nextDueDate: freezed == nextDueDate ? _self.nextDueDate : nextDueDate // ignore: cast_nullable_to_non_nullable
as String?,isOverdue: null == isOverdue ? _self.isOverdue : isOverdue // ignore: cast_nullable_to_non_nullable
as bool,overdueDays: freezed == overdueDays ? _self.overdueDays : overdueDays // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of AncServicesModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PregnancyRegistrationModelCopyWith<$Res> get pregnancyRegistration {
  
  return $PregnancyRegistrationModelCopyWith<$Res>(_self.pregnancyRegistration, (value) {
    return _then(_self.copyWith(pregnancyRegistration: value));
  });
}/// Create a copy of AncServicesModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MaternalNutritionModelCopyWith<$Res> get maternalNutrition {
  
  return $MaternalNutritionModelCopyWith<$Res>(_self.maternalNutrition, (value) {
    return _then(_self.copyWith(maternalNutrition: value));
  });
}
}


/// Adds pattern-matching-related methods to [AncServicesModel].
extension AncServicesModelPatterns on AncServicesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AncServicesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AncServicesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AncServicesModel value)  $default,){
final _that = this;
switch (_that) {
case _AncServicesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AncServicesModel value)?  $default,){
final _that = this;
switch (_that) {
case _AncServicesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'gestational_week')  int? gestationalWeek,  int? trimester,  String edd, @JsonKey(name: 'high_risk_status')  String highRiskStatus, @JsonKey(name: 'high_risk_flags')  List<String> highRiskFlags, @JsonKey(name: 'bpcr_score_percent')  double? bpcrScorePercent, @JsonKey(name: 'visit_progress')  List<VisitProgressItem> visitProgress, @JsonKey(name: 'pregnancy_registration')  PregnancyRegistrationModel pregnancyRegistration, @JsonKey(name: 'maternal_nutrition')  MaternalNutritionModel maternalNutrition, @JsonKey(name: 'anc_visit_timeline')  List<AncVisitTimelineItem> ancVisitTimeline, @JsonKey(name: 'medicine_tracker')  Map<String, MedicineTrackerItem> medicineTracker,  List<ImmunizationItem> immunization,  List<UltrasoundItem> ultrasound, @JsonKey(name: 'total_visits')  int totalVisits, @JsonKey(name: 'next_due_date')  String? nextDueDate, @JsonKey(name: 'is_overdue')  bool isOverdue, @JsonKey(name: 'overdue_days')  int? overdueDays)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AncServicesModel() when $default != null:
return $default(_that.gestationalWeek,_that.trimester,_that.edd,_that.highRiskStatus,_that.highRiskFlags,_that.bpcrScorePercent,_that.visitProgress,_that.pregnancyRegistration,_that.maternalNutrition,_that.ancVisitTimeline,_that.medicineTracker,_that.immunization,_that.ultrasound,_that.totalVisits,_that.nextDueDate,_that.isOverdue,_that.overdueDays);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'gestational_week')  int? gestationalWeek,  int? trimester,  String edd, @JsonKey(name: 'high_risk_status')  String highRiskStatus, @JsonKey(name: 'high_risk_flags')  List<String> highRiskFlags, @JsonKey(name: 'bpcr_score_percent')  double? bpcrScorePercent, @JsonKey(name: 'visit_progress')  List<VisitProgressItem> visitProgress, @JsonKey(name: 'pregnancy_registration')  PregnancyRegistrationModel pregnancyRegistration, @JsonKey(name: 'maternal_nutrition')  MaternalNutritionModel maternalNutrition, @JsonKey(name: 'anc_visit_timeline')  List<AncVisitTimelineItem> ancVisitTimeline, @JsonKey(name: 'medicine_tracker')  Map<String, MedicineTrackerItem> medicineTracker,  List<ImmunizationItem> immunization,  List<UltrasoundItem> ultrasound, @JsonKey(name: 'total_visits')  int totalVisits, @JsonKey(name: 'next_due_date')  String? nextDueDate, @JsonKey(name: 'is_overdue')  bool isOverdue, @JsonKey(name: 'overdue_days')  int? overdueDays)  $default,) {final _that = this;
switch (_that) {
case _AncServicesModel():
return $default(_that.gestationalWeek,_that.trimester,_that.edd,_that.highRiskStatus,_that.highRiskFlags,_that.bpcrScorePercent,_that.visitProgress,_that.pregnancyRegistration,_that.maternalNutrition,_that.ancVisitTimeline,_that.medicineTracker,_that.immunization,_that.ultrasound,_that.totalVisits,_that.nextDueDate,_that.isOverdue,_that.overdueDays);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'gestational_week')  int? gestationalWeek,  int? trimester,  String edd, @JsonKey(name: 'high_risk_status')  String highRiskStatus, @JsonKey(name: 'high_risk_flags')  List<String> highRiskFlags, @JsonKey(name: 'bpcr_score_percent')  double? bpcrScorePercent, @JsonKey(name: 'visit_progress')  List<VisitProgressItem> visitProgress, @JsonKey(name: 'pregnancy_registration')  PregnancyRegistrationModel pregnancyRegistration, @JsonKey(name: 'maternal_nutrition')  MaternalNutritionModel maternalNutrition, @JsonKey(name: 'anc_visit_timeline')  List<AncVisitTimelineItem> ancVisitTimeline, @JsonKey(name: 'medicine_tracker')  Map<String, MedicineTrackerItem> medicineTracker,  List<ImmunizationItem> immunization,  List<UltrasoundItem> ultrasound, @JsonKey(name: 'total_visits')  int totalVisits, @JsonKey(name: 'next_due_date')  String? nextDueDate, @JsonKey(name: 'is_overdue')  bool isOverdue, @JsonKey(name: 'overdue_days')  int? overdueDays)?  $default,) {final _that = this;
switch (_that) {
case _AncServicesModel() when $default != null:
return $default(_that.gestationalWeek,_that.trimester,_that.edd,_that.highRiskStatus,_that.highRiskFlags,_that.bpcrScorePercent,_that.visitProgress,_that.pregnancyRegistration,_that.maternalNutrition,_that.ancVisitTimeline,_that.medicineTracker,_that.immunization,_that.ultrasound,_that.totalVisits,_that.nextDueDate,_that.isOverdue,_that.overdueDays);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AncServicesModel implements AncServicesModel {
  const _AncServicesModel({@JsonKey(name: 'gestational_week') this.gestationalWeek, this.trimester, required this.edd, @JsonKey(name: 'high_risk_status') this.highRiskStatus = 'NA', @JsonKey(name: 'high_risk_flags') final  List<String> highRiskFlags = const [], @JsonKey(name: 'bpcr_score_percent') this.bpcrScorePercent, @JsonKey(name: 'visit_progress') final  List<VisitProgressItem> visitProgress = const [], @JsonKey(name: 'pregnancy_registration') required this.pregnancyRegistration, @JsonKey(name: 'maternal_nutrition') required this.maternalNutrition, @JsonKey(name: 'anc_visit_timeline') final  List<AncVisitTimelineItem> ancVisitTimeline = const [], @JsonKey(name: 'medicine_tracker') final  Map<String, MedicineTrackerItem> medicineTracker = const {}, final  List<ImmunizationItem> immunization = const [], final  List<UltrasoundItem> ultrasound = const [], @JsonKey(name: 'total_visits') this.totalVisits = 0, @JsonKey(name: 'next_due_date') this.nextDueDate, @JsonKey(name: 'is_overdue') this.isOverdue = false, @JsonKey(name: 'overdue_days') this.overdueDays}): _highRiskFlags = highRiskFlags,_visitProgress = visitProgress,_ancVisitTimeline = ancVisitTimeline,_medicineTracker = medicineTracker,_immunization = immunization,_ultrasound = ultrasound;
  factory _AncServicesModel.fromJson(Map<String, dynamic> json) => _$AncServicesModelFromJson(json);

@override@JsonKey(name: 'gestational_week') final  int? gestationalWeek;
@override final  int? trimester;
@override final  String edd;
@override@JsonKey(name: 'high_risk_status') final  String highRiskStatus;
// 'Yes'|'No'|'NA'
 final  List<String> _highRiskFlags;
// 'Yes'|'No'|'NA'
@override@JsonKey(name: 'high_risk_flags') List<String> get highRiskFlags {
  if (_highRiskFlags is EqualUnmodifiableListView) return _highRiskFlags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_highRiskFlags);
}

@override@JsonKey(name: 'bpcr_score_percent') final  double? bpcrScorePercent;
 final  List<VisitProgressItem> _visitProgress;
@override@JsonKey(name: 'visit_progress') List<VisitProgressItem> get visitProgress {
  if (_visitProgress is EqualUnmodifiableListView) return _visitProgress;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_visitProgress);
}

@override@JsonKey(name: 'pregnancy_registration') final  PregnancyRegistrationModel pregnancyRegistration;
@override@JsonKey(name: 'maternal_nutrition') final  MaternalNutritionModel maternalNutrition;
 final  List<AncVisitTimelineItem> _ancVisitTimeline;
@override@JsonKey(name: 'anc_visit_timeline') List<AncVisitTimelineItem> get ancVisitTimeline {
  if (_ancVisitTimeline is EqualUnmodifiableListView) return _ancVisitTimeline;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ancVisitTimeline);
}

 final  Map<String, MedicineTrackerItem> _medicineTracker;
@override@JsonKey(name: 'medicine_tracker') Map<String, MedicineTrackerItem> get medicineTracker {
  if (_medicineTracker is EqualUnmodifiableMapView) return _medicineTracker;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_medicineTracker);
}

 final  List<ImmunizationItem> _immunization;
@override@JsonKey() List<ImmunizationItem> get immunization {
  if (_immunization is EqualUnmodifiableListView) return _immunization;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_immunization);
}

 final  List<UltrasoundItem> _ultrasound;
@override@JsonKey() List<UltrasoundItem> get ultrasound {
  if (_ultrasound is EqualUnmodifiableListView) return _ultrasound;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ultrasound);
}

@override@JsonKey(name: 'total_visits') final  int totalVisits;
@override@JsonKey(name: 'next_due_date') final  String? nextDueDate;
@override@JsonKey(name: 'is_overdue') final  bool isOverdue;
@override@JsonKey(name: 'overdue_days') final  int? overdueDays;

/// Create a copy of AncServicesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AncServicesModelCopyWith<_AncServicesModel> get copyWith => __$AncServicesModelCopyWithImpl<_AncServicesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AncServicesModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AncServicesModel&&(identical(other.gestationalWeek, gestationalWeek) || other.gestationalWeek == gestationalWeek)&&(identical(other.trimester, trimester) || other.trimester == trimester)&&(identical(other.edd, edd) || other.edd == edd)&&(identical(other.highRiskStatus, highRiskStatus) || other.highRiskStatus == highRiskStatus)&&const DeepCollectionEquality().equals(other._highRiskFlags, _highRiskFlags)&&(identical(other.bpcrScorePercent, bpcrScorePercent) || other.bpcrScorePercent == bpcrScorePercent)&&const DeepCollectionEquality().equals(other._visitProgress, _visitProgress)&&(identical(other.pregnancyRegistration, pregnancyRegistration) || other.pregnancyRegistration == pregnancyRegistration)&&(identical(other.maternalNutrition, maternalNutrition) || other.maternalNutrition == maternalNutrition)&&const DeepCollectionEquality().equals(other._ancVisitTimeline, _ancVisitTimeline)&&const DeepCollectionEquality().equals(other._medicineTracker, _medicineTracker)&&const DeepCollectionEquality().equals(other._immunization, _immunization)&&const DeepCollectionEquality().equals(other._ultrasound, _ultrasound)&&(identical(other.totalVisits, totalVisits) || other.totalVisits == totalVisits)&&(identical(other.nextDueDate, nextDueDate) || other.nextDueDate == nextDueDate)&&(identical(other.isOverdue, isOverdue) || other.isOverdue == isOverdue)&&(identical(other.overdueDays, overdueDays) || other.overdueDays == overdueDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gestationalWeek,trimester,edd,highRiskStatus,const DeepCollectionEquality().hash(_highRiskFlags),bpcrScorePercent,const DeepCollectionEquality().hash(_visitProgress),pregnancyRegistration,maternalNutrition,const DeepCollectionEquality().hash(_ancVisitTimeline),const DeepCollectionEquality().hash(_medicineTracker),const DeepCollectionEquality().hash(_immunization),const DeepCollectionEquality().hash(_ultrasound),totalVisits,nextDueDate,isOverdue,overdueDays);

@override
String toString() {
  return 'AncServicesModel(gestationalWeek: $gestationalWeek, trimester: $trimester, edd: $edd, highRiskStatus: $highRiskStatus, highRiskFlags: $highRiskFlags, bpcrScorePercent: $bpcrScorePercent, visitProgress: $visitProgress, pregnancyRegistration: $pregnancyRegistration, maternalNutrition: $maternalNutrition, ancVisitTimeline: $ancVisitTimeline, medicineTracker: $medicineTracker, immunization: $immunization, ultrasound: $ultrasound, totalVisits: $totalVisits, nextDueDate: $nextDueDate, isOverdue: $isOverdue, overdueDays: $overdueDays)';
}


}

/// @nodoc
abstract mixin class _$AncServicesModelCopyWith<$Res> implements $AncServicesModelCopyWith<$Res> {
  factory _$AncServicesModelCopyWith(_AncServicesModel value, $Res Function(_AncServicesModel) _then) = __$AncServicesModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'gestational_week') int? gestationalWeek, int? trimester, String edd,@JsonKey(name: 'high_risk_status') String highRiskStatus,@JsonKey(name: 'high_risk_flags') List<String> highRiskFlags,@JsonKey(name: 'bpcr_score_percent') double? bpcrScorePercent,@JsonKey(name: 'visit_progress') List<VisitProgressItem> visitProgress,@JsonKey(name: 'pregnancy_registration') PregnancyRegistrationModel pregnancyRegistration,@JsonKey(name: 'maternal_nutrition') MaternalNutritionModel maternalNutrition,@JsonKey(name: 'anc_visit_timeline') List<AncVisitTimelineItem> ancVisitTimeline,@JsonKey(name: 'medicine_tracker') Map<String, MedicineTrackerItem> medicineTracker, List<ImmunizationItem> immunization, List<UltrasoundItem> ultrasound,@JsonKey(name: 'total_visits') int totalVisits,@JsonKey(name: 'next_due_date') String? nextDueDate,@JsonKey(name: 'is_overdue') bool isOverdue,@JsonKey(name: 'overdue_days') int? overdueDays
});


@override $PregnancyRegistrationModelCopyWith<$Res> get pregnancyRegistration;@override $MaternalNutritionModelCopyWith<$Res> get maternalNutrition;

}
/// @nodoc
class __$AncServicesModelCopyWithImpl<$Res>
    implements _$AncServicesModelCopyWith<$Res> {
  __$AncServicesModelCopyWithImpl(this._self, this._then);

  final _AncServicesModel _self;
  final $Res Function(_AncServicesModel) _then;

/// Create a copy of AncServicesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? gestationalWeek = freezed,Object? trimester = freezed,Object? edd = null,Object? highRiskStatus = null,Object? highRiskFlags = null,Object? bpcrScorePercent = freezed,Object? visitProgress = null,Object? pregnancyRegistration = null,Object? maternalNutrition = null,Object? ancVisitTimeline = null,Object? medicineTracker = null,Object? immunization = null,Object? ultrasound = null,Object? totalVisits = null,Object? nextDueDate = freezed,Object? isOverdue = null,Object? overdueDays = freezed,}) {
  return _then(_AncServicesModel(
gestationalWeek: freezed == gestationalWeek ? _self.gestationalWeek : gestationalWeek // ignore: cast_nullable_to_non_nullable
as int?,trimester: freezed == trimester ? _self.trimester : trimester // ignore: cast_nullable_to_non_nullable
as int?,edd: null == edd ? _self.edd : edd // ignore: cast_nullable_to_non_nullable
as String,highRiskStatus: null == highRiskStatus ? _self.highRiskStatus : highRiskStatus // ignore: cast_nullable_to_non_nullable
as String,highRiskFlags: null == highRiskFlags ? _self._highRiskFlags : highRiskFlags // ignore: cast_nullable_to_non_nullable
as List<String>,bpcrScorePercent: freezed == bpcrScorePercent ? _self.bpcrScorePercent : bpcrScorePercent // ignore: cast_nullable_to_non_nullable
as double?,visitProgress: null == visitProgress ? _self._visitProgress : visitProgress // ignore: cast_nullable_to_non_nullable
as List<VisitProgressItem>,pregnancyRegistration: null == pregnancyRegistration ? _self.pregnancyRegistration : pregnancyRegistration // ignore: cast_nullable_to_non_nullable
as PregnancyRegistrationModel,maternalNutrition: null == maternalNutrition ? _self.maternalNutrition : maternalNutrition // ignore: cast_nullable_to_non_nullable
as MaternalNutritionModel,ancVisitTimeline: null == ancVisitTimeline ? _self._ancVisitTimeline : ancVisitTimeline // ignore: cast_nullable_to_non_nullable
as List<AncVisitTimelineItem>,medicineTracker: null == medicineTracker ? _self._medicineTracker : medicineTracker // ignore: cast_nullable_to_non_nullable
as Map<String, MedicineTrackerItem>,immunization: null == immunization ? _self._immunization : immunization // ignore: cast_nullable_to_non_nullable
as List<ImmunizationItem>,ultrasound: null == ultrasound ? _self._ultrasound : ultrasound // ignore: cast_nullable_to_non_nullable
as List<UltrasoundItem>,totalVisits: null == totalVisits ? _self.totalVisits : totalVisits // ignore: cast_nullable_to_non_nullable
as int,nextDueDate: freezed == nextDueDate ? _self.nextDueDate : nextDueDate // ignore: cast_nullable_to_non_nullable
as String?,isOverdue: null == isOverdue ? _self.isOverdue : isOverdue // ignore: cast_nullable_to_non_nullable
as bool,overdueDays: freezed == overdueDays ? _self.overdueDays : overdueDays // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of AncServicesModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PregnancyRegistrationModelCopyWith<$Res> get pregnancyRegistration {
  
  return $PregnancyRegistrationModelCopyWith<$Res>(_self.pregnancyRegistration, (value) {
    return _then(_self.copyWith(pregnancyRegistration: value));
  });
}/// Create a copy of AncServicesModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MaternalNutritionModelCopyWith<$Res> get maternalNutrition {
  
  return $MaternalNutritionModelCopyWith<$Res>(_self.maternalNutrition, (value) {
    return _then(_self.copyWith(maternalNutrition: value));
  });
}
}

// dart format on
