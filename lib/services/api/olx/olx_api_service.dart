import 'dart:convert';
import 'dart:io';

import 'package:olx_bot/services/api/olx/types.dart';
import 'package:http/http.dart' as http;

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
}
