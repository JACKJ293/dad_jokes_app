import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/joke_viewmodel.dart';
import 'views/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => JokeViewModel(),
      child: MaterialApp(
        title: 'Dad Jokes App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeView(),
      ),
    );
  }
}
