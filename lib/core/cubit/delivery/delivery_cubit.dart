import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'delivery_state.dart';

class DeliveryCubit extends Cubit<DeliveryState> {
  DeliveryCubit() : super(const DeliveryState());

  void toggleDelivery(bool isDelivery) {
    emit(DeliveryState(isDelivery: isDelivery));
  }
}
