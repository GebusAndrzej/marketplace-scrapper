import 'dart:developer';

import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/material.dart';
import 'package:olx_bot/backgroundServices/notification_service.dart';
import 'package:olx_bot/services/store/watcher_url_store_service.dart';
import 'package:olx_bot/src/pages/watcher_add/watcher_add.dart';

class WatchersList extends StatefulWidget {
  WatchersList();

  @override
  _WatchersListState createState() => _WatchersListState();
}

class _WatchersListState extends State<WatchersList> {
  _WatchersListState() {
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    int status = await BackgroundFetch.configure(
      BackgroundFetchConfig(
        minimumFetchInterval: 15,
        stopOnTerminate: false,
        enableHeadless: true,
        requiresBatteryNotLow: false,
        requiresCharging: false,
        requiresStorageNotLow: false,
        requiresDeviceIdle: false,
        requiredNetworkType: NetworkType.NONE,
      ),
      (String taskId) async {
        // <-- Event handler
        // This is the fetch-event callback.
        print("[BackgroundFetch] Event received $taskId");
        NotificationService().showNotification();

        final watchers =
            WatcherUrlStore().getWatchers().where((element) => element.active);
        print("[BackgroundFetch] iterating trough watchers, fount active:");
        inspect(watchers);

        // IMPORTANT:  You must signal completion of your task or the OS can punish your app
        // for taking too long in the background.
        BackgroundFetch.finish(taskId);
      },
      (String taskId) async {
        // Task timeout
        print("[BackgroundFetch] TASK TIMEOUT taskId: $taskId");
        BackgroundFetch.finish(taskId);
      },
    );

    print('[BackgroundFetch] configure success: $status');
    if (!mounted) return;
  }

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
            subtitle: Text(watcher.active.toString()),
            onTap: () {
              inspect(watcher);
            },
            leading: const Icon(Icons.shopping_bag_outlined),
            trailing: PopupMenuButton(
              icon: const Icon(Icons.more_horiz),
              itemBuilder: (context) => [
                PopupMenuItem(
                    onTap: () {
                      // TODO
                    },
                    child: const Text('remove'))
              ],
            ),
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
