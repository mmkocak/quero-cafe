import 'package:flutter_bloc/flutter_bloc.dart';

part 'coffee_size_state.dart';

class CoffeeSizeCubit extends Cubit<CoffeeSizeState> {
  CoffeeSizeCubit() : super(const CoffeeSizeState(selectedSize: 'P'));

  void selectSize(String size) {
    emit(CoffeeSizeState(selectedSize: size));
  }
} 