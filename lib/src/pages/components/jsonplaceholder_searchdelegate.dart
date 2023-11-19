import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ToDo {
  int id;
  String title;
  bool completed;

  ToDo({
    required this.id,
    required this.title,
    required this.completed,
  });

  factory ToDo.fromJson(Map<String, dynamic> json) => ToDo(
        id: json['id'],
        title: json['title'],
        completed: json['completed'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'completed': completed,
      };
}

class ToDoSearchDelegate extends SearchDelegate<ToDo?> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<ToDo>>(
      future: _search(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data![index].title),
                onTap: () {
                  close(context, snapshot.data![index]);
                },
              );
            },
            itemCount: snapshot.data!.length,
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

  Future<List<ToDo>> _search() async {
    final authority = 'jsonplaceholder.typicode.com';
    final path = 'todos';
    final queryParameters = <String, String>{'title': query};
    final uri = Uri.https(authority, path, queryParameters);
    final result = await http.get(uri);
    final list = json.decode(result.body) as List;
    return list.map((e) => ToDo.fromJson(e)).toList();
  }
}
