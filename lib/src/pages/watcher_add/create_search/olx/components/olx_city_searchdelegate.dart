import 'package:flutter/material.dart';
import 'package:olx_bot/services/api/olx/olx_api_service.dart';
import 'package:olx_bot/services/api/olx/types/location_types.dart';

class OlxCitySearchDelegate extends SearchDelegate<OlxLocationSuggestion?> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[];
  }

  @override
  String get searchFieldLabel => "Lokalizacja";

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<OlxLocationSuggestion>>(
      future: _search(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.location_city_rounded),
                title: Text(snapshot.data![index].city.name),
                subtitle: Text(snapshot.data![index].region.name),
                onTap: () {
                  close(context, snapshot.data![index]);
                },
              );
            },
            itemCount: snapshot.data!.length,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

  Future<List<OlxLocationSuggestion>> _search() async {
    final locations = await OlxApiService().getLocationSuggestions(query);

    final list = locations.data;

    return list;
  }
}
