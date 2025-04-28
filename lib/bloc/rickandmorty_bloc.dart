import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../data/model.dart';

part 'rickandmorty_event.dart';
part 'rickandmorty_state.dart';

class RickandmortyBloc extends Bloc<RickandmortyEvent, RickandmortyState> {
  RickandmortyBloc() : super(RickandmortyInitial()) {
    on<GetDataByRickAndMorty>((event, emit) async {
      try {
        if (state is Success) {
          final currentState = state as Success;
          if (currentState.hasReachedEnd) return;
          emit(Loading(oldItems: currentState.items));
        } else {
          emit(Loading(isFirstFetch: true));
        }

        final dio = Dio();
        final response = await dio.get(
          'https://rickandmortyapi.com/api/character',
          queryParameters: {'page': event.page},
        );

        final data = response.data;
        final results = data['results'] as List;
        final info = data['info'] as Map<String, dynamic>;
        final nextPage = info['next'];

        final newItems = results.map((e) => Model.fromJson(e)).toList();

        if (state is Loading) {
          final currentState = state as Loading;
          final updatedItems = [...currentState.oldItems, ...newItems];
          
          emit(Success(
            items: updatedItems,
            hasReachedEnd: nextPage == null,
          ));
        }
      } catch (e) {
        emit(Error(e.toString()));
      }
    });
  }
}
