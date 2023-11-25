import 'package:flutter/material.dart';

import 'create_search/olx/olx_add_page.dart';

class WatcherAdd extends StatefulWidget {
  WatcherAdd();

  @override
  _WatcherAddState createState() => _WatcherAddState();
}

class _WatcherAddState extends State<WatcherAdd> {
  _WatcherAddState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wybierz usługę"),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          ListTile(
            title: ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: const Size(0, 60)),
              child: const Text("Olx"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OlxAddPage()),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
