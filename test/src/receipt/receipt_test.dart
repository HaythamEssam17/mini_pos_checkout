import 'package:flutter_test/flutter_test.dart';
import 'package:mini_pos_checkout/src/cart/cart_bloc.dart';
import 'package:mini_pos_checkout/src/cart/models/cart_line.dart';
import 'package:mini_pos_checkout/src/catalog/item.dart';
import 'package:mini_pos_checkout/src/receipt/receipt.dart';
import 'package:mini_pos_checkout/src/receipt/receipt_model.dart';

void main() {
  group('buildReceipt', () {
    test('creates ReceiptModel with correct values from CartState', () {
      // arrange
      final item1 = Item('1', 'Item 1', 100);
      final item2 = Item('2', 'Item 2', 50);
      final lines = [
        CartLine(item: item1, qty: 1, discount: 0.0), // 100
        CartLine(item: item2, qty: 2, discount: 0.1), // 50 * 0.9 = 45 * 2 = 90
      ];

      final expectedSubtotal = 190.0; // 100 + 90
      final expectedVat = expectedSubtotal * 0.15; // assuming 15%
      final expectedTotal = expectedSubtotal + expectedVat;

      final state = CartState(lines: lines);
      final now = DateTime.now();

      // act
      final receipt = buildReceipt(state, now);

      // assert
      expect(receipt.dateTime, now);
      expect(receipt.lines, lines);
      expect(receipt.subtotal, expectedSubtotal);
      expect(receipt.vat, expectedVat);
      expect(receipt.grandTotal, expectedTotal);
    });

    test('toString returns a formatted receipt', () {
      // arrange
      final item = Item('1', 'Banana', 10);
      final lines = [
        CartLine(item: item, qty: 2, discount: 0.0), // 10 * 2 = 20
      ];

      final subtotal = 20.0;
      final vat = 2.8;
      final grandTotal = 22.8;
      final dateTime = DateTime(2024, 1, 1, 12, 0);

      final receipt = ReceiptModel(
        dateTime: dateTime,
        lines: lines,
        subtotal: subtotal,
        vat: vat,
        grandTotal: grandTotal,
      );

      // act
      final output = receipt.toString();

      // assert
      expect(output, contains('Receipt:'));
      expect(output, contains('Date: 2024-01-01 12:00:00.000'));
      expect(output, contains('Items: 1'));
      expect(output, contains('Subtotal: \$20.00'));
      expect(output, contains('VAT: \$2.80'));
      expect(output, contains('Total: \$22.80'));
    });
  });
}
