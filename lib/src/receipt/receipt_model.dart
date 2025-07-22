import '../cart/models/cart_line.dart';

class ReceiptModel {
  final DateTime dateTime;
  final List<CartLine> lines;
  final double subtotal;
  final double vat;
  final double grandTotal;

  ReceiptModel({
    required this.dateTime,
    required this.lines,
    required this.subtotal,
    required this.vat,
    required this.grandTotal,
  });

  @override
  String toString() {
    return '''
            Receipt:
            Date: $dateTime
            Items: ${lines.length}
            Subtotal: \$${subtotal.toStringAsFixed(2)}
            VAT: \$${vat.toStringAsFixed(2)}
            Total: \$${grandTotal.toStringAsFixed(2)}
           ''';
  }
}
