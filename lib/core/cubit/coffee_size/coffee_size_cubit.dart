import 'package:flutter_bloc/flutter_bloc.dart';

part 'coffee_size_state.dart';

class CoffeeSizeCubit extends Cubit<CoffeeSizeState> {
  CoffeeSizeCubit() : super(const CoffeeSizeState(
    selectedSize: 'P',
    priceMultiplier: 1.0,
  ));

  void selectSize(String size) {
    double multiplier = 1.0;
    switch (size) {
      case 'P':
        multiplier = 1.0;
        break;
      case 'M':
        multiplier = 1.2; // %20 artış
        break;
      case 'G':
        multiplier = 1.5; // %50 artış
        break;
    }
    emit(CoffeeSizeState(
      selectedSize: size,
      priceMultiplier: multiplier,
    ));
  }
} 