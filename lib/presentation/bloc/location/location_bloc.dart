import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quero_cafe/domain/entities/location.dart';
import 'package:quero_cafe/domain/usecases/get_current_location.dart';
import 'package:quero_cafe/domain/usecases/update_location.dart';
import 'package:quero_cafe/presentation/bloc/location/location_event.dart';
import 'package:quero_cafe/presentation/bloc/location/location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GetCurrentLocation getCurrentLocation;
  final UpdateLocation updateLocation;

  LocationBloc({
    required this.getCurrentLocation,
    required this.updateLocation,
  }) : super(LocationInitial()) {
    on<GetCurrentLocationEvent>(_onGetCurrentLocation);
    on<UpdateLocationEvent>(_onUpdateLocation);
    on<ClearLocationEvent>(_onClearLocation);
  }

  Future<void> _onGetCurrentLocation(
    GetCurrentLocationEvent event,
    Emitter<LocationState> emit,
  ) async {
    emit(LocationLoading());
    final result = await getCurrentLocation();
    result.fold(
      (failure) => emit(LocationError(failure.message ?? 'Failed to get location')),
      (location) => emit(LocationLoaded(location)),
    );
  }

  Future<void> _onUpdateLocation(
    UpdateLocationEvent event,
    Emitter<LocationState> emit,
  ) async {
    emit(LocationLoading());
    final location = Location(
      coordinates: event.coordinates,
      isManualSelection: event.isManualSelection,
    );
    final result = await updateLocation(location);
    result.fold(
      (failure) => emit(LocationError(failure.message ?? 'Failed to update location')),
      (location) => emit(LocationLoaded(location)),
    );
  }

  Future<void> _onClearLocation(
    ClearLocationEvent event,
    Emitter<LocationState> emit,
  ) async {
    emit(LocationInitial());
  }
}
