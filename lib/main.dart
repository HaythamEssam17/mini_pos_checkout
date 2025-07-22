import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:mini_pos_checkout/src/bloc_observer.dart';
import 'package:mini_pos_checkout/src/cart/cart_bloc.dart';
import 'package:mini_pos_checkout/src/cart/models/cart_line.dart';
import 'package:mini_pos_checkout/src/catalog/catalog_bloc.dart';
import 'package:mini_pos_checkout/src/catalog/catalog_loader.dart';
import 'package:mini_pos_checkout/src/catalog/item.dart';
import 'package:mini_pos_checkout/src/receipt/receipt.dart';

Future<void> main() async {
  Bloc.observer = const MultiBlocObserver();

  final catalogLoader = AssetCatalogLoader();
  final catalogBloc = CatalogBloc(catalogLoader);

  final completer = Completer<void>();

  catalogBloc.stream.listen((state) {
    if (state is CatalogLoaded || state is CatalogError) {
      completer.complete();
    }
  });

  catalogBloc.add(LoadCatalog());

  await completer.future;

  final now = DateTime.now();
  final cartState = CartState(
    lines: [
      CartLine(item: Item('p01', 'Coffee', 2.50), qty: 2),
      CartLine(item: Item('p02', 'Bagel', 3.20), qty: 1, discount: 0.1),
    ],
  );

  final receipt = buildReceipt(cartState, now);
  print(receipt.toString());
}
