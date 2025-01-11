import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(const LocationState());

  void updateLocation(double latitude, double longitude) {
    emit(state.copyWith(
      latitude: latitude,
      longitude: longitude,
      address: 'Seçilen Konum',
      isLoading: false,
    ));
  }

  void clearLocation() {
    emit(const LocationState());
  }
}
