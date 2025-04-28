import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_paging_flutter/bloc/rickandmorty_bloc.dart';
import 'package:rick_and_morty_paging_flutter/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: BlocProvider(
        create: (context) => RickandmortyBloc()..add(GetDataByRickAndMorty()),
        child: const HomeScreen(),
      ),
    ),
  );
}