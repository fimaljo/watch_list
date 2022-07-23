import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/homepage/models/homedata.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required List<MainData> trendingdataforsearch,
    required List<MainData> searchtrendingdata,
    required bool isLoading,
    required bool hasError,
  }) = _SearchState;

  factory SearchState.inital() {
    return const SearchState(
      isLoading: false,
      hasError: false,
      trendingdataforsearch: [],
      searchtrendingdata: [],
    );
  }
}
