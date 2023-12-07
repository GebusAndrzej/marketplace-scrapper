import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:olx_bot/services/store/watcher_url_store_service.dart';
import 'package:olx_bot/src/pages/watcher_add/watcher_add.dart';

class WatchersList extends StatefulWidget {
  WatchersList();

  @override
  _WatchersListState createState() => _WatchersListState();
}

class _WatchersListState extends State<WatchersList> {
  _WatchersListState();

  @override
  Widget build(BuildContext context) {
    final watchers = WatcherUrlStore().getWatchers();
    inspect(watchers);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista"),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: watchers.length,
        itemBuilder: (context, index) {
          final watcher = watchers[index];

          return ListTile(
            title: Text(watcher.name),
            onTap: () {
              inspect(watcher);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WatcherAdd()),
          );
        },
      ),
    );
  }
}
