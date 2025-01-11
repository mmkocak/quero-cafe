import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quero_cafe/core/models/cart_item.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());

  void addToCart(CartItem item) {
    final currentItems = List<CartItem>.from(state.items);
    final existingItemIndex = currentItems.indexWhere((i) => 
      i.id == item.id && i.size == item.size
    );

    if (existingItemIndex != -1) {
      currentItems[existingItemIndex].quantity += 1;
    } else {
      currentItems.add(item);
    }

    emit(state.copyWith(items: currentItems));
  }

  void removeFromCart(String itemId) {
    final currentItems = List<CartItem>.from(state.items);
    currentItems.removeWhere((item) => item.id == itemId);
    emit(state.copyWith(items: currentItems));
  }

  void updateQuantity(String itemId, int quantity) {
    if (quantity < 1) return;
    
    final currentItems = List<CartItem>.from(state.items);
    final itemIndex = currentItems.indexWhere((item) => item.id == itemId);
    
    if (itemIndex != -1) {
      currentItems[itemIndex].quantity = quantity;
      emit(state.copyWith(items: currentItems));
    }
  }

  void incrementQuantity(String itemId) {
    final currentItems = List<CartItem>.from(state.items);
    final itemIndex = currentItems.indexWhere((item) => item.id == itemId);
    
    if (itemIndex != -1) {
      currentItems[itemIndex].quantity += 1;
      emit(state.copyWith(items: currentItems));
    }
  }

  void decrementQuantity(String itemId) {
    final currentItems = List<CartItem>.from(state.items);
    final itemIndex = currentItems.indexWhere((item) => item.id == itemId);
    
    if (itemIndex != -1) {
      if (currentItems[itemIndex].quantity > 1) {
        currentItems[itemIndex].quantity -= 1;
      } else {
        currentItems.removeAt(itemIndex);
      }
      emit(state.copyWith(items: currentItems));
    }
  }

  double get totalPrice {
    return state.items.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  double get deliveryFee => 10.0;
  double get originalDeliveryFee => 30.0;
  
  double get finalTotal => totalPrice + deliveryFee;
} 