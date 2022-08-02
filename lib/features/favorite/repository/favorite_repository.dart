
import 'package:base_flutter/features/favorite/data/remote_sources/favorite_request.dart';

abstract class FavoriteRepository {
   Future<FavoritesRemoteResponse> getAllFavorites () ;
}
