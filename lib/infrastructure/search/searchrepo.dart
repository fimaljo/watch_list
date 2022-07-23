import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:watch_list/domain/core/endpoints.dart';
import 'package:watch_list/domain/core/failures/failures.dart';
import 'package:watch_list/domain/homepage/models/homedata.dart';
import 'package:watch_list/domain/search/search_service.dart';

@LazySingleton(as: SearchServicemvi)
class SearchImpl implements SearchServicemvi {
  @override
  Future<Either<MainFailure, Homedata>> searchMovies(
      {required String moviQuery}) async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.search,
        queryParameters: {
          'query': moviQuery,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = Homedata.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
