// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchState {
  List<MainData> get trendingdataforsearch =>
      throw _privateConstructorUsedError;
  List<MainData> get searchtrendingdata => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res>;
  $Res call(
      {List<MainData> trendingdataforsearch,
      List<MainData> searchtrendingdata,
      bool isLoading,
      bool hasError});
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res> implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  final SearchState _value;
  // ignore: unused_field
  final $Res Function(SearchState) _then;

  @override
  $Res call({
    Object? trendingdataforsearch = freezed,
    Object? searchtrendingdata = freezed,
    Object? isLoading = freezed,
    Object? hasError = freezed,
  }) {
    return _then(_value.copyWith(
      trendingdataforsearch: trendingdataforsearch == freezed
          ? _value.trendingdataforsearch
          : trendingdataforsearch // ignore: cast_nullable_to_non_nullable
              as List<MainData>,
      searchtrendingdata: searchtrendingdata == freezed
          ? _value.searchtrendingdata
          : searchtrendingdata // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_SearchStateCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$$_SearchStateCopyWith(
          _$_SearchState value, $Res Function(_$_SearchState) then) =
      __$$_SearchStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<MainData> trendingdataforsearch,
      List<MainData> searchtrendingdata,
      bool isLoading,
      bool hasError});
}

/// @nodoc
class __$$_SearchStateCopyWithImpl<$Res> extends _$SearchStateCopyWithImpl<$Res>
    implements _$$_SearchStateCopyWith<$Res> {
  __$$_SearchStateCopyWithImpl(
      _$_SearchState _value, $Res Function(_$_SearchState) _then)
      : super(_value, (v) => _then(v as _$_SearchState));

  @override
  _$_SearchState get _value => super._value as _$_SearchState;

  @override
  $Res call({
    Object? trendingdataforsearch = freezed,
    Object? searchtrendingdata = freezed,
    Object? isLoading = freezed,
    Object? hasError = freezed,
  }) {
    return _then(_$_SearchState(
      trendingdataforsearch: trendingdataforsearch == freezed
          ? _value._trendingdataforsearch
          : trendingdataforsearch // ignore: cast_nullable_to_non_nullable
              as List<MainData>,
      searchtrendingdata: searchtrendingdata == freezed
          ? _value._searchtrendingdata
          : searchtrendingdata // ignore: cast_nullable_to_non_nullable
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

class _$_SearchState implements _SearchState {
  const _$_SearchState(
      {required final List<MainData> trendingdataforsearch,
      required final List<MainData> searchtrendingdata,
      required this.isLoading,
      required this.hasError})
      : _trendingdataforsearch = trendingdataforsearch,
        _searchtrendingdata = searchtrendingdata;

  final List<MainData> _trendingdataforsearch;
  @override
  List<MainData> get trendingdataforsearch {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trendingdataforsearch);
  }

  final List<MainData> _searchtrendingdata;
  @override
  List<MainData> get searchtrendingdata {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchtrendingdata);
  }

  @override
  final bool isLoading;
  @override
  final bool hasError;

  @override
  String toString() {
    return 'SearchState(trendingdataforsearch: $trendingdataforsearch, searchtrendingdata: $searchtrendingdata, isLoading: $isLoading, hasError: $hasError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchState &&
            const DeepCollectionEquality()
                .equals(other._trendingdataforsearch, _trendingdataforsearch) &&
            const DeepCollectionEquality()
                .equals(other._searchtrendingdata, _searchtrendingdata) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.hasError, hasError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_trendingdataforsearch),
      const DeepCollectionEquality().hash(_searchtrendingdata),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(hasError));

  @JsonKey(ignore: true)
  @override
  _$$_SearchStateCopyWith<_$_SearchState> get copyWith =>
      __$$_SearchStateCopyWithImpl<_$_SearchState>(this, _$identity);
}

abstract class _SearchState implements SearchState {
  const factory _SearchState(
      {required final List<MainData> trendingdataforsearch,
      required final List<MainData> searchtrendingdata,
      required final bool isLoading,
      required final bool hasError}) = _$_SearchState;

  @override
  List<MainData> get trendingdataforsearch =>
      throw _privateConstructorUsedError;
  @override
  List<MainData> get searchtrendingdata => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  bool get hasError => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SearchStateCopyWith<_$_SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}
