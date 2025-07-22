import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../catalog/item.dart';
import 'models/cart_line.dart';
import 'models/cart_total.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState()) {
    on<AddItem>(_onAddItem);
    on<RemoveItem>(_onRemoveItem);
    on<ChangeQty>(_onChangeQty);
    on<ChangeDiscount>(_onChangeDiscount);
  }

  void _onAddItem(AddItem event, Emitter<CartState> emit) {
    final newLine = CartLine(item: event.item, qty: 1, discount: 0.0);
    emit(state.copyWithLines([...state.lines, newLine]));
  }

  void _onRemoveItem(RemoveItem event, Emitter<CartState> emit) {
    final newLines =
        state.lines.where((l) => l.item.id != event.itemId).toList();
    emit(state.copyWithLines(newLines));
  }

  void _onChangeQty(ChangeQty event, Emitter<CartState> emit) {
    final newLines =
        state.lines.map((l) {
          if (l.item.id == event.itemId) {
            return l.copyWith(qty: event.qty);
          }
          return l;
        }).toList();
    emit(state.copyWithLines(newLines));
  }

  void _onChangeDiscount(ChangeDiscount event, Emitter<CartState> emit) {
    final newLines =
        state.lines.map((l) {
          if (l.item.id == event.itemId) {
            return l.copyWith(discount: event.discount);
          }
          return l;
        }).toList();
    emit(state.copyWithLines(newLines));
  }
}
