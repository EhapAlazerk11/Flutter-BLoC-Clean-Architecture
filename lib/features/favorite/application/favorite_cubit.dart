import 'package:bloc/bloc.dart';
import 'package:base_flutter/features/favorite/data/model/favorite_model.dart';
import 'package:base_flutter/features/favorite/repository/favorite_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'favorite_state.dart';
@injectable
class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepository favoriteRepository ;
  bool isLoading = false;

  FavoriteCubit(this.favoriteRepository) : super(const FavoriteInitial());

  Future<void> getFavoritesData() async {
    emit(const FavoriteLoading());
    final response = await favoriteRepository.getAllFavorites() ;
    emit(response.fold(FavoriteFailure.new,FavoriteLoaded.new));
  }



}
