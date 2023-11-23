import 'dart:developer';

import 'package:olx_bot/services/api/olx/types/category_types.dart';
import 'package:olx_bot/services/api/olx/types/location_types.dart';

class OlxStoreService {
  static final OlxStoreService _singleton = OlxStoreService._internal();

  factory OlxStoreService() {
    return _singleton;
  }

  OlxStoreService._internal() {
    // Initialization
  }

  parseConfiguration({
    required OlxLocationSuggestion location,
    required OlxCategorySearch category,
    required String priceFrom,
    required String priceTo,
    bool? withPhotosOnly,
    bool? withDelivery,
  }) {
    Map<String, String> queryParamsMap = {
      'category_id': category.categoryId.toString(),
      'region_id': location.region.id.toString(),
      'city_id': location.city.id.toString(),
      //
      'offset': '0',
      'limit': '40',
    };

    if (priceFrom != '') {
      queryParamsMap.addAll({'filter_float_price:from': priceFrom});
    }

    if (priceTo != '') {
      queryParamsMap.addAll({'filter_float_price:to': priceTo});
    }

    if (withPhotosOnly != null && withPhotosOnly) {
      queryParamsMap.addAll({'photos': withPhotosOnly.toString()});
    }

    if (withDelivery != null && withDelivery) {
      queryParamsMap.addAll({'delivery': withDelivery.toString()});
    }

    final url = Uri.http('www.olx.pl', 'api/v1/offers', queryParamsMap);

    print(url);
    inspect(url.toString());
  }
}
