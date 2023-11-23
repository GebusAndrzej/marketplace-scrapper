import 'package:flutter/material.dart';
import 'package:olx_bot/services/api/olx/types/category_types.dart';
import 'package:olx_bot/services/api/olx/types/location_types.dart';
import 'package:olx_bot/services/store/olx_store_service.dart';
import 'package:olx_bot/src/pages/create_search/olx/components/olx_category_searchdelegate.dart';

import 'components/olx_city_searchdelegate.dart';

class OlxAddPage extends StatefulWidget {
  const OlxAddPage({super.key});

  @override
  State<OlxAddPage> createState() => _OlxAddPageState();
}

class _OlxAddPageState extends State<OlxAddPage> {
  _OlxAddPageState();

  OlxLocationSuggestion? location;
  OlxCategorySearch? category;

  TextEditingController cityController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController priceTo = TextEditingController();
  TextEditingController priceFrom = TextEditingController();
  bool onlyWithPhotos = false;
  bool withDelivery = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Wyszukiwarka olx"),
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
                    decoration:
                        const InputDecoration(hintText: "Wybierz lokalizację"),
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
                ListTile(
                  leading: const Icon(Icons.category_outlined),
                  title: TextFormField(
                    controller: categoryController,
                    readOnly: true,
                    decoration:
                        const InputDecoration(hintText: "Wybierz kategorię"),
                    onTap: () async {
                      final category = await showSearch(
                        context: context,
                        delegate: OlxCategorySearchDelegate(),
                      );

                      if (category != null) {
                        setState(() {
                          this.category = category;
                        });

                        categoryController.text = category.similarSearch;
                      }
                    },
                  ),
                ),
                ListTile(
                    leading: const Icon(Icons.attach_money_rounded),
                    title: Row(
                      children: [
                        Expanded(
                            child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: priceFrom,
                          decoration:
                              const InputDecoration(hintText: "Cena od"),
                        )),
                        const SizedBox(width: 10),
                        const Text("-"),
                        const SizedBox(width: 10),
                        Expanded(
                            child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: priceTo,
                          decoration:
                              const InputDecoration(hintText: "Cena do"),
                        ))
                      ],
                    )),
                ListTile(
                  leading: const Icon(Icons.photo_outlined),
                  title: CheckboxListTile(
                    title: const Text("Tylko ze zdjęciem"),
                    value: onlyWithPhotos,
                    onChanged: (value) {
                      setState(() => onlyWithPhotos = value!);
                    },
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.mail_outline),
                  title: CheckboxListTile(
                    title: const Text("Dostawa"),
                    value: withDelivery,
                    onChanged: (value) {
                      setState(() => withDelivery = value!);
                    },
                  ),
                ),
                Expanded(child: Container()),
                ListTile(
                    title: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      OlxStoreService().parseConfiguration(
                        location: location!,
                        category: category!,
                        priceFrom: priceFrom.value.text,
                        priceTo: priceTo.value.text,
                        withDelivery: withDelivery,
                        withPhotosOnly: onlyWithPhotos,
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                )),
              ],
            )));
  }
}
