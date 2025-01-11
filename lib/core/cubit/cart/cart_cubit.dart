import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quero_cafe/core/models/cart_item.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());

  double _calculateTotalPrice(List<CartItem> items) {
    if (items.isEmpty) return 0.0;
    return items.fold<double>(0.0, (sum, item) => sum + item.totalPrice);
  }

  void _emitNewState(List<CartItem> items) {
    final totalPrice = _calculateTotalPrice(items);
    emit(CartState(
      items: List<CartItem>.from(items),
      totalPrice: totalPrice,
      deliveryFee: 0.0,
    ));
  }

  void addToCart(CartItem item) {
    final currentItems = List<CartItem>.from(state.items);
    final existingItemIndex = currentItems.indexWhere(
        (i) => i.id == item.id && i.size == item.size);

    if (existingItemIndex != -1) {
      final existingItem = currentItems[existingItemIndex];
      currentItems[existingItemIndex] = existingItem.copyWith(
        quantity: existingItem.quantity + 1,
      );
    } else {
      currentItems.add(item);
    }

    _emitNewState(currentItems);
  }

  void removeFromCart(String itemId) {
    final currentItems = List<CartItem>.from(state.items);
    currentItems.removeWhere((item) => item.id == itemId);
    _emitNewState(currentItems);
  }

  void updateQuantity(String itemId, int quantity) {
    if (quantity < 1) return;

    final currentItems = List<CartItem>.from(state.items);
    final itemIndex = currentItems.indexWhere((item) => item.id == itemId);

    if (itemIndex != -1) {
      final item = currentItems[itemIndex];
      currentItems[itemIndex] = item.copyWith(quantity: quantity);
      _emitNewState(currentItems);
    }
  }

  void incrementQuantity(String itemId) {
    final currentItems = List<CartItem>.from(state.items);
    final itemIndex = currentItems.indexWhere((item) => item.id == itemId);

    if (itemIndex != -1) {
      final item = currentItems[itemIndex];
      currentItems[itemIndex] = item.copyWith(
        quantity: item.quantity + 1,
      );
      _emitNewState(currentItems);
    }
  }

  void decrementQuantity(String itemId) {
    final currentItems = List<CartItem>.from(state.items);
    final itemIndex = currentItems.indexWhere((item) => item.id == itemId);

    if (itemIndex != -1) {
      final item = currentItems[itemIndex];
      if (item.quantity > 1) {
        currentItems[itemIndex] = item.copyWith(
          quantity: item.quantity - 1,
        );
      } else {
        currentItems.removeAt(itemIndex);
      }
      _emitNewState(currentItems);
    }
  }

  double get deliveryFee => state.deliveryFee;
  double get originalDeliveryFee => 0.0;
  double get finalTotal => state.totalPrice + state.deliveryFee;
}
