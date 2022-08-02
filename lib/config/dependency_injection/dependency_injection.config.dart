// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/favorite/application/favorite_cubit.dart' as _i7;
import '../../features/favorite/data/remote_sources/favorite_request.dart'
    as _i3;
import '../../features/favorite/repository/favorite_repository.dart' as _i5;
import '../../features/favorite/repository/favorite_repository_imp.dart' as _i6;
import '../../network/network_request.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $registerDependencies(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.FavoriteRequest>(() => _i3.FavoriteRequestImp());
  gh.factory<_i4.NetworkRequest>(() => _i4.NetworkRequestImp());
  gh.factory<_i5.FavoriteRepository>(
      () => _i6.FavoriteRepositoryImp(get<_i3.FavoriteRequest>()));
  gh.factory<_i7.FavoriteCubit>(
      () => _i7.FavoriteCubit(get<_i5.FavoriteRepository>()));
  return get;
}
