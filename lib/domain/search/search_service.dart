import 'package:dartz/dartz.dart';
import 'package:watch_list/domain/core/failures/failures.dart';
import 'package:watch_list/domain/homepage/models/homedata.dart';

abstract class SearchServicemvi {
  Future<Either<MainFailure, Homedata>> searchMovies({
    required String moviQuery,
  });
}
