import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_cubit_app/cubits/movies_cubit.dart';
import 'package:movies_cubit_app/data/repositories/movies_repositories.dart';
import 'package:movies_cubit_app/ui/screen_movies.dart';
void main() {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //We first need to provide the MoviesCubit down the widget tree.  we'll do so by wrapping the MoviesScreen with a BlocProvider.
      home: BlocProvider<MoviesCubit>(
        create: (context) => MoviesCubit(repository: MovieRepository(Dio(),),),
        child: MoviesScreen(),
      ),
    );
  }
}
