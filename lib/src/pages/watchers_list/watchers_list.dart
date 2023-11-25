import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista"),
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
