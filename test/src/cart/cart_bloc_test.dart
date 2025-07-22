import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_pos_checkout/src/cart/cart_bloc.dart';
import 'package:mini_pos_checkout/src/cart/models/cart_line.dart';
import 'package:mini_pos_checkout/src/catalog/item.dart';

void main() {
  group('CartBloc', () {
    late CartBloc bloc;

    final item1 = Item('1', 'Item 1', 10.0);
    final item2 = Item('2', 'Item 2', 20.0);

    setUp(() {
      bloc = CartBloc();
    });

    tearDown(() => bloc.close());

    test('initial state is empty CartState', () {
      expect(bloc.state.lines, isEmpty);
    });

    blocTest<CartBloc, CartState>(
      'adds an item to the cart',
      build: () => CartBloc(),
      act: (bloc) => bloc.add(AddItem(item1)),
      expect:
          () => [
            isA<CartState>().having((s) => s.lines.length, 'line count', 1),
          ],
    );

    blocTest<CartBloc, CartState>(
      'removes an item from the cart',
      build: () => CartBloc(),
      seed:
          () =>
              CartState(lines: [CartLine(item: item1, qty: 1, discount: 0.0)]),
      act: (bloc) => bloc.add(RemoveItem(item1.id)),
      expect: () => [isA<CartState>().having((s) => s.lines, 'lines', isEmpty)],
    );

    blocTest<CartBloc, CartState>(
      'changes quantity of an item',
      build: () => CartBloc(),
      seed:
          () =>
              CartState(lines: [CartLine(item: item1, qty: 1, discount: 0.0)]),
      act: (bloc) => bloc.add(ChangeQty(item1.id, 3)),
      expect:
          () => [isA<CartState>().having((s) => s.lines.first.qty, 'qty', 3)],
    );

    blocTest<CartBloc, CartState>(
      'changes discount of an item',
      build: () => CartBloc(),
      seed:
          () =>
              CartState(lines: [CartLine(item: item1, qty: 1, discount: 0.0)]),
      act: (bloc) => bloc.add(ChangeDiscount(item1.id, 0.2)),
      expect:
          () => [
            isA<CartState>().having(
              (s) => s.lines.first.discount,
              'discount',
              0.2,
            ),
          ],
    );
  });
}
