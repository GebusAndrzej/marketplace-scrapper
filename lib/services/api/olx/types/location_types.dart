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
  OlxCity city;
  OlxCounty municipality;
  OlxCounty county;
  OlxRegion region;

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
        city: OlxCity.fromJson(json["city"]),
        municipality: OlxCounty.fromJson(json["municipality"]),
        county: OlxCounty.fromJson(json["county"]),
        region: OlxRegion.fromJson(json["region"]),
      );

  Map<String, dynamic> toJson() => {
        "city": city.toJson(),
        "municipality": municipality.toJson(),
        "county": county.toJson(),
        "region": region.toJson(),
      };
}

class OlxCity {
  int id;
  String name;
  String normalizedName;
  double lat;
  double lon;

  OlxCity({
    required this.id,
    required this.name,
    required this.normalizedName,
    required this.lat,
    required this.lon,
  });

  factory OlxCity.fromRawJson(String str) => OlxCity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OlxCity.fromJson(Map<String, dynamic> json) => OlxCity(
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

class OlxCounty {
  String name;

  OlxCounty({
    required this.name,
  });

  factory OlxCounty.fromRawJson(String str) =>
      OlxCounty.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OlxCounty.fromJson(Map<String, dynamic> json) => OlxCounty(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class OlxRegion {
  int id;
  String name;
  String normalizedName;

  OlxRegion({
    required this.id,
    required this.name,
    required this.normalizedName,
  });

  factory OlxRegion.fromRawJson(String str) =>
      OlxRegion.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OlxRegion.fromJson(Map<String, dynamic> json) => OlxRegion(
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
