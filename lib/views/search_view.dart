import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/joke.dart';
import '../viewmodels/joke_viewmodel.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  String _searchTerm = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search for Dad Joke'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _searchTerm = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Search Term',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await context.read<JokeViewModel>().searchJokes(_searchTerm);
            },
            child: Text('Search'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: context.watch<JokeViewModel>().searchResults.length,
              itemBuilder: (context, index) {
                Joke joke =
                    context.watch<JokeViewModel>().searchResults[index];
                return ListTile(
                  title: Text(joke.id),
                  subtitle: Text(joke.joke),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Dad Joke'),
                          content: Text(joke.joke),
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
