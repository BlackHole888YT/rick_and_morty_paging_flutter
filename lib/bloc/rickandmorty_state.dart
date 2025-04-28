part of 'rickandmorty_bloc.dart';

@immutable
sealed class RickandmortyState {}

final class RickandmortyInitial extends RickandmortyState {}

final class Loading extends RickandmortyState {
  final List<Model> oldItems;
  final bool isFirstFetch;

  Loading({this.oldItems = const [], this.isFirstFetch = false});
}

final class Error extends RickandmortyState {
  final String message;

  Error(this.message);
}

final class Success extends RickandmortyState {
  final List<Model> items;
  final bool hasReachedEnd;

  Success({
    required this.items,
    this.hasReachedEnd = false,
  });
}