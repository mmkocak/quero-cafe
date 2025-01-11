import 'package:dartz/dartz.dart';
import 'package:quero_cafe/core/error/failures.dart';
import 'package:quero_cafe/domain/entities/location.dart';
import 'package:quero_cafe/domain/repositories/location_repository.dart';

class UpdateLocation {
  final LocationRepository repository;

  UpdateLocation(this.repository);

  Future<Either<Failure, Location>> call(Location location) async {
    return await repository.updateLocation(location);
  }
}
