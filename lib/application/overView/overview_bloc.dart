import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:watch_list/domain/core/failures/failures.dart';
import 'package:watch_list/domain/homepage/models/dataservice.dart';
import 'package:watch_list/domain/homepage/models/homedata.dart';

part 'overview_event.dart';
part 'overview_state.dart';
part 'overview_bloc.freezed.dart';

@injectable
class OverviewBloc extends Bloc<OverviewEvent, OverviewState> {
  final SearchService _homedataRespo;
  OverviewBloc(this._homedataRespo) : super(OverviewState.inital()) {
    on<OverviewEvent>((event, emit) async {
      emit(const OverviewState(
        hasError: false,
        isLoading: true,
        trendingdata: [],
      ));
      final _result = await _homedataRespo.getHotAndNewMovieData();
      final _newState = _result.fold(
        (MainFailure failure) {
          return const OverviewState(
            trendingdata: [],
            isLoading: false,
            hasError: true,
          );
        },
        (Homedata resp) {
          return OverviewState(
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
