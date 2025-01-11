class CartItem {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String? size;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.size,
    this.quantity = 1,
  });

  double get totalPrice => price * quantity;
} 