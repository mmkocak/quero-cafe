import 'package:equatable/equatable.dart';

class CartItem extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String? size;
  final int quantity;

  const CartItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.size,
    this.quantity = 1,
  });

  CartItem copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? imageUrl,
    String? size,
    int? quantity,
  }) {
    return CartItem(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      size: size ?? this.size,
      quantity: quantity ?? this.quantity,
    );
  }

  double get totalPrice => (price * quantity).toDouble();

  @override
  List<Object?> get props => [id, name, description, price, imageUrl, size, quantity];
}