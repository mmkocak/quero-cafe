part of 'cart_cubit.dart';

class CartState extends Equatable {
  final List<CartItem> items;
  final double totalPrice;
  final double deliveryFee;

  const CartState({
    this.items = const [],
    this.totalPrice = 0.0,
    this.deliveryFee = 0.0,
  });

  double get finalTotal => totalPrice + deliveryFee;

  @override
  List<Object> get props => [items, totalPrice, deliveryFee];

  CartState copyWith({
    List<CartItem>? items,
    double? totalPrice,
    double? deliveryFee,
  }) {
    return CartState(
      items: items ?? this.items,
      totalPrice: totalPrice ?? this.totalPrice,
      deliveryFee: deliveryFee ?? this.deliveryFee,
    );
  }
}