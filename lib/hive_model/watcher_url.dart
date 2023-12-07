import 'package:hive/hive.dart';

part 'watcher_url.g.dart';

@HiveType(typeId: 1)
class WatcherUrl {
  WatcherUrl({
    required this.name,
    required this.url,
    required this.service,
    required this.active,
  });

  @HiveField(0)
  late String name;

  @HiveField(1)
  late String url;

  @HiveField(2)
  late int service;

  @HiveField(3)
  late bool active;
}
