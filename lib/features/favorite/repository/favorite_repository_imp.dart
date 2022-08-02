import 'package:base_flutter/features/favorite/data/model/favorite_model.dart';
import 'package:base_flutter/features/favorite/data/remote_sources/favorite_request.dart';
import 'package:base_flutter/features/favorite/repository/favorite_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FavoriteRepository)
class FavoriteRepositoryImp implements FavoriteRepository {
  final FavoriteRequest _favoriteRequest;

  const FavoriteRepositoryImp(this._favoriteRequest);

  @override
  Future<FavoritesRemoteResponse> getAllFavorites() async {
    return await _favoriteRequest.getFavoriteList();
  }
}
