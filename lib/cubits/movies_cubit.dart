import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_cubit_app/cubits/movies_state.dart';
import 'package:movies_cubit_app/data/repositories/movies_repositories.dart';

// 
// Cubit perform logic 
//such as getting the trending movies from the MovieRepository 
//and emit states. We use Cubit's emit method to emit new states.
// 

class MoviesCubit extends Cubit<MoviesState> {

  // adding the MovieRepository dependency to this class 
  final MovieRepository repository;

  // Passing the InitialState to the super constructor.
  //This makes it, surprisingly, to be an initialstate and this is what the UI will operate with initially.
  MoviesCubit({required this.repository}) : super(MovieInitialState()) {
    getTrendingMovies();
  }

  //implementing a getTrendingMovies method.
  void getTrendingMovies() async {
    try {
      emit(MovieLoadingState());
      final movies = await repository.getMovies();
      emit(MovieLoadedState(movies));
    } catch (e) {
      emit(MovieErrorState());
    }
  }
}
