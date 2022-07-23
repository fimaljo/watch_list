part of 'homepagedata_bloc.dart';

@freezed
class HomepagedataState with _$HomepagedataState {
  const factory HomepagedataState({
    required List<MainData> trendingdata,
    required bool isLoading,
    required bool hasError,
  }) = _HomepagedataState;

  factory HomepagedataState.inital() {
    return const HomepagedataState(
      isLoading: false,
      hasError: false,
      trendingdata: [],
    );
  }
}
