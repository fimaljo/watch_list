import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watch_list/main.dart';

import '../../domain/watchlist/models/watchlist.dart';

part 'wachlist_state.dart';

class WachlistCubit extends Cubit<WachlistState> {
  WachlistCubit() : super(WachlistState(wachLists: dbBox.values.toList()));
  void addToList(WatchList wachListData) {
    dbBox.add(wachListData);
    return emit(WachlistState(wachLists: dbBox.values.toList()));
  }

  void deleteList(int idx) {
    final keys = dbBox.keys;
    final wachKey = keys.elementAt(idx);
    dbBox.delete(wachKey);
    return emit(WachlistState(wachLists: dbBox.values.toList()));
  }
}
