import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:watch_list/domain/core/endpoints.dart';
import 'package:watch_list/domain/core/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:watch_list/domain/homepage/models/dataservice.dart';
import 'package:watch_list/domain/homepage/models/homedata.dart';

@LazySingleton(as: SearchService)
class HomeDataRepository implements SearchService {
  @override
  Future<Either<MainFailure, Homedata>> getHotAndNewMovieData() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.downloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = Homedata.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
