import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:watch_list/domain/core/failures/failures.dart';
import 'package:watch_list/domain/homepage/models/dataservice.dart';
import 'package:watch_list/domain/homepage/models/homedata.dart';

part 'homepagedata_event.dart';
part 'homepagedata_state.dart';
part 'homepagedata_bloc.freezed.dart';

@injectable
class HomepagedataBloc extends Bloc<HomepagedataEvent, HomepagedataState> {
  final SearchService _homedataRespo;
  HomepagedataBloc(this._homedataRespo) : super(HomepagedataState.inital()) {
    on<_GetTrendingImage>((event, emit) async {
      emit(const HomepagedataState(
        hasError: false,
        isLoading: true,
        trendingdata: [],
      ));
      final _result = await _homedataRespo.getHotAndNewMovieData();
      log(_result.toString());
      final _newState = _result.fold(
        (MainFailure failure) {
          return const HomepagedataState(
            trendingdata: [],
            isLoading: false,
            hasError: true,
          );
        },
        (Homedata resp) {
          return HomepagedataState(
            trendingdata: resp.results,
            isLoading: false,
            hasError: false,
          );
        },
      );
      emit(_newState);
    });
  }
}
