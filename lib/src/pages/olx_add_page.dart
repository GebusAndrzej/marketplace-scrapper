import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:olx_bot/services/api/olx/olx_api_service.dart';
import 'package:olx_bot/services/api/olx/types.dart';

class OlxAddPage extends StatefulWidget {
  const OlxAddPage({super.key});

  @override
  State<OlxAddPage> createState() => _OlxAddPageState();
}

class _OlxAddPageState extends State<OlxAddPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const HomePage(title: 'Flutter Demo Home Page'),
      home: ListView(
        children: [
          ElevatedButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: MySearchDelegate(),
                );
              },
              child: Text('Search'))
        ],
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
        icon: const Icon(Icons.close),
      ),
      // IconButton(
      //   onPressed: () {
      //     close(context, null);
      //   },
      //   icon: const Icon(Icons.arrow_back),
      // )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Icon(Icons.location_city_rounded);
  }

  @override
  Widget buildResults(BuildContext context) {
    print("buildResults");
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SuggestionList2(
      query: query,
    );
  }
}

// List

class SuggestionList2 extends StatefulWidget {
  String query;

  SuggestionList2({required this.query, super.key});

  @override
  State<SuggestionList2> createState() => _SuggestionList2State(query);
}

class _SuggestionList2State extends State<SuggestionList2> {
  List<OlxLocationSuggestion> suggestions = [];

  _SuggestionList2State(String query) {
    search(query);
  }

  search(String query) async {
    try {
      var result = await OlxApiService().getLocationSuggestions(query);

      setState(() {
        suggestions = result.data;
      });
    } catch (e) {
      inspect(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (contex, index) {
        final suggestion = suggestions[index];

        return ListTile(
          title: Text(suggestion.city.normalizedName),
          onTap: () {},
        );
      },
    );
  }
}
