part of 'delivery_cubit.dart';

class DeliveryState extends Equatable {
  final bool isDelivery;

  const DeliveryState({
    this.isDelivery = true,
  });

  @override
  List<Object> get props => [isDelivery];

  DeliveryState copyWith({
    bool? isDelivery,
  }) {
    return DeliveryState(
      isDelivery: isDelivery ?? this.isDelivery,
    );
  }
}
