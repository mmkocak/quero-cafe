import 'package:dartz/dartz.dart';
import 'package:quero_cafe/core/error/failures.dart';
import 'package:quero_cafe/domain/entities/location.dart';
import 'package:quero_cafe/domain/repositories/location_repository.dart';

class GetCurrentLocation {
  final LocationRepository repository;

  GetCurrentLocation(this.repository);

  Future<Either<Failure, Location>> call() async {
    return await repository.getCurrentLocation();
  }
}
