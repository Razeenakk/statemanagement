import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_ex/bloc/trendingbloc_bloc.dart';
import 'package:provider_ex/repository/TrendingMoviesModel.dart';

class BlocPage extends StatefulWidget {
  const BlocPage({Key? key}) : super(key: key);

  @override
  State<BlocPage> createState() => _BlocPageState();
}

class _BlocPageState extends State<BlocPage> {
  final imagepathurl = 'https://image.tmdb.org/t/p/w185';
  late TrendingMoviesModel trendingMoviesModel;

  @override
  void initState() {
    BlocProvider.of<TrendingblocBloc>(context).add(FetchTrending());
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("blocpage"),
        actions: [
          IconButton(onPressed: () {

          }, icon: Icon(Icons.refresh))
        ],
      ),
      body: BlocBuilder<TrendingblocBloc, TrendingblocState>(
        builder: (context, state) {
          if(state is TrendingblocLoaded){
            trendingMoviesModel = BlocProvider.of<TrendingblocBloc>(context).trendingMoviesModel;
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: .65,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20
                ),
                itemCount: trendingMoviesModel.results!.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(imagepathurl + trendingMoviesModel.results![index].posterPath
                                .toString())
                        )
                    ),
                  );
                });
          }
          if(state is TrendingblocLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),

      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.


      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
