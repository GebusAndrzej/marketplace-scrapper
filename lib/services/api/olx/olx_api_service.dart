import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:olx_bot/services/api/olx/types/category_types.dart';
import 'package:olx_bot/services/api/olx/types/location_types.dart';

class OlxApiService {
  OlxApiService();

  Future<LocationAutocompleteResponse> getLocationSuggestions(
      String query) async {
    try {
      final response = await http.get(Uri.parse(
        'https://www.olx.pl/api/v1/geo-encoder/location-autocomplete/?query=$query',
      ));

      LocationAutocompleteResponse object =
          LocationAutocompleteResponse.fromJson(jsonDecode(response.body));

      return object;
    } on SocketException {
      throw "No internet connection";
    } catch (e) {
      rethrow;
    }
  }

  Future<CategoryResponse> searchCategories(String query) async {
    try {
      final response = await http.get(Uri.parse(
        'https://www.olx.pl/api/v1/seo/similar-searches?query=$query',
      ));

      CategoryResponse object =
          CategoryResponse.fromJson(jsonDecode(response.body));

      return object;
    } on SocketException {
      throw "No internet connection";
    } catch (e) {
      rethrow;
    }
  }
}
