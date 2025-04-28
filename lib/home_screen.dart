import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_paging_flutter/bloc/rickandmorty_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final bloc = RickandmortyBloc()..add(GetDataByRickAndMorty());
    return SafeArea(child: Scaffold(
      body: BlocBuilder(
          bloc: bloc,
          builder: (context, state){
            if (state is Success){
              final list = state.list;
              return Column(
                children: [Expanded(
                    child: ListView.builder(
                        itemCount: list.length + 1,
                        itemBuilder: (context, index){
                            return Row(children: [
                              Image.network(
                                list[index].image,
                                height: 400,
                                width: 400,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    list[index].name,
                                    style: TextStyle(fontSize: 40),
                                  ),
                                  Text(
                                    "Status: ${list[index].status}",
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ],)
                            ],);
                        })
                )],
              );
            }else{
              return Center(child: CircularProgressIndicator(),);
            }
          }
      ),
    ));
  }
}

