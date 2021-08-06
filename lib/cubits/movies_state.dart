import 'package:equatable/equatable.dart';
import 'package:movies_cubit_app/data/models/movie_model.dart';


// A rule of thumb is to always build out the state class(es) first.Without a proper representation of the state of the Cubit, we can't possibly write logic that will emit new states
abstract class MoviesState extends Equatable {
  const MoviesState();
}


// This MovieInitial state will indicate that no action has yet been taken by the user and that we should display an initial UI.
class MovieInitialState extends MoviesState {
  @override
  List<Object> get props => [];
}


// To be able to show a progress indicator while we're awaiting the data 
class MovieLoadingState extends MoviesState {
  @override
  List<Object> get props => [];
}


// To handle success 
class MovieLoadedState extends MoviesState {
  MovieLoadedState(this.movies);

  final List<MovieModel> movies;

  @override
  List<Object> get props => [movies];
}

// TO handle a possible error.
class MovieErrorState extends MoviesState {
  @override
  List<Object> get props => [];
}
