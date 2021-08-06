import 'package:movies_cubit_app/data/models/movie_model.dart';
abstract class IMoviesRepository{

  Future<List<MovieModel>> getMovies();

}