// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_module.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VideoModule {

 String get id; VideoCategory get category; String get titleEn; String get titleHi; String get videoUrl; String get thumbnailUrl;
/// Create a copy of VideoModule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VideoModuleCopyWith<VideoModule> get copyWith => _$VideoModuleCopyWithImpl<VideoModule>(this as VideoModule, _$identity);

  /// Serializes this VideoModule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VideoModule&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.titleEn, titleEn) || other.titleEn == titleEn)&&(identical(other.titleHi, titleHi) || other.titleHi == titleHi)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,category,titleEn,titleHi,videoUrl,thumbnailUrl);

@override
String toString() {
  return 'VideoModule(id: $id, category: $category, titleEn: $titleEn, titleHi: $titleHi, videoUrl: $videoUrl, thumbnailUrl: $thumbnailUrl)';
}


}

/// @nodoc
abstract mixin class $VideoModuleCopyWith<$Res>  {
  factory $VideoModuleCopyWith(VideoModule value, $Res Function(VideoModule) _then) = _$VideoModuleCopyWithImpl;
@useResult
$Res call({
 String id, VideoCategory category, String titleEn, String titleHi, String videoUrl, String thumbnailUrl
});




}
/// @nodoc
class _$VideoModuleCopyWithImpl<$Res>
    implements $VideoModuleCopyWith<$Res> {
  _$VideoModuleCopyWithImpl(this._self, this._then);

  final VideoModule _self;
  final $Res Function(VideoModule) _then;

/// Create a copy of VideoModule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? category = null,Object? titleEn = null,Object? titleHi = null,Object? videoUrl = null,Object? thumbnailUrl = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as VideoCategory,titleEn: null == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String,titleHi: null == titleHi ? _self.titleHi : titleHi // ignore: cast_nullable_to_non_nullable
as String,videoUrl: null == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VideoModule].
extension VideoModulePatterns on VideoModule {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VideoModule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VideoModule() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VideoModule value)  $default,){
final _that = this;
switch (_that) {
case _VideoModule():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VideoModule value)?  $default,){
final _that = this;
switch (_that) {
case _VideoModule() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  VideoCategory category,  String titleEn,  String titleHi,  String videoUrl,  String thumbnailUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VideoModule() when $default != null:
return $default(_that.id,_that.category,_that.titleEn,_that.titleHi,_that.videoUrl,_that.thumbnailUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  VideoCategory category,  String titleEn,  String titleHi,  String videoUrl,  String thumbnailUrl)  $default,) {final _that = this;
switch (_that) {
case _VideoModule():
return $default(_that.id,_that.category,_that.titleEn,_that.titleHi,_that.videoUrl,_that.thumbnailUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  VideoCategory category,  String titleEn,  String titleHi,  String videoUrl,  String thumbnailUrl)?  $default,) {final _that = this;
switch (_that) {
case _VideoModule() when $default != null:
return $default(_that.id,_that.category,_that.titleEn,_that.titleHi,_that.videoUrl,_that.thumbnailUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VideoModule implements VideoModule {
  const _VideoModule({required this.id, required this.category, required this.titleEn, required this.titleHi, required this.videoUrl, required this.thumbnailUrl});
  factory _VideoModule.fromJson(Map<String, dynamic> json) => _$VideoModuleFromJson(json);

@override final  String id;
@override final  VideoCategory category;
@override final  String titleEn;
@override final  String titleHi;
@override final  String videoUrl;
@override final  String thumbnailUrl;

/// Create a copy of VideoModule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VideoModuleCopyWith<_VideoModule> get copyWith => __$VideoModuleCopyWithImpl<_VideoModule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VideoModuleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VideoModule&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.titleEn, titleEn) || other.titleEn == titleEn)&&(identical(other.titleHi, titleHi) || other.titleHi == titleHi)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,category,titleEn,titleHi,videoUrl,thumbnailUrl);

@override
String toString() {
  return 'VideoModule(id: $id, category: $category, titleEn: $titleEn, titleHi: $titleHi, videoUrl: $videoUrl, thumbnailUrl: $thumbnailUrl)';
}


}

/// @nodoc
abstract mixin class _$VideoModuleCopyWith<$Res> implements $VideoModuleCopyWith<$Res> {
  factory _$VideoModuleCopyWith(_VideoModule value, $Res Function(_VideoModule) _then) = __$VideoModuleCopyWithImpl;
@override @useResult
$Res call({
 String id, VideoCategory category, String titleEn, String titleHi, String videoUrl, String thumbnailUrl
});




}
/// @nodoc
class __$VideoModuleCopyWithImpl<$Res>
    implements _$VideoModuleCopyWith<$Res> {
  __$VideoModuleCopyWithImpl(this._self, this._then);

  final _VideoModule _self;
  final $Res Function(_VideoModule) _then;

/// Create a copy of VideoModule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? category = null,Object? titleEn = null,Object? titleHi = null,Object? videoUrl = null,Object? thumbnailUrl = null,}) {
  return _then(_VideoModule(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as VideoCategory,titleEn: null == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String,titleHi: null == titleHi ? _self.titleHi : titleHi // ignore: cast_nullable_to_non_nullable
as String,videoUrl: null == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
