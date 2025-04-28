import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../data/model.dart';

part 'rickandmorty_event.dart';
part 'rickandmorty_state.dart';

class RickandmortyBloc extends Bloc<RickandmortyEvent, RickandmortyState> {
  RickandmortyBloc() : super(RickandmortyInitial()) {
    on<GetDataByRickAndMorty>((event, emit) async {
      emit(Loading());
      final dio = Dio();
      final response = await dio.get('https://rickandmortyapi.com/api/character');
      final list = response.data['results'] as List;
      final listRAM = list.map((e) => Model.fromJson(e)).toList();
      emit(Success(listRAM));
    });
  }
}
