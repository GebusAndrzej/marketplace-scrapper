import 'package:flutter/material.dart';
import 'package:olx_bot/services/api/olx/olx_api_service.dart';
import 'package:olx_bot/services/api/olx/types/category_types.dart';

class OlxCategorySearchDelegate extends SearchDelegate<OlxCategorySearch?> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[];
  }

  @override
  String get searchFieldLabel => "Kategoria";

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
    return FutureBuilder<List<OlxCategorySearch>>(
      future: _search(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
            itemBuilder: (context, index) {
              var location = snapshot.data![index];
              var decodedPath = Uri.decodeFull(location.href)
                  .substring(1)
                  .replaceAll(RegExp('/q-.*'), '')
                  .replaceAll('/', '/');

              return ListTile(
                leading: const Icon(Icons.category_rounded),
                title: Text(location.similarSearch),
                subtitle: Text(decodedPath),
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

  Future<List<OlxCategorySearch>> _search() async {
    final locations = await OlxApiService().searchCategories(query);

    final list = locations.data.searches;

    return list;
  }
}
