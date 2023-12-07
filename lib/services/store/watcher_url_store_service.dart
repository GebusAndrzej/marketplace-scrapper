import 'package:hive_flutter/hive_flutter.dart';
import 'package:olx_bot/hive_model/watcher_url.dart';

class WatcherUrlStore {
  static final WatcherUrlStore _singleton = WatcherUrlStore._internal();
  late Box box;

  factory WatcherUrlStore() {
    return _singleton;
  }

  WatcherUrlStore._internal() {
    box = Hive.box('watchersBox');
  }

  List<WatcherUrl> getWatchers() {
    return List.from(box.toMap().values);
  }

  createWatcher(WatcherUrl watcher) {
    box.put(watcher.name, watcher);
    print('watcher put to box');
    return true;
  }
}
