import 'package:get_it/get_it.dart';
import 'package:location/location.dart';
import 'package:quero_cafe/data/datasources/local/location_local_datasource.dart';
import 'package:quero_cafe/data/repositories/location_repository_impl.dart';
import 'package:quero_cafe/domain/repositories/location_repository.dart';
import 'package:quero_cafe/domain/usecases/get_current_location.dart';
import 'package:quero_cafe/domain/usecases/update_location.dart';
import 'package:quero_cafe/presentation/bloc/location/location_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
    () => LocationBloc(
      getCurrentLocation: sl(),
      updateLocation: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetCurrentLocation(sl()));
  sl.registerLazySingleton(() => UpdateLocation(sl()));

  // Repository
  sl.registerLazySingleton<LocationRepository>(
    () => LocationRepositoryImpl(
      localDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<LocationLocalDataSource>(
    () => LocationLocalDataSourceImpl(
      location: sl(),
    ),
  );

  // External
  sl.registerLazySingleton(() => Location());
}
