import 'package:equatable/equatable.dart';

import 'cart_line.dart';

class CartTotals extends Equatable {
  final double subtotal;
  final double vat;
  final double grandTotal;

  const CartTotals({
    required this.subtotal,
    required this.vat,
    required this.grandTotal,
  });

  factory CartTotals.fromLines(List<CartLine> lines) {
    final subtotal = lines.fold<double>(0.0, (sum, l) => sum + l.lineNet);
    final vat = double.parse((subtotal * 0.15).toStringAsFixed(2));
    final grandTotal = double.parse((subtotal + vat).toStringAsFixed(2));
    return CartTotals(
      subtotal: double.parse(subtotal.toStringAsFixed(2)),
      vat: vat,
      grandTotal: grandTotal,
    );
  }

  @override
  List<Object?> get props => [subtotal, vat, grandTotal];
}
