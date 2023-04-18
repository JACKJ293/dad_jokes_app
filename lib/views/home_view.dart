import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/joke_viewmodel.dart';
import 'joke_image_view.dart';
import 'search_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dad Jokes App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                await context.read<JokeViewModel>().fetchRandomJoke();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Dad Joke'),
                      content: Text(
                          context.read<JokeViewModel>().randomJoke?.joke ?? ''),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Dad Joke as Text'),
            ),
            ElevatedButton(
              onPressed: () async {
                await context.read<JokeViewModel>().fetchRandomJoke();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => JokeImageView(
                      joke: context.read<JokeViewModel>().randomJoke,
                    ),
                  ),
                );
              },
              child: Text('Dad Joke as Image'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchView()),
                );
              },
              child: Text('Search for Dad Joke'),
            ),
          ],
        ),
      ),
    );
  }
}
