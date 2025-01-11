part of 'cart_cubit.dart';

class CartState extends Equatable {
  final List<CartItem> items;

  const CartState({
    this.items = const [],
  });

  @override
  List<Object> get props => [items];

  CartState copyWith({
    List<CartItem>? items,
  }) {
    return CartState(
      items: items ?? this.items,
    );
  }
} 