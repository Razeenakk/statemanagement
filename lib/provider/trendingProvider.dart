import 'package:flutter/cupertino.dart';
import 'package:provider_ex/repository/TrendingMoviesModel.dart';
import 'package:provider_ex/repository/api/MoviesApi.dart';

class TrendingProvider with ChangeNotifier{
 TrendingMoviesModel trendingMoviesModel = TrendingMoviesModel();

 MoviesApi moviesApi = MoviesApi();

 bool loading = false;

 getTrendingMovieData(context) async{
   loading = true;
   trendingMoviesModel = await moviesApi.getTrendingMovies();
   loading = false;

   notifyListeners();
 }

}