import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mini_pos_checkout/src/bloc_observer.dart';
import 'package:mini_pos_checkout/src/cart/cart_bloc.dart';
import 'package:mini_pos_checkout/src/cart/models/cart_line.dart';
import 'package:mini_pos_checkout/src/catalog/catalog_bloc.dart';
import 'package:mini_pos_checkout/src/catalog/catalog_loader.dart';
import 'package:mini_pos_checkout/src/catalog/item.dart';
import 'package:mini_pos_checkout/src/receipt/receipt.dart';

void main() {
  Bloc.observer = const MultiBlocObserver();

  final catalogLoader = AssetCatalogLoader();
  final catalogBloc = CatalogBloc(catalogLoader)..add(LoadCatalog());

  final now = DateTime.now();
  final cartState = CartState(
    lines: [
      CartLine(item: Item('p01', 'Coffee', 2.50), qty: 2),
      CartLine(item: Item('p02', 'Bagel', 3.20), qty: 1, discount: 0.1),
    ],
  );

  final receipt = buildReceipt(cartState, now);

  print(receipt.toString());

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
