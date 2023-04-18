import 'package:flutter/material.dart';
import '../models/joke.dart';

class JokeImageView extends StatelessWidget {
    final Joke? joke;
    JokeImageView({required this.joke});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dad Joke as Image'),
      ),
      body: Center(
        child: joke != null
            ? Image.network(
                'https://icanhazdadjoke.com/j/${joke!.id}.png',
                fit: BoxFit.cover,
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
