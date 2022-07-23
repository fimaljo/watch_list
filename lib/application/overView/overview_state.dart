part of 'overview_bloc.dart';

@freezed
class OverviewState with _$OverviewState {
  const factory OverviewState({
    required List<MainData> trendingdata,
    required bool isLoading,
    required bool hasError,
  }) = _OverviewState;

  factory OverviewState.inital() {
    return const OverviewState(
      isLoading: false,
      hasError: false,
      trendingdata: [],
    );
  }
}
