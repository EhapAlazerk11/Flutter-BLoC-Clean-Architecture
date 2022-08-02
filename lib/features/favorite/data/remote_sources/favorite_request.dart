import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:base_flutter/base/common_utils/log_utils.dart';
import 'package:base_flutter/config/dependency_injection/dependency_injection.dart';
import 'package:base_flutter/features/favorite/data/model/favorite_model.dart';
import 'package:base_flutter/network/api/network_api.dart';
import 'package:base_flutter/network/network_request.dart';
import 'package:base_flutter/network/newtork_utails.dart';
import 'package:injectable/injectable.dart';

typedef FavoritesRemoteResponse = Either<String, FavoritesList>;

abstract class FavoriteRequest {
  Future<FavoritesRemoteResponse> getFavoriteList();
}

@Injectable(as: FavoriteRequest)
class FavoriteRequestImp implements FavoriteRequest {
  @override
  Future<FavoritesRemoteResponse> getFavoriteList() async {
    FavoritesRemoteResponse favoritesRemoteResponse = left("");
    Log.e("Inside Favorite Request");
    await getIt<NetworkRequest>().requestFutureData<FavoriteDataBean>(
      Method.post,
      options: Options(
        headers: {
          HttpHeaders.authorizationHeader:
              '106|U11g8PXtRqCfoYDVIVFzE9yu1qTlSQ6SjfvEqN9J'
        },
      ),
      url: Api.favorite,
      onSuccess: (data) {
        Log.e("Print Favorite --${data.message}");
        favoritesRemoteResponse = right(data.data);
      },
      onError: (code, msg) {
        Log.e("Print Favorite Error $msg");
        favoritesRemoteResponse = left(msg);
      },
    );
    return favoritesRemoteResponse;
  }
}
