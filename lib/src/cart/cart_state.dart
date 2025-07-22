part of 'cart_bloc.dart';

class CartState extends Equatable {
  final List<CartLine> lines;
  final CartTotals totals;

  CartState({this.lines = const []}) : totals = CartTotals.fromLines(lines);

  CartState copyWithLines(List<CartLine> newLines) {
    return CartState(lines: newLines);
  }

  @override
  List<Object?> get props => [lines, totals];
}
