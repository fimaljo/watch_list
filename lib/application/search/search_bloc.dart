import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:watch_list/application/search/search_state.dart';
import 'package:watch_list/domain/core/failures/failures.dart';
import 'package:watch_list/domain/homepage/models/homedata.dart';
import 'package:watch_list/domain/search/search_service.dart';

import '../../domain/homepage/models/dataservice.dart';

part 'search_event.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchServicemvi searchServiceforsearch;
  final SearchService _homedataRespoforsearch;
  SearchBloc(this.searchServiceforsearch, this._homedataRespoforsearch)
      : super(SearchState.inital()) {
    on<_Initialize>((event, emit) async {
      if (state.trendingdataforsearch.isNotEmpty) {
        emit(SearchState(
          trendingdataforsearch: state.trendingdataforsearch,
          searchtrendingdata: [],
          isLoading: false,
          hasError: false,
        ));
        return;
      }
      emit(const SearchState(
        trendingdataforsearch: [],
        searchtrendingdata: [],
        isLoading: true,
        hasError: false,
      ));
      final _result = await _homedataRespoforsearch.getHotAndNewMovieData();
      final _state = _result.fold((MainFailure left) {
        return const SearchState(
            trendingdataforsearch: [],
            searchtrendingdata: [],
            isLoading: false,
            hasError: true);
      }, (Homedata right) {
        return SearchState(
            trendingdataforsearch: right.results,
            searchtrendingdata: [],
            isLoading: false,
            hasError: false);
      });
      emit(_state);
    });
    on<_SearchMovie>((event, emit) async {
      emit(const SearchState(
          trendingdataforsearch: [],
          searchtrendingdata: [],
          isLoading: true,
          hasError: false));
      final _result = await searchServiceforsearch.searchMovies(
          moviQuery: event.movieQuery);
      final _newstate = _result.fold((MainFailure faileur) {
        return const SearchState(
            trendingdataforsearch: [],
            searchtrendingdata: [],
            isLoading: false,
            hasError: true);
      }, (Homedata right) {
        return SearchState(
            trendingdataforsearch: [],
            searchtrendingdata: right.results,
            isLoading: false,
            hasError: true);
      });
      emit(_newstate);
    });
  }
}
