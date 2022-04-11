import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_ex/provider/trendingProvider.dart';

void main() {
  runApp(MultiProvider(


      providers: [
        ChangeNotifierProvider<TrendingProvider>(create: (_) => TrendingProvider()),
      ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  void initState() {
    final trendingProvider = Provider.of<TrendingProvider>(context,listen: false);
    trendingProvider.getTrendingMovieData(context);
    // TODO: implement initState
    super.initState();
  }
 final imagepathurl = 'https://image.tmdb.org/t/p/w185';
  @override
  Widget build(BuildContext context) {

    final trendingProvider = Provider.of<TrendingProvider>(context);

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: [
          IconButton(onPressed: (){
            trendingProvider.getTrendingMovieData(context);
          }, icon: Icon(Icons.refresh))
        ],
      ),
      body:  trendingProvider.loading ? Center(
        child: Container(
            child: CircularProgressIndicator(),
          ),
      ): GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: .65,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20
      ),
          itemCount:trendingProvider.trendingMoviesModel.results!.length ,
          itemBuilder: (BuildContext ctx, index){
          return Container(
            decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imagepathurl+trendingProvider.trendingMoviesModel.results![index].posterPath.toString())
            )
            ),
          );

          }),

        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.


      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
