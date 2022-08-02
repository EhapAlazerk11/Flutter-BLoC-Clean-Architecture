part of 'favorite_cubit.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {
  const FavoriteInitial();
}

class FavoriteLoading extends FavoriteState {
  const FavoriteLoading();
}

class FavoriteLoaded extends FavoriteState {
  final List<Favorite>? favorites;

  const FavoriteLoaded(this.favorites);
}

class FavoriteFailure extends FavoriteState {
  final String failureMessage;

  const FavoriteFailure(this.failureMessage);
}
