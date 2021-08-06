import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_cubit_app/cubits/movies_cubit.dart';
import 'package:movies_cubit_app/cubits/movies_state.dart';
import 'package:movies_cubit_app/utilities/constants.dart';
import 'package:movies_cubit_app/utilities/custom_colors.dart';
import 'package:movies_cubit_app/utilities/size_config.dart';

class MoviesScreen extends StatefulWidget {
  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trending Movies'),
        backgroundColor: Colors.deepOrange[500],
        toolbarHeight: 100, // default is 56
      ),
      //We need to connect widgets to the states emitted by the MoviesCubit using a BlocBuilder. //Check the type of the incoming state and return widgets accordingly.
      body: BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, state) {
          if (state is MovieLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MovieErrorState) {
            return Center(
              child: Icon(Icons.close),
            );
          } else if (state is MovieLoadedState) {
            final movies = state.movies;
            // return ListView.builder(
            //   itemCount: movies.length,
            //   itemBuilder: (context, index) => Card(
            //     child: ListTile(
            //       title: Text(movies[index].title!),
            //       leading: CircleAvatar(
            //         backgroundImage: NetworkImage(movies[index].urlImage!),
            //       ),
            //     ),
            //   ),
            // );
            return GridView.builder(
              itemCount: movies.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: whitish,
                  elevation: 0,
                  shape:kCardShap,
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.network(
                          movies[index].urlImage!,
                          height: SizeConfig.convertHeight(context, 70),
                          width: SizeConfig.convertHeight(context, 70),
                          fit: BoxFit.cover,
                        ),
                        ListTile(
                          title:Text(
                           movies[index].title!,
                            textAlign:TextAlign.center,
                            style: kTitleTextStyle,
                          ),
                          subtitle:Text(
                            movies[index].release_date!,
                            textAlign:TextAlign.center,
                            style: ksubtitleTextStyle
                          ),
                        ),
                      ],
                    ),
                  );
              });
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
