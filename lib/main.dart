import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/material.dart';
import 'package:olx_bot/backgroundServices/olx_service.dart';
import 'package:olx_bot/src/pages/service_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
      home: ServiceTest(),
    );
  }
}
