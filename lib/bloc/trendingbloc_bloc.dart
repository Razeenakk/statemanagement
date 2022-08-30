import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:provider_ex/repository/TrendingMoviesModel.dart';
import 'package:provider_ex/repository/api/MoviesApi.dart';

part 'trendingbloc_event.dart';
part 'trendingbloc_state.dart';

class TrendingblocBloc extends Bloc<TrendingblocEvent, TrendingblocState> {
late  TrendingMoviesModel trendingMoviesModel;
MoviesApi moviesApi;
  TrendingblocBloc(this.moviesApi) : super(TrendingblocInitial()) {
    //THIS IS A CONSTRUCTOR
    on<TrendingblocEvent>((event, emit) async {
      emit(TrendingblocLoading());
      try{


        trendingMoviesModel = await moviesApi.getTrendingMovies();
        emit(TrendingblocLoaded());
      } catch(e){
        emit(TrendingblocError());
      }



      // TODO: implement event handler
    });
  }


}
