
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/res/components/network_image_widget.dart';
import '../../../core/res/constants/enums.dart';
import '../../../dependency_injection/dependency_injection.dart';
import '../../../l10n/app_localizations.dart';
import '../movies_bloc/movie_events.dart';
import '../movies_bloc/movies_bloc.dart';
import '../movies_bloc/movies_state.dart';
import '../widgets/error_widget.dart';
import '../widgets/logout_button_widget.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _HomeViewState();
}
class _HomeViewState extends State<MoviesScreen> {
  late MoviesBloc moviesBloc;
  @override
  void initState() {
    super.initState();
    moviesBloc = MoviesBloc(moviesApiRepository: getIt());
  }
  @override
  void dispose() {
    moviesBloc.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(AppLocalizations.of(context)!.popularShows),
        actions: const [
          LogoutButtonWidget(), 
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: BlocProvider(
        create: (_) => moviesBloc..add(MoviesFetch()),
        child: BlocBuilder<MoviesBloc, MoviesState>(
          buildWhen: (previous, current) => previous.moviesList != current.moviesList,
       builder: (BuildContext context, state) {
           switch (state.moviesList.status) {
              case Status.loading:
                return const Center(child: CircularProgressIndicator());
              case Status.error:
                return const MoviesErrorWidget(); 
              case Status.completed:
                if (state.moviesList.data == null) {
                  return Text(AppLocalizations.of(context)!.noDataFound);
                }
                final movieList = state.moviesList.data!;

                return ListView.builder(
                    itemCount: movieList.tvShow.length,
                    itemBuilder: (context, index) {
                      final tvShow = movieList.tvShow[index];
                      return Card(
                        child: ListTile(
                          leading: NetworkImageWidget(
                            borderRadius: 5,
                            imageUrl: tvShow.imageThumbnailPath.toString(),
                          ), 
                          title: Text(tvShow.name.toString()), 
                          subtitle: Text(tvShow.network.toString()), 
                          trailing: Text(tvShow.status.toString()),
                        ),
                      );
                    });
              default:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
