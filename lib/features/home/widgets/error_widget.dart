
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/exception/internet_exception.dart';
import '../../../l10n/app_localizations.dart';
import '../movies_bloc/movie_events.dart';
import '../movies_bloc/movies_bloc.dart';
import '../movies_bloc/movies_state.dart'; 

class MoviesErrorWidget extends StatelessWidget {
  const MoviesErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) => previous.moviesList != current.moviesList,
      builder: (context, state) {
        if (state.moviesList.message.toString() == AppLocalizations.of(context)!.noInternetConnection) {
          return InterNetExceptionWidget(onPress: () {
            context.read<MoviesBloc>().add(MoviesFetch());
          });
        } else {
          return InkWell(
            onTap: () {
              context.read<MoviesBloc>().add(MoviesFetch());
            },
            child: Center(
              child: Text(state.moviesList.message.toString()),
            ),
          );
        }
      },
    );
  }
}
