import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/utils/app_string.dart';
import 'package:movies_app/movies/presentation/components/get_popular_moives_widget.dart';



import '../components/get_now_playing_widget.dart';
import '../components/get_top_moives_widget.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return SingleChildScrollView(
        key: const Key('movieScrollView'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GetNowPlayingWidget(),
            dataRow(
              AppString.popular,
              () {
                // ignore: todo
                /// TODO : NAVIGATION TO POPULAR SCREEN
              },
            ),
            const GetPopularMoviesgWidget(),
            dataRow(
              AppString.topRated,
              () {
                // ignore: todo
                /// TODO : NAVIGATION TO Top Rated SCREEN
              },
            ),
            const GetTopMoviesgWidget(),
            const SizedBox(height: 50.0),
          ],
        ),
      );
    
  }

  Widget dataRow(String title, Function onTap) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 19,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.15,
            ),
          ),
          if(1+1==3)
          InkWell(
            onTap: () {
              onTap();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Text(AppString.seeMore),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16.0,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
