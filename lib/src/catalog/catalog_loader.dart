import 'package:flutter/services.dart';

abstract class CatalogLoader {
  Future<String> loadCatalogJson();
}

class AssetCatalogLoader implements CatalogLoader {
  @override
  Future<String> loadCatalogJson() {
    return rootBundle.loadString('assets/json/catalog.json');
  }
}
