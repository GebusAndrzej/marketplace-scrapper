import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:olx_bot/backgroundServices/olx_service.dart';
import 'package:olx_bot/hive_model/watcher_url.dart';
import 'src/pages/watchers_list/watchers_list.dart';

Future main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();

  Hive.registerAdapter(WatcherUrlAdapter());
  await Hive.openBox('watchersBox');

  runApp(const App());

  BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const HomePage(title: 'Flutter Demo Home Page'),
      home: WatchersList(),
    );
  }
}
