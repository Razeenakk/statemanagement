part of 'trendingbloc_bloc.dart';

@immutable
abstract class TrendingblocState {}

class TrendingblocInitial extends TrendingblocState {}
class TrendingblocLoading extends TrendingblocState {}
class TrendingblocLoaded extends TrendingblocState {}
class TrendingblocError extends TrendingblocState {}
