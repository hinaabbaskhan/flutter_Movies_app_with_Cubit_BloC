import 'package:dio/dio.dart';
import '../models/movie_model.dart';
import '../repositories/movies_repository_interface.dart';

class MovieRepository implements IMoviesRepository{
  const MovieRepository(this.client);

  final Dio client;

  @override
  Future<List<MovieModel>> getMovies() async {
    try {
      final url =
          'https://api.themoviedb.org/3/trending/movie/week?api_key=060e7c76aff06a20ca4a875981216f3f';

      final response = await client.get(url);
      final movies = List<MovieModel>.of(
        response.data['results'].map<MovieModel>(
          (json) => MovieModel.fromJson(json),
        ),
      );
      return movies;
    } catch (e) {
      throw e;
    }
  }
}



      // List<MovieModel> movies=[];
      //   var list = response.data['results'] as List;
      //  movies = list.map((movie) => MovieModel.fromJson(movie))
      //   .toList();
      
      
      // final movies = List<MovieModel>.of(
      //   response.data['results'].map<MovieModel>(
      //     (json) => MovieModel(
      //       title: json['title'],
      //       urlImage: 'https://image.tmdb.org/t/p/w185${json['poster_path']}',
      //     ),
          
      //   ),
      // );