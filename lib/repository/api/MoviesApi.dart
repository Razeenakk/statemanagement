import 'dart:convert';


import 'package:http/http.dart';
import 'package:provider_ex/repository/TrendingMoviesModel.dart';
import 'package:provider_ex/repository/api/api_client.dart';

class MoviesApi{


ApiClient apiClient = ApiClient();
String trendingpath = 'trending/movie/day';


Future<TrendingMoviesModel> getTrendingMovies() async {



    Response response = await apiClient.invokeAPI(trendingpath, 'GET', null);

    return TrendingMoviesModel.fromJson(jsonDecode(response.body));


}


}