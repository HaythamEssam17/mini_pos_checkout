import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mini_pos_checkout/src/bloc_observer.dart';
import 'package:mini_pos_checkout/src/catalog/catalog_bloc.dart';
import 'package:mini_pos_checkout/src/catalog/catalog_loader.dart';

void main() {
  Bloc.observer = const MultiBlocObserver();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  late final CatalogLoader catalogLoader;
  late final CatalogBloc catalogBloc;

  MyApp({super.key}) {
    catalogLoader = AssetCatalogLoader();
    catalogBloc = CatalogBloc(catalogLoader);
    catalogBloc.stream.listen((event) {});
    catalogBloc.add(LoadCatalog());
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
