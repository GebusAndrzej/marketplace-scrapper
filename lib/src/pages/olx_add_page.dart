import 'package:flutter/material.dart';
import 'package:olx_bot/services/api/olx/types.dart';
import 'package:olx_bot/src/pages/components/olx_city_searchdelegate.dart';

class OlxAddPage extends StatefulWidget {
  const OlxAddPage({super.key});

  @override
  State<OlxAddPage> createState() => _OlxAddPageState();
}

class _OlxAddPageState extends State<OlxAddPage> {
  late OlxLocationSuggestion city;

  TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.location_city_rounded),
            title: TextFormField(
              controller: cityController,
              readOnly: true,
              onTap: () async {
                final location = await showSearch(
                  context: context,
                  delegate: OlxCitySearchDelegate(),
                );

                if (location != null) {
                  cityController.text = location.city.name;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
