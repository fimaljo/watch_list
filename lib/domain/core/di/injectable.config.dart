// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/HomePage/homepagedata_bloc.dart' as _i7;
import '../../../application/overView/overview_bloc.dart' as _i8;
import '../../../application/search/search_bloc.dart' as _i9;
import '../../../infrastructure/homedata/home_data_repository.dart' as _i4;
import '../../../infrastructure/search/searchrepo.dart' as _i6;
import '../../homepage/models/dataservice.dart' as _i3;
import '../../search/search_service.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.SearchService>(() => _i4.HomeDataRepository());
  gh.lazySingleton<_i5.SearchServicemvi>(() => _i6.SearchImpl());
  gh.factory<_i7.HomepagedataBloc>(
      () => _i7.HomepagedataBloc(get<_i3.SearchService>()));
  gh.factory<_i8.OverviewBloc>(
      () => _i8.OverviewBloc(get<_i3.SearchService>()));
  gh.factory<_i9.SearchBloc>(() =>
      _i9.SearchBloc(get<_i5.SearchServicemvi>(), get<_i3.SearchService>()));
  return get;
}
