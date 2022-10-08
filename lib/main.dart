import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/services_locator.dart';
import 'package:movies_app/core/utils/app_string.dart';



import 'core/network/dio_helper.dart';
import 'core/theme/theme_data/dark_theme_data.dart';
import 'movies/presentation/controller/movies_bloc.dart';
import 'movies/presentation/controller/movies_events.dart';
import 'movies/presentation/screens/movies_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.inti();
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) =>sl<MovieBloc>()..add(GetNowPlaying())..add(GetPopularMoives())..add(GetTopMoives()),), 
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppString.appTitle,
        scrollBehavior: MyCustomScrollBehavior(),
       
        darkTheme: AppDarkTheme.darkThemeData,
        themeMode: ThemeMode.dark,
        home:const SafeArea(
          child:  Scaffold(
              body: MainMoviesScreen(),
            ),
        ),
       
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

