import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';


import '../../../core/utils/app_constance.dart';
import '../../../core/utils/enums.dart';
import '../controller/movies_bloc.dart';
import '../controller/movies_states.dart';
import '../screens/movie_detail_screen.dart';

class GetTopMoviesgWidget extends StatelessWidget {
  const GetTopMoviesgWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: (previous, current) => previous.topState!=current.topState,
      builder: (context,state) {
        
        return state.topState==RequestState.loading?
        Container(
          height: 170,
          alignment: Alignment.center,
          child:const CircularProgressIndicator(),
        ):
        state.topState==RequestState.erorr?
        Container(
          height: 170,
          alignment: Alignment.center,
          child: Text(state.topMessege),
        )
        :
        FadeIn(
          duration: const Duration(milliseconds: 500),
          child: SizedBox(
            height: 170.0,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount:state.topMovies.length,
              itemBuilder: (context, index) {
                final movie = state.topMovies[index];
                return Container(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: InkWell(
                    onTap: () {
                      
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailScreen(id: movie.id,),));
                    },
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                      child: CachedNetworkImage(
                        width: 120.0,
                        fit: BoxFit.cover,
                        imageUrl: AppConstant.imageUrl(movie.backdropPath),
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey[850]!,
                          highlightColor: Colors.grey[800]!,
                          child: Container(
                            height: 170.0,
                            width: 120.0,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      }
    );
  }
}
