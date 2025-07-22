import 'package:equatable/equatable.dart';

import '../../catalog/item.dart';

class CartLine extends Equatable {
  final Item item;
  final int qty;
  final double discount;

  const CartLine({required this.item, required this.qty, this.discount = 0.0});

  double get lineNet => item.price * qty * (1 - discount);

  CartLine copyWith({int? qty, double? discount}) {
    return CartLine(
      item: item,
      qty: qty ?? this.qty,
      discount: discount ?? this.discount,
    );
  }

  @override
  List<Object?> get props => [item, qty, discount];
}
