part of 'rickandmorty_bloc.dart';

@immutable
sealed class RickandmortyState {}

final class RickandmortyInitial extends RickandmortyState {}

final class Loading extends RickandmortyState {}

final class Error extends RickandmortyState {}

final class Success extends RickandmortyState {
  final List<Model> list;

  Success(this.list);
}