part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
  @override
  List<Object?> get props => [];
}

class AddItem extends CartEvent {
  final Item item;

  const AddItem(this.item);

  @override
  List<Object?> get props => [item];
}

class RemoveItem extends CartEvent {
  final String itemId;

  const RemoveItem(this.itemId);

  @override
  List<Object?> get props => [itemId];
}

class ChangeQty extends CartEvent {
  final String itemId;
  final int qty;

  const ChangeQty(this.itemId, this.qty);

  @override
  List<Object?> get props => [itemId, qty];
}

class ChangeDiscount extends CartEvent {
  final String itemId;
  final double discount;

  const ChangeDiscount(this.itemId, this.discount);

  @override
  List<Object?> get props => [itemId, discount];
}
