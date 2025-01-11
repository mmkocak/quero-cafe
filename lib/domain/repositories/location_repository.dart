import 'package:dartz/dartz.dart';
import 'package:quero_cafe/core/error/failures.dart';
import 'package:quero_cafe/domain/entities/location.dart';

abstract class LocationRepository {
  Future<Either<Failure, Location>> getCurrentLocation();
  Future<Either<Failure, Location>> updateLocation(Location location);
  Future<Either<Failure, void>> clearLocation();
}
