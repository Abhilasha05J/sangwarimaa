// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bpcr_score_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BpcrDomainModel {

 String get key;@JsonKey(name: 'max_points') int get maxPoints; int get earned; String get status;
/// Create a copy of BpcrDomainModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BpcrDomainModelCopyWith<BpcrDomainModel> get copyWith => _$BpcrDomainModelCopyWithImpl<BpcrDomainModel>(this as BpcrDomainModel, _$identity);

  /// Serializes this BpcrDomainModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BpcrDomainModel&&(identical(other.key, key) || other.key == key)&&(identical(other.maxPoints, maxPoints) || other.maxPoints == maxPoints)&&(identical(other.earned, earned) || other.earned == earned)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,maxPoints,earned,status);

@override
String toString() {
  return 'BpcrDomainModel(key: $key, maxPoints: $maxPoints, earned: $earned, status: $status)';
}


}

/// @nodoc
abstract mixin class $BpcrDomainModelCopyWith<$Res>  {
  factory $BpcrDomainModelCopyWith(BpcrDomainModel value, $Res Function(BpcrDomainModel) _then) = _$BpcrDomainModelCopyWithImpl;
@useResult
$Res call({
 String key,@JsonKey(name: 'max_points') int maxPoints, int earned, String status
});




}
/// @nodoc
class _$BpcrDomainModelCopyWithImpl<$Res>
    implements $BpcrDomainModelCopyWith<$Res> {
  _$BpcrDomainModelCopyWithImpl(this._self, this._then);

  final BpcrDomainModel _self;
  final $Res Function(BpcrDomainModel) _then;

/// Create a copy of BpcrDomainModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? maxPoints = null,Object? earned = null,Object? status = null,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,maxPoints: null == maxPoints ? _self.maxPoints : maxPoints // ignore: cast_nullable_to_non_nullable
as int,earned: null == earned ? _self.earned : earned // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BpcrDomainModel].
extension BpcrDomainModelPatterns on BpcrDomainModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BpcrDomainModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BpcrDomainModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BpcrDomainModel value)  $default,){
final _that = this;
switch (_that) {
case _BpcrDomainModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BpcrDomainModel value)?  $default,){
final _that = this;
switch (_that) {
case _BpcrDomainModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key, @JsonKey(name: 'max_points')  int maxPoints,  int earned,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BpcrDomainModel() when $default != null:
return $default(_that.key,_that.maxPoints,_that.earned,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key, @JsonKey(name: 'max_points')  int maxPoints,  int earned,  String status)  $default,) {final _that = this;
switch (_that) {
case _BpcrDomainModel():
return $default(_that.key,_that.maxPoints,_that.earned,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key, @JsonKey(name: 'max_points')  int maxPoints,  int earned,  String status)?  $default,) {final _that = this;
switch (_that) {
case _BpcrDomainModel() when $default != null:
return $default(_that.key,_that.maxPoints,_that.earned,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BpcrDomainModel implements BpcrDomainModel {
  const _BpcrDomainModel({required this.key, @JsonKey(name: 'max_points') required this.maxPoints, required this.earned, required this.status});
  factory _BpcrDomainModel.fromJson(Map<String, dynamic> json) => _$BpcrDomainModelFromJson(json);

@override final  String key;
@override@JsonKey(name: 'max_points') final  int maxPoints;
@override final  int earned;
@override final  String status;

/// Create a copy of BpcrDomainModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BpcrDomainModelCopyWith<_BpcrDomainModel> get copyWith => __$BpcrDomainModelCopyWithImpl<_BpcrDomainModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BpcrDomainModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BpcrDomainModel&&(identical(other.key, key) || other.key == key)&&(identical(other.maxPoints, maxPoints) || other.maxPoints == maxPoints)&&(identical(other.earned, earned) || other.earned == earned)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,maxPoints,earned,status);

@override
String toString() {
  return 'BpcrDomainModel(key: $key, maxPoints: $maxPoints, earned: $earned, status: $status)';
}


}

/// @nodoc
abstract mixin class _$BpcrDomainModelCopyWith<$Res> implements $BpcrDomainModelCopyWith<$Res> {
  factory _$BpcrDomainModelCopyWith(_BpcrDomainModel value, $Res Function(_BpcrDomainModel) _then) = __$BpcrDomainModelCopyWithImpl;
@override @useResult
$Res call({
 String key,@JsonKey(name: 'max_points') int maxPoints, int earned, String status
});




}
/// @nodoc
class __$BpcrDomainModelCopyWithImpl<$Res>
    implements _$BpcrDomainModelCopyWith<$Res> {
  __$BpcrDomainModelCopyWithImpl(this._self, this._then);

  final _BpcrDomainModel _self;
  final $Res Function(_BpcrDomainModel) _then;

/// Create a copy of BpcrDomainModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? maxPoints = null,Object? earned = null,Object? status = null,}) {
  return _then(_BpcrDomainModel(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,maxPoints: null == maxPoints ? _self.maxPoints : maxPoints // ignore: cast_nullable_to_non_nullable
as int,earned: null == earned ? _self.earned : earned // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$BpcrScoreModel {

@JsonKey(name: 'total_score') int get totalScore;@JsonKey(name: 'max_score') int get maxScore;@JsonKey(name: 'max_reachable_now') int get maxReachableNow; String get band;// 'excellent'|'good'|'moderate'|'poor'|'high_risk'
@JsonKey(name: 'message_en') String get messageEn; List<BpcrDomainModel> get domains;
/// Create a copy of BpcrScoreModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BpcrScoreModelCopyWith<BpcrScoreModel> get copyWith => _$BpcrScoreModelCopyWithImpl<BpcrScoreModel>(this as BpcrScoreModel, _$identity);

  /// Serializes this BpcrScoreModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BpcrScoreModel&&(identical(other.totalScore, totalScore) || other.totalScore == totalScore)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore)&&(identical(other.maxReachableNow, maxReachableNow) || other.maxReachableNow == maxReachableNow)&&(identical(other.band, band) || other.band == band)&&(identical(other.messageEn, messageEn) || other.messageEn == messageEn)&&const DeepCollectionEquality().equals(other.domains, domains));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalScore,maxScore,maxReachableNow,band,messageEn,const DeepCollectionEquality().hash(domains));

@override
String toString() {
  return 'BpcrScoreModel(totalScore: $totalScore, maxScore: $maxScore, maxReachableNow: $maxReachableNow, band: $band, messageEn: $messageEn, domains: $domains)';
}


}

/// @nodoc
abstract mixin class $BpcrScoreModelCopyWith<$Res>  {
  factory $BpcrScoreModelCopyWith(BpcrScoreModel value, $Res Function(BpcrScoreModel) _then) = _$BpcrScoreModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'total_score') int totalScore,@JsonKey(name: 'max_score') int maxScore,@JsonKey(name: 'max_reachable_now') int maxReachableNow, String band,@JsonKey(name: 'message_en') String messageEn, List<BpcrDomainModel> domains
});




}
/// @nodoc
class _$BpcrScoreModelCopyWithImpl<$Res>
    implements $BpcrScoreModelCopyWith<$Res> {
  _$BpcrScoreModelCopyWithImpl(this._self, this._then);

  final BpcrScoreModel _self;
  final $Res Function(BpcrScoreModel) _then;

/// Create a copy of BpcrScoreModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalScore = null,Object? maxScore = null,Object? maxReachableNow = null,Object? band = null,Object? messageEn = null,Object? domains = null,}) {
  return _then(_self.copyWith(
totalScore: null == totalScore ? _self.totalScore : totalScore // ignore: cast_nullable_to_non_nullable
as int,maxScore: null == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as int,maxReachableNow: null == maxReachableNow ? _self.maxReachableNow : maxReachableNow // ignore: cast_nullable_to_non_nullable
as int,band: null == band ? _self.band : band // ignore: cast_nullable_to_non_nullable
as String,messageEn: null == messageEn ? _self.messageEn : messageEn // ignore: cast_nullable_to_non_nullable
as String,domains: null == domains ? _self.domains : domains // ignore: cast_nullable_to_non_nullable
as List<BpcrDomainModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [BpcrScoreModel].
extension BpcrScoreModelPatterns on BpcrScoreModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BpcrScoreModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BpcrScoreModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BpcrScoreModel value)  $default,){
final _that = this;
switch (_that) {
case _BpcrScoreModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BpcrScoreModel value)?  $default,){
final _that = this;
switch (_that) {
case _BpcrScoreModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_score')  int totalScore, @JsonKey(name: 'max_score')  int maxScore, @JsonKey(name: 'max_reachable_now')  int maxReachableNow,  String band, @JsonKey(name: 'message_en')  String messageEn,  List<BpcrDomainModel> domains)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BpcrScoreModel() when $default != null:
return $default(_that.totalScore,_that.maxScore,_that.maxReachableNow,_that.band,_that.messageEn,_that.domains);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_score')  int totalScore, @JsonKey(name: 'max_score')  int maxScore, @JsonKey(name: 'max_reachable_now')  int maxReachableNow,  String band, @JsonKey(name: 'message_en')  String messageEn,  List<BpcrDomainModel> domains)  $default,) {final _that = this;
switch (_that) {
case _BpcrScoreModel():
return $default(_that.totalScore,_that.maxScore,_that.maxReachableNow,_that.band,_that.messageEn,_that.domains);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'total_score')  int totalScore, @JsonKey(name: 'max_score')  int maxScore, @JsonKey(name: 'max_reachable_now')  int maxReachableNow,  String band, @JsonKey(name: 'message_en')  String messageEn,  List<BpcrDomainModel> domains)?  $default,) {final _that = this;
switch (_that) {
case _BpcrScoreModel() when $default != null:
return $default(_that.totalScore,_that.maxScore,_that.maxReachableNow,_that.band,_that.messageEn,_that.domains);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BpcrScoreModel implements BpcrScoreModel {
  const _BpcrScoreModel({@JsonKey(name: 'total_score') required this.totalScore, @JsonKey(name: 'max_score') required this.maxScore, @JsonKey(name: 'max_reachable_now') required this.maxReachableNow, required this.band, @JsonKey(name: 'message_en') required this.messageEn, required final  List<BpcrDomainModel> domains}): _domains = domains;
  factory _BpcrScoreModel.fromJson(Map<String, dynamic> json) => _$BpcrScoreModelFromJson(json);

@override@JsonKey(name: 'total_score') final  int totalScore;
@override@JsonKey(name: 'max_score') final  int maxScore;
@override@JsonKey(name: 'max_reachable_now') final  int maxReachableNow;
@override final  String band;
// 'excellent'|'good'|'moderate'|'poor'|'high_risk'
@override@JsonKey(name: 'message_en') final  String messageEn;
 final  List<BpcrDomainModel> _domains;
@override List<BpcrDomainModel> get domains {
  if (_domains is EqualUnmodifiableListView) return _domains;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_domains);
}


/// Create a copy of BpcrScoreModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BpcrScoreModelCopyWith<_BpcrScoreModel> get copyWith => __$BpcrScoreModelCopyWithImpl<_BpcrScoreModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BpcrScoreModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BpcrScoreModel&&(identical(other.totalScore, totalScore) || other.totalScore == totalScore)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore)&&(identical(other.maxReachableNow, maxReachableNow) || other.maxReachableNow == maxReachableNow)&&(identical(other.band, band) || other.band == band)&&(identical(other.messageEn, messageEn) || other.messageEn == messageEn)&&const DeepCollectionEquality().equals(other._domains, _domains));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalScore,maxScore,maxReachableNow,band,messageEn,const DeepCollectionEquality().hash(_domains));

@override
String toString() {
  return 'BpcrScoreModel(totalScore: $totalScore, maxScore: $maxScore, maxReachableNow: $maxReachableNow, band: $band, messageEn: $messageEn, domains: $domains)';
}


}

/// @nodoc
abstract mixin class _$BpcrScoreModelCopyWith<$Res> implements $BpcrScoreModelCopyWith<$Res> {
  factory _$BpcrScoreModelCopyWith(_BpcrScoreModel value, $Res Function(_BpcrScoreModel) _then) = __$BpcrScoreModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'total_score') int totalScore,@JsonKey(name: 'max_score') int maxScore,@JsonKey(name: 'max_reachable_now') int maxReachableNow, String band,@JsonKey(name: 'message_en') String messageEn, List<BpcrDomainModel> domains
});




}
/// @nodoc
class __$BpcrScoreModelCopyWithImpl<$Res>
    implements _$BpcrScoreModelCopyWith<$Res> {
  __$BpcrScoreModelCopyWithImpl(this._self, this._then);

  final _BpcrScoreModel _self;
  final $Res Function(_BpcrScoreModel) _then;

/// Create a copy of BpcrScoreModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalScore = null,Object? maxScore = null,Object? maxReachableNow = null,Object? band = null,Object? messageEn = null,Object? domains = null,}) {
  return _then(_BpcrScoreModel(
totalScore: null == totalScore ? _self.totalScore : totalScore // ignore: cast_nullable_to_non_nullable
as int,maxScore: null == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as int,maxReachableNow: null == maxReachableNow ? _self.maxReachableNow : maxReachableNow // ignore: cast_nullable_to_non_nullable
as int,band: null == band ? _self.band : band // ignore: cast_nullable_to_non_nullable
as String,messageEn: null == messageEn ? _self.messageEn : messageEn // ignore: cast_nullable_to_non_nullable
as String,domains: null == domains ? _self._domains : domains // ignore: cast_nullable_to_non_nullable
as List<BpcrDomainModel>,
  ));
}


}

// dart format on
