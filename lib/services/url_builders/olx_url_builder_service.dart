import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:olx_bot/hive_model/watcher_url.dart';
import 'package:olx_bot/services/api/olx/types/category_types.dart';
import 'package:olx_bot/services/api/olx/types/location_types.dart';
import 'package:olx_bot/services/store/watcher_url_store_service.dart';

import '../../config/consts.dart';

class OlxUrlBuilderService {
  static final OlxUrlBuilderService _singleton =
      OlxUrlBuilderService._internal();

  factory OlxUrlBuilderService() {
    return _singleton;
  }

  OlxUrlBuilderService._internal() {
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

    WatcherUrl watcher = WatcherUrl(
        name: '${location.city.normalizedName} - ${category.similarSearch}',
        service: WATCHER_SERVICE.OLX.index,
        url: url.toString(),
        active: true,
        id: UniqueKey().toString());

    return WatcherUrlStore().createWatcher(watcher);
  }
}
