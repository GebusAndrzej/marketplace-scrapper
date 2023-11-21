import 'dart:convert';

class CategoryResponse {
  CategoryData data;

  CategoryResponse({
    required this.data,
  });

  factory CategoryResponse.fromRawJson(String str) =>
      CategoryResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      CategoryResponse(
        data: CategoryData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class CategoryData {
  List<OlxCategorySearch> searches;

  CategoryData({
    required this.searches,
  });

  factory CategoryData.fromRawJson(String str) =>
      CategoryData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        searches: List<OlxCategorySearch>.from(
            json["searches"].map((x) => OlxCategorySearch.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "searches": List<dynamic>.from(searches.map((x) => x.toJson())),
      };
}

class OlxCategorySearch {
  String similarSearch;
  int categoryId;
  String href;

  OlxCategorySearch({
    required this.similarSearch,
    required this.categoryId,
    required this.href,
  });

  factory OlxCategorySearch.fromRawJson(String str) =>
      OlxCategorySearch.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OlxCategorySearch.fromJson(Map<String, dynamic> json) =>
      OlxCategorySearch(
        similarSearch: json["similar_search"],
        categoryId: json["category_id"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "similar_search": similarSearch,
        "category_id": categoryId,
        "href": href,
      };
}
