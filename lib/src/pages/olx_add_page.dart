import 'package:flutter/material.dart';
import 'package:olx_bot/services/api/olx/types.dart';
import 'package:olx_bot/src/pages/components/olx_city_searchdelegate.dart';

class OlxAddPage extends StatefulWidget {
  const OlxAddPage({super.key});

  @override
  State<OlxAddPage> createState() => _OlxAddPageState();
}

class _OlxAddPageState extends State<OlxAddPage> {
  _OlxAddPageState();

  OlxLocationSuggestion? location;
  TextEditingController cityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add new filter"),
        ),
        body: Form(
            key: _formKey,
            child: ListView(
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
                        setState(() {
                          this.location = location;
                        });

                        cityController.text = location.city.name;
                      }
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
                if (location != null) Text('city: ${location?.city.id}'),
                if (location != null)
                  Text('city: ${location?.city.normalizedName}'),
                if (location != null) Text('region: ${location?.region.id}'),
                if (location != null)
                  Text('region: ${location?.region.normalizedName}'),
              ],
            )));
  }
}
