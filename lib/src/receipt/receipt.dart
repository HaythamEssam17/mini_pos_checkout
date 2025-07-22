import 'package:mini_pos_checkout/src/receipt/receipt_model.dart';

import '../cart/cart_bloc.dart';

ReceiptModel buildReceipt(CartState cartState, DateTime dateTime) {
  return ReceiptModel(
    dateTime: dateTime,
    lines: cartState.lines,
    subtotal: cartState.totals.subtotal,
    vat: cartState.totals.vat,
    grandTotal: cartState.totals.grandTotal,
  );
}
