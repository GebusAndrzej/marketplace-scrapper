import 'dart:convert';

class LocationAutocompleteResponse {
  List<OlxLocationSuggestion> data;

  LocationAutocompleteResponse({
    required this.data,
  });

  factory LocationAutocompleteResponse.fromRawJson(String str) =>
      LocationAutocompleteResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LocationAutocompleteResponse.fromJson(Map<String, dynamic> json) =>
      LocationAutocompleteResponse(
        data: List<OlxLocationSuggestion>.from(
            json["data"].map((x) => OlxLocationSuggestion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class OlxLocationSuggestion {
  City city;
  County municipality;
  County county;
  Region region;

  OlxLocationSuggestion({
    required this.city,
    required this.municipality,
    required this.county,
    required this.region,
  });

  factory OlxLocationSuggestion.fromRawJson(String str) =>
      OlxLocationSuggestion.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OlxLocationSuggestion.fromJson(Map<String, dynamic> json) =>
      OlxLocationSuggestion(
        city: City.fromJson(json["city"]),
        municipality: County.fromJson(json["municipality"]),
        county: County.fromJson(json["county"]),
        region: Region.fromJson(json["region"]),
      );

  Map<String, dynamic> toJson() => {
        "city": city.toJson(),
        "municipality": municipality.toJson(),
        "county": county.toJson(),
        "region": region.toJson(),
      };
}

class City {
  int id;
  String name;
  String normalizedName;
  double lat;
  double lon;

  City({
    required this.id,
    required this.name,
    required this.normalizedName,
    required this.lat,
    required this.lon,
  });

  factory City.fromRawJson(String str) => City.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
        normalizedName: json["normalized_name"],
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "normalized_name": normalizedName,
        "lat": lat,
        "lon": lon,
      };
}

class County {
  String name;

  County({
    required this.name,
  });

  factory County.fromRawJson(String str) => County.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory County.fromJson(Map<String, dynamic> json) => County(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class Region {
  int id;
  String name;
  String normalizedName;

  Region({
    required this.id,
    required this.name,
    required this.normalizedName,
  });

  factory Region.fromRawJson(String str) => Region.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Region.fromJson(Map<String, dynamic> json) => Region(
        id: json["id"],
        name: json["name"],
        normalizedName: json["normalized_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "normalized_name": normalizedName,
      };
}
