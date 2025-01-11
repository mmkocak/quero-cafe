import 'package:dartz/dartz.dart';
import 'package:quero_cafe/core/error/exceptions.dart';
import 'package:quero_cafe/core/error/failures.dart';
import 'package:quero_cafe/data/datasources/local/location_local_datasource.dart';
import 'package:quero_cafe/data/models/location_model.dart';
import 'package:quero_cafe/domain/entities/location.dart';
import 'package:quero_cafe/domain/repositories/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationLocalDataSource localDataSource;

  LocationRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, Location>> getCurrentLocation() async {
    try {
      final locationModel = await localDataSource.getCurrentLocation();
      return Right(locationModel);
    } on LocationException catch (e) {
      return Left(LocationFailure(e.message ?? 'Failed to get location'));
    } on PermissionException catch (e) {
      return Left(PermissionFailure(e.message ?? 'Permission denied'));
    } catch (e) {
      return Left(LocationFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Location>> updateLocation(Location location) async {
    try {
      final locationModel = LocationModel(
        coordinates: location.coordinates,
        address: location.address,
        isManualSelection: location.isManualSelection,
      );
      final updatedLocation = await localDataSource.updateLocation(locationModel);
      return Right(updatedLocation);
    } catch (e) {
      return Left(LocationFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> clearLocation() async {
    try {
      await localDataSource.clearLocation();
      return const Right(null);
    } catch (e) {
      return Left(LocationFailure(e.toString()));
    }
  }
}
