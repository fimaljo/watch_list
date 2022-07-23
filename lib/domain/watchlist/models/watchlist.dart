import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
part 'watchlist.g.dart';

@HiveType(typeId: 0)
class WatchList extends HiveObject {
  @HiveField(0)
  late String movieimage;

  @HiveField(1)
  late String moviename;

  @HiveField(2)
  late String movierating;
  WatchList({
    required this.movieimage,
    required this.moviename,
    required this.movierating,
  });
}
