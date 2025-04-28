part of 'rickandmorty_bloc.dart';

@immutable
sealed class RickandmortyEvent {}

class GetDataByRickAndMorty extends RickandmortyEvent {
  final int page;

  GetDataByRickAndMorty({this.page = 1});
}
