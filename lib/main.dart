import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mini_pos_checkout/src/bloc_observer.dart';
import 'package:mini_pos_checkout/src/catalog/catalog_bloc.dart';
import 'package:mini_pos_checkout/src/catalog/catalog_loader.dart';

void main() {
  Bloc.observer = const MultiBlocObserver();

  final catalogLoader = AssetCatalogLoader();
  final catalogBloc = CatalogBloc(catalogLoader)..add(LoadCatalog());

  runApp(MyApp(catalogBloc: catalogBloc));
}

class MyApp extends StatelessWidget {
  final CatalogBloc catalogBloc;

  const MyApp({super.key, required this.catalogBloc});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
