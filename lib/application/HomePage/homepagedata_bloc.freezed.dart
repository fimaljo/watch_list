// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'homepagedata_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomepagedataEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getTrendingImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getTrendingImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getTrendingImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTrendingImage value) getTrendingImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetTrendingImage value)? getTrendingImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTrendingImage value)? getTrendingImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomepagedataEventCopyWith<$Res> {
  factory $HomepagedataEventCopyWith(
          HomepagedataEvent value, $Res Function(HomepagedataEvent) then) =
      _$HomepagedataEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomepagedataEventCopyWithImpl<$Res>
    implements $HomepagedataEventCopyWith<$Res> {
  _$HomepagedataEventCopyWithImpl(this._value, this._then);

  final HomepagedataEvent _value;
  // ignore: unused_field
  final $Res Function(HomepagedataEvent) _then;
}

/// @nodoc
abstract class _$$_GetTrendingImageCopyWith<$Res> {
  factory _$$_GetTrendingImageCopyWith(
          _$_GetTrendingImage value, $Res Function(_$_GetTrendingImage) then) =
      __$$_GetTrendingImageCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetTrendingImageCopyWithImpl<$Res>
    extends _$HomepagedataEventCopyWithImpl<$Res>
    implements _$$_GetTrendingImageCopyWith<$Res> {
  __$$_GetTrendingImageCopyWithImpl(
      _$_GetTrendingImage _value, $Res Function(_$_GetTrendingImage) _then)
      : super(_value, (v) => _then(v as _$_GetTrendingImage));

  @override
  _$_GetTrendingImage get _value => super._value as _$_GetTrendingImage;
}

/// @nodoc

class _$_GetTrendingImage implements _GetTrendingImage {
  const _$_GetTrendingImage();

  @override
  String toString() {
    return 'HomepagedataEvent.getTrendingImage()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetTrendingImage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getTrendingImage,
  }) {
    return getTrendingImage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getTrendingImage,
  }) {
    return getTrendingImage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getTrendingImage,
    required TResult orElse(),
  }) {
    if (getTrendingImage != null) {
      return getTrendingImage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTrendingImage value) getTrendingImage,
  }) {
    return getTrendingImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetTrendingImage value)? getTrendingImage,
  }) {
    return getTrendingImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTrendingImage value)? getTrendingImage,
    required TResult orElse(),
  }) {
    if (getTrendingImage != null) {
      return getTrendingImage(this);
    }
    return orElse();
  }
}

abstract class _GetTrendingImage implements HomepagedataEvent {
  const factory _GetTrendingImage() = _$_GetTrendingImage;
}

/// @nodoc
mixin _$HomepagedataState {
  List<MainData> get trendingdata => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomepagedataStateCopyWith<HomepagedataState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomepagedataStateCopyWith<$Res> {
  factory $HomepagedataStateCopyWith(
          HomepagedataState value, $Res Function(HomepagedataState) then) =
      _$HomepagedataStateCopyWithImpl<$Res>;
  $Res call({List<MainData> trendingdata, bool isLoading, bool hasError});
}

/// @nodoc
class _$HomepagedataStateCopyWithImpl<$Res>
    implements $HomepagedataStateCopyWith<$Res> {
  _$HomepagedataStateCopyWithImpl(this._value, this._then);

  final HomepagedataState _value;
  // ignore: unused_field
  final $Res Function(HomepagedataState) _then;

  @override
  $Res call({
    Object? trendingdata = freezed,
    Object? isLoading = freezed,
    Object? hasError = freezed,
  }) {
    return _then(_value.copyWith(
      trendingdata: trendingdata == freezed
          ? _value.trendingdata
          : trendingdata // ignore: cast_nullable_to_non_nullable
              as List<MainData>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: hasError == freezed
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_HomepagedataStateCopyWith<$Res>
    implements $HomepagedataStateCopyWith<$Res> {
  factory _$$_HomepagedataStateCopyWith(_$_HomepagedataState value,
          $Res Function(_$_HomepagedataState) then) =
      __$$_HomepagedataStateCopyWithImpl<$Res>;
  @override
  $Res call({List<MainData> trendingdata, bool isLoading, bool hasError});
}

/// @nodoc
class __$$_HomepagedataStateCopyWithImpl<$Res>
    extends _$HomepagedataStateCopyWithImpl<$Res>
    implements _$$_HomepagedataStateCopyWith<$Res> {
  __$$_HomepagedataStateCopyWithImpl(
      _$_HomepagedataState _value, $Res Function(_$_HomepagedataState) _then)
      : super(_value, (v) => _then(v as _$_HomepagedataState));

  @override
  _$_HomepagedataState get _value => super._value as _$_HomepagedataState;

  @override
  $Res call({
    Object? trendingdata = freezed,
    Object? isLoading = freezed,
    Object? hasError = freezed,
  }) {
    return _then(_$_HomepagedataState(
      trendingdata: trendingdata == freezed
          ? _value._trendingdata
          : trendingdata // ignore: cast_nullable_to_non_nullable
              as List<MainData>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: hasError == freezed
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_HomepagedataState implements _HomepagedataState {
  const _$_HomepagedataState(
      {required final List<MainData> trendingdata,
      required this.isLoading,
      required this.hasError})
      : _trendingdata = trendingdata;

  final List<MainData> _trendingdata;
  @override
  List<MainData> get trendingdata {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trendingdata);
  }

  @override
  final bool isLoading;
  @override
  final bool hasError;

  @override
  String toString() {
    return 'HomepagedataState(trendingdata: $trendingdata, isLoading: $isLoading, hasError: $hasError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomepagedataState &&
            const DeepCollectionEquality()
                .equals(other._trendingdata, _trendingdata) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.hasError, hasError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_trendingdata),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(hasError));

  @JsonKey(ignore: true)
  @override
  _$$_HomepagedataStateCopyWith<_$_HomepagedataState> get copyWith =>
      __$$_HomepagedataStateCopyWithImpl<_$_HomepagedataState>(
          this, _$identity);
}

abstract class _HomepagedataState implements HomepagedataState {
  const factory _HomepagedataState(
      {required final List<MainData> trendingdata,
      required final bool isLoading,
      required final bool hasError}) = _$_HomepagedataState;

  @override
  List<MainData> get trendingdata => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  bool get hasError => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_HomepagedataStateCopyWith<_$_HomepagedataState> get copyWith =>
      throw _privateConstructorUsedError;
}
